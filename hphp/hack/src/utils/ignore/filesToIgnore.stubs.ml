open Core
module J = Hh_json_helpers.AdhocJsonHelpers

let paths_to_ignore = ref []

let get_paths_to_ignore () = !paths_to_ignore

let set_paths_to_ignore x = paths_to_ignore := x

let ignore_path regexp = paths_to_ignore := regexp :: !paths_to_ignore

let should_ignore path =
  List.exists ~f:(fun p -> Str.string_match p path 0) !paths_to_ignore
  (* ignore shell script wrappers generated by Composer (PHP package manager) *)
  || String.is_prefix path ~prefix:"vendor/bin/"

let hg_dirname = J.strlist ["dirname"; ".hg"]

let git_dirname = J.strlist ["dirname"; ".git"]

let svn_dirname = J.strlist ["dirname"; ".svn"]

type watch_spec = {
  include_extensions: string list;
  include_file_names: string list;
  exclude_directories: string list;
  exclude_vcs_directories: bool;
}

let server_watch_spec =
  {
    include_extensions =
      ["php"; "phpt"; "hack"; "hackpartial"; "hck"; "hh"; "hhi"; "xhp"];
    include_file_names = [".hhconfig"; "PACKAGES.toml"];
    exclude_directories = ["scripts/build/artifacts/sqlfacts"];
    exclude_vcs_directories = true;
  }

let watchman_server_expression_terms =
  [
    J.strlist ["type"; "f"];
    J.pred "anyof"
    @@ [
         J.strlist ["name"; ".hhconfig"];
         J.pred "anyof"
         @@ [
              J.strlist ["suffix"; "php"];
              J.strlist ["suffix"; "phpt"];
              J.strlist ["suffix"; "hack"];
              J.strlist ["suffix"; "hackpartial"];
              J.strlist ["suffix"; "hck"];
              J.strlist ["suffix"; "hh"];
              J.strlist ["suffix"; "hhi"];
              J.strlist ["suffix"; "xhp"];
            ];
       ];
    J.pred "not" @@ [J.pred "anyof" @@ [hg_dirname; git_dirname; svn_dirname]];
  ]

let watchman_watcher_expression_terms =
  [J.strlist ["type"; "f"]; J.strlist ["name"; "updatestate"]]
