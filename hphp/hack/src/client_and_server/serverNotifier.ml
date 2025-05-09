(*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

open Hh_prelude

type changes =
  | Unavailable
      (** e.g. because DFind is not available, or watchman subscription is down *)
  | SyncChanges of SSet.t
      (** contains all changes up to the point that the notifier was invoked *)
  | AsyncChanges of SSet.t
      (** contains some of the changes up to the point that the notifier was invoked,
          but there may be more pending changes that have not been included *)

type clock = ServerNotifierTypes.clock = Watchman of Watchman.clock
[@@deriving show, eq]

let watchman_clock_of_clock = function
  | ServerNotifierTypes.Watchman clock -> clock

type t =
  | IndexOnly of { root: Path.t }
  | Dfind of {
      root: Path.t;
      ready: bool ref;
      dfind: DfindLib.t;
    }
  | Watchman of {
      wenv: Watchman.env;
      watchman: Watchman.watchman_instance ref;
          (** Watchman state can change during requests (see Watchamn.Watchman_dead and Watchman_alive).
          This reference will be updated as necessary to the new instance. *)
      root: Path.t;
      local_config: ServerLocalConfig.t;
      num_workers: int;
    }
  | MockChanges of {
      get_changes_async: unit -> changes;
      get_changes_sync: unit -> SSet.t;
    }

type indexer = (string -> bool) -> unit -> string list

(** This returns an "indexer", i.e. unit -> string list, which when invoked
will return all files under root. *)
let indexer (t : t) (filter : string -> bool) : unit -> string list =
  match t with
  | Dfind { root; _ }
  | IndexOnly { root; _ } ->
    Find.make_next_files ~name:"root" ~filter root
  | MockChanges _ -> failwith "indexer not mocked"
  | Watchman { wenv; num_workers; _ } ->
    let files = Watchman.get_all_files wenv in
    Bucket.make_list ~num_workers (List.filter ~f:filter files)

let init
    (options : ServerArgs.options)
    (local_config : ServerLocalConfig.t)
    ~(num_workers : int) : t * indexer =
  let root = ServerArgs.root options in
  let ServerLocalConfig.Watchman.
        { enabled; sockname; subscribe; init_timeout; debug_logging; _ } =
    local_config.ServerLocalConfig.watchman
  in

  (* helper to construct Dfind *)
  let init_dfind () =
    Hh_logger.log "Using dfind";
    let in_fd = Daemon.null_fd () in
    let log_link = ServerFiles.dfind_log root in
    let log_file = Sys_utils.make_link_of_timestamped log_link in
    let log_fd = Daemon.fd_of_path log_file in
    let dfind =
      DfindLib.init
        (in_fd, log_fd, log_fd)
        (GlobalConfig.scuba_table_name, [root])
    in
    Dfind { root; ready = ref false; dfind }
  in

  (* helper to try to construct Watchman, or return None if failed *)
  let try_init_watchman () =
    Hh_logger.log "Using watchman";
    let wenv =
      Watchman.init
        {
          Watchman.init_timeout = Watchman.Explicit_timeout (float init_timeout);
          subscribe_mode =
            (if subscribe then
              Some Watchman.Defer_changes
            else
              None);
          expression_terms = FilesToIgnore.watchman_server_expression_terms;
          debug_logging =
            ServerArgs.watchman_debug_logging options || debug_logging;
          sockname;
          subscription_prefix = "hh_type_check_watcher";
          roots = [root];
        }
        ()
    in
    Option.map wenv ~f:(fun wenv ->
        HackEventLogger.set_use_watchman ();
        Watchman
          {
            wenv;
            watchman = ref (Watchman.Watchman_alive wenv);
            root;
            local_config;
            num_workers;
          })
  in

  let notifier =
    if ServerArgs.check_mode options then begin
      Hh_logger.log "Not using dfind or watchman";
      IndexOnly { root }
    end else if not enabled then
      init_dfind ()
    else
      match try_init_watchman () with
      | Some t -> t
      | None -> init_dfind ()
  in
  (notifier, indexer notifier)

let init_mock
    ~(get_changes_async : unit -> changes) ~(get_changes_sync : unit -> SSet.t)
    : t =
  MockChanges { get_changes_async; get_changes_sync }

let init_null () : t =
  let f () = SyncChanges SSet.empty in
  let g () = SSet.empty in
  init_mock ~get_changes_async:f ~get_changes_sync:g

let wait_until_ready (t : t) : unit =
  match t with
  | Dfind { ready; dfind; _ } ->
    if !ready then
      ()
    else begin
      DfindLib.wait_until_ready dfind;
      ready := true
    end
  | IndexOnly _ -> ()
  | MockChanges _ -> ()
  | Watchman _ ->
    (* The initial watch-project command blocks until watchman's crawl is
       done, so we don't have anything else to wait for here. *)
    ()

(** Helper conversion function, from a single watchman-changes to a set of changed
    files. Also handles informing ServerRevisionTracker about changes *)
let convert_watchman_changes
    ~(root : Path.t)
    ~(local_config : ServerLocalConfig.t)
    (watchman_changes : Watchman.pushed_changes) : SSet.t =
  match watchman_changes with
  | Watchman.Changed_merge_base _ ->
    let () =
      Hh_logger.log "Error: Typechecker does not use Source Control Aware mode"
    in
    raise Exit_status.(Exit_with Watchman_invalid_result)
  | Watchman.State_enter (name, _metadata) ->
    if local_config.ServerLocalConfig.hg_aware then
      ServerRevisionTracker.on_state_enter name;
    SSet.empty
  | Watchman.State_leave (name, metadata) ->
    if local_config.ServerLocalConfig.hg_aware then
      ServerRevisionTracker.on_state_leave root name metadata;
    SSet.empty
  | Watchman.Files_changed changes ->
    ServerRevisionTracker.files_changed local_config (SSet.cardinal changes);
    changes

let get_changes_sync (t : t) : SSet.t * clock option =
  match t with
  | IndexOnly _ -> (SSet.empty, None)
  | MockChanges { get_changes_sync; _ } -> (get_changes_sync (), None)
  | Dfind { dfind; _ } ->
    let set =
      try
        Timeout.with_timeout
          ~timeout:120
          ~on_timeout:(fun (_ : Timeout.timings) ->
            Exit.exit Exit_status.Dfind_unresponsive)
          ~do_:(fun _timeout -> DfindLib.get_changes dfind)
      with
      | _ -> Exit.exit Exit_status.Dfind_died
    in
    (set, None)
  | Watchman { local_config; watchman; root; _ } ->
    let (watchman', changes) =
      Watchman.get_changes_synchronously
        ~timeout:
          local_config.ServerLocalConfig.watchman
            .ServerLocalConfig.Watchman.synchronous_timeout
        !watchman
    in
    watchman := watchman';
    let changes =
      List.fold_left changes ~init:SSet.empty ~f:(fun acc c ->
          SSet.union acc (convert_watchman_changes ~root ~local_config c))
    in
    let clock = Watchman.get_clock !watchman in
    (changes, Some (Watchman clock))

let get_changes_async (t : t) : changes * clock option =
  match t with
  | IndexOnly _ -> (SyncChanges SSet.empty, None)
  | MockChanges { get_changes_async; _ } -> (get_changes_async (), None)
  | Dfind _ ->
    let (changes, _) = get_changes_sync t in
    (SyncChanges changes, None)
  | Watchman { watchman; root; local_config; _ } ->
    let (watchman', changes) = Watchman.get_changes !watchman in
    watchman := watchman';
    let changes =
      match changes with
      | Watchman.Watchman_unavailable -> Unavailable
      | Watchman.Watchman_pushed changes ->
        AsyncChanges (convert_watchman_changes ~root ~local_config changes)
      | Watchman.Watchman_synchronous changes ->
        let accumulated_changes =
          List.fold_left changes ~init:SSet.empty ~f:(fun acc c ->
              SSet.union acc (convert_watchman_changes ~root ~local_config c))
        in
        SyncChanges accumulated_changes
    in
    let clock = Watchman.get_clock !watchman in
    (changes, Some (Watchman clock))

let async_reader_opt (t : t) : Buffered_line_reader.t option =
  match t with
  | Dfind _
  | IndexOnly _ ->
    None
  | MockChanges _ -> None
  | Watchman { watchman; _ } -> Watchman.get_reader !watchman
