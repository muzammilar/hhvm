(*
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * directory.
 *
 **
 *
 * THIS FILE IS @generated; DO NOT EDIT IT
 * To regenerate this file, run
 *
 *   buck run //hphp/hack/src:generate_full_fidelity
 *
 **
 *
 *)

type t =
  | WhiteSpace
  | EndOfLine
  | DelimitedComment
  | SingleLineComment
  | FixMe
  | Ignore
  | IgnoreError
  | FallThrough
  | ExtraTokenError
[@@deriving show, enum, eq, sexp_of]

let to_string kind =
  match kind with
  | WhiteSpace -> "whitespace"
  | EndOfLine -> "end_of_line"
  | DelimitedComment -> "delimited_comment"
  | SingleLineComment -> "single_line_comment"
  | FixMe -> "fix_me"
  | Ignore -> "ignore"
  | IgnoreError -> "ignore_error"
  | FallThrough -> "fall_through"
  | ExtraTokenError -> "extra_token_error"
