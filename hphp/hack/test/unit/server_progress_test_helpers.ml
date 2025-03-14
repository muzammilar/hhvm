(*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

open Hh_prelude
open Asserter

let show_errors
    (errors : (Errors.finalized_error * int) list Relative_path.Map.t) : string
    =
  let counts =
    errors
    |> Relative_path.Map.bindings
    |> List.map ~f:(fun (path, errors) ->
           Printf.sprintf
             "%s=%d"
             (Relative_path.suffix path)
             (List.length errors))
    |> String.concat ~sep:","
  in
  Printf.sprintf "Errors [%s]" counts

let show_read_result = function
  | Server_progress.ErrorsRead.RCompleted (completion, msg) ->
    Printf.sprintf
      "%s [%s]"
      (Server_progress.completion_reason_short_description completion)
      msg
  | Server_progress.ErrorsRead.RItem item ->
    (match item with
    | Server_progress.Errors { errors; timestamp = _ } -> show_errors errors
    | Server_progress.Telemetry telemetry ->
      let key =
        match Telemetry.to_json telemetry with
        | Hh_json.JSON_Object elems ->
          let keys =
            List.map elems ~f:fst |> List.sort ~compare:String.compare
          in
          List.hd keys |> Option.value ~default:"[]"
        | _ -> "[primitive]"
      in
      Printf.sprintf "Telemetry [%s]" key)

let show_read
    (read :
      ( Server_progress.ErrorsRead.read_result option,
        Server_progress.errors_file_read_error )
      result) : string =
  match read with
  | Error Server_progress.Malformed -> "malformed error"
  | Ok None -> "nothing yet"
  | Ok (Some res) -> show_read_result res

(** Reading from ShowProgressLwt.watch_errors_file is inherently racey:
our test might insert an item into the errors file, but there'll be some time
before the disk change is reflected as an item in the Lwt_stream.
This function will wait up to 10 seconds for something to appear.

For convenience, this function flattens all results into a string:
* if nothing has appeared on the stream by the timeout, return the string "nothing"
* if the stream has been closed by the timeout, return the string "closed"
* if an item appeared on the stream by the timeout, return the string from the callback (f item)
*)
let expect_qitem
    ?(delay : float = 10.0)
    (q :
      ( Server_progress.ErrorsRead.read_result,
        Server_progress_lwt.watch_error )
      result
      Lwt_stream.t)
    (expected : string) : unit Lwt.t =
  let%lwt r =
    Lwt.pick
      [
        Lwt_stream.get q |> Lwt.map (fun i -> Ok i);
        Lwt_unix.sleep delay |> Lwt.map (fun () -> Error ());
      ]
  in
  let actual =
    match r with
    | Error () -> "nothing"
    | Ok None -> "closed"
    | Ok (Some item) ->
      (match item with
      | Error watch_error ->
        Server_progress_lwt.watch_error_short_description watch_error
      | Ok res -> show_read_result res)
  in
  String_asserter.assert_equals expected actual "expect_qitem";
  Lwt.return_unit
