// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the "hack" directory of this source tree.

use crate::i_map::IMap;
use crate::pos::Pos;
use crate::scoured_comments::Fixmes;
use crate::scoured_comments::ScouredComments;

impl ScouredComments {
    pub fn new() -> Self {
        ScouredComments {
            comments: vec![],
            fixmes: IMap::new(),
            ignores: IMap::new(),
            misuses: IMap::new(),
            error_pos: vec![],
            bad_ignore_pos: vec![],
        }
    }

    pub fn add_to_fixmes(&mut self, line: isize, code: isize, pos: Pos) {
        Self::add(&mut self.fixmes, line, code, pos)
    }

    pub fn add_to_misuses(&mut self, line: isize, code: isize, pos: Pos) {
        Self::add(&mut self.misuses, line, code, pos)
    }

    pub fn add_to_ignores(&mut self, line: isize, code: isize, pos: Pos) {
        Self::add(&mut self.ignores, line, code, pos)
    }

    pub fn add_format_error(&mut self, pos: Pos) {
        self.error_pos.push(pos);
    }

    pub fn add_disallowed_ignore(&mut self, pos: Pos) {
        self.bad_ignore_pos.push(pos);
    }

    fn add(m: &mut Fixmes, line: isize, code: isize, pos: Pos) {
        match m.get_mut(&line) {
            None => {
                let mut code_to_pos = IMap::new();
                code_to_pos.insert(code, pos);
                m.insert(line, code_to_pos);
            }
            Some(code_to_pos) => {
                code_to_pos.insert(code, pos);
            }
        }
    }
}
