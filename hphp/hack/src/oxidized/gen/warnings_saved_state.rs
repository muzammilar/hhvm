// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the "hack" directory of this source tree.
//
// @generated SignedSource<<c73bbdbfe22a88aba03621c6a7f814d0>>
//
// To regenerate this file, run:
//   hphp/hack/src/oxidized_regen.sh

pub use error_hash_set::*;

#[allow(unused_imports)]
use crate::*;

#[rust_to_ocaml(attr = "deriving (ord, show)")]
pub type ErrorHash = ocamlrep::OCamlInt;

pub type Path = String;
