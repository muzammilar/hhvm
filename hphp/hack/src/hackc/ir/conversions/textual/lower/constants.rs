// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the "hack" directory of this source tree.

use ir::BlockId;
use ir::BlockIdSet;
use ir::Func;
use ir::FuncBuilder;
use ir::HasEdges;
use ir::ImmId;
use ir::Immediate;
use ir::Instr;
use ir::IrRepr;
use ir::ValueId;
use ir::ValueIdMap;
use ir::instr;
use ir::instr::HasOperands;
use ir::instr::Terminator;
use ir::newtype::ImmIdSet;
use log::trace;

/// Write the complex constants to the start of the entry block (and 'default'
/// handling blocks) and remap their uses to the emitted values.
pub(crate) fn write_constants(builder: &mut FuncBuilder) {
    // Rewrite some types of constants.
    for c in builder.func.repr.imms.iter_mut() {
        match c {
            Immediate::File => {
                // Rewrite __FILE__ as a simple string since the real filename
                // shouldn't matter for analysis.
                let id = ir::intern("__FILE__");
                *c = Immediate::String(id.as_bytes());
            }
            _ => {}
        }
    }

    // Write the complex constants to the entry block.
    insert_constants(builder, IrRepr::ENTRY_BID);
}

/// Follow the blocks successors around but stopping at an 'enter'. We stop at
/// enter under the assumption that default blocks enter into the entry path -
/// so those will be handled separately.
fn follow_block_successors(func: &Func, bid: BlockId) -> Vec<BlockId> {
    let mut result = Vec::new();
    let mut processed = BlockIdSet::default();
    let mut pending = vec![bid];
    while let Some(bid) = pending.pop() {
        processed.insert(bid);
        result.push(bid);

        // Add unprocessed successors to pending.
        let terminator = func.repr.terminator(bid);
        match terminator {
            Terminator::Enter(..) => {
                // We don't want to trace through Enter.
            }
            terminator => {
                for edge in terminator.edges() {
                    if !processed.contains(edge) {
                        pending.push(*edge);
                    }
                }
            }
        }

        // And catch handlers
        let handler = func.repr.catch_target(bid);
        if handler != BlockId::NONE && !processed.contains(&handler) {
            pending.push(handler);
        }
    }

    result
}

/// Compute the set of constants that are visible starting from `bid`.
fn compute_live_constants(func: &Func, bids: &Vec<BlockId>) -> ImmIdSet {
    let mut visible = ImmIdSet::default();
    for &bid in bids {
        let block = func.repr.block(bid);
        visible.extend(
            block
                .iids()
                .map(|iid| func.repr.instr(iid))
                .flat_map(|instr| instr.operands().iter().filter_map(|op| op.imm())),
        );
    }

    visible
}

fn remap_constants(func: &mut Func, bids: &Vec<BlockId>, remap: ValueIdMap<ValueId>) {
    for &bid in bids {
        func.repr.remap_block_vids(bid, &remap);
    }
}

fn insert_constants(builder: &mut FuncBuilder, start_bid: BlockId) {
    // Allocate a new block, fill it with constants, append the old InstrIds,
    // swap the old and new blocks and then clear the new block.

    let bids = follow_block_successors(&builder.func, start_bid);
    let constants = compute_live_constants(&builder.func, &bids);

    let constants = sort_and_filter_constants(&builder.func, constants);

    let mut remap = ValueIdMap::default();
    let mut fixups = Vec::default();

    let new_bid = builder.alloc_bid_based_on(start_bid);
    builder.start_block(new_bid);

    for cid in constants.into_iter() {
        let (vid, needs_fixup) = write_constant(builder, cid);
        let src = ValueId::from_imm(cid);
        remap.insert(src, vid);
        if needs_fixup {
            fixups.push((vid, src));
        }
    }

    let mut old_iids = std::mem::take(&mut builder.func.repr.block_mut(start_bid).iids);
    builder.cur_block_mut().iids.append(&mut old_iids);

    builder.func.repr.blocks.swap(start_bid, new_bid);

    remap_constants(&mut builder.func, &bids, remap);

    for (vid, src) in fixups {
        let iid = vid.instr().unwrap();
        builder.func.repr.instrs[iid] = Instr::Special(instr::Special::Copy(src));
    }
}

/// Arrays can refer to some prior constants (like Strings) so they need to be
/// sorted before being written. Right now arrays can't refer to other arrays so
/// they don't need to be sorted relative to each other.
fn sort_and_filter_constants(func: &Func, constants: ImmIdSet) -> Vec<ImmId> {
    let mut result = Vec::with_capacity(constants.len());
    let mut arrays = Vec::with_capacity(constants.len());
    for cid in constants {
        let imm = func.repr.imm(cid);
        match imm {
            Immediate::Bool(..)
            | Immediate::Dir
            | Immediate::EnumClassLabel(..)
            | Immediate::Float(..)
            | Immediate::File
            | Immediate::FuncCred
            | Immediate::Int(..)
            | Immediate::LazyClass(_)
            | Immediate::Method
            | Immediate::NewCol(..)
            | Immediate::Null
            | Immediate::Uninit => {}

            Immediate::Vec(_) | Immediate::Dict(_) | Immediate::Keyset(_) => {
                arrays.push(cid);
            }
            Immediate::Named(..) => {
                result.push(cid);
            }
            Immediate::String(s) => {
                // If the string is short then just keep it inline. This makes
                // it easier to visually read the output but may be more work
                // for infer (because it's a call)...
                if s.as_bytes().len() > 40 {
                    result.push(cid);
                }
            }
        }
    }

    result.append(&mut arrays);
    result
}

fn write_constant(builder: &mut FuncBuilder, cid: ImmId) -> (ValueId, bool) {
    let imm = builder.func.repr.imm(cid);
    trace!("    Immediate {cid}: {imm:?}");
    match imm {
        Immediate::Bool(..)
        | Immediate::Dir
        | Immediate::Float(..)
        | Immediate::File
        | Immediate::FuncCred
        | Immediate::Int(..)
        | Immediate::LazyClass(_)
        | Immediate::Method
        | Immediate::NewCol(..)
        | Immediate::Null
        | Immediate::Uninit => unreachable!(),

        // Insert a tombstone which will be turned into a 'copy' later.
        Immediate::Vec(_)
        | Immediate::Dict(_)
        | Immediate::Keyset(_)
        | Immediate::String(_)
        | Immediate::EnumClassLabel(_) => (builder.emit(Instr::tombstone()), true),

        Immediate::Named(name) => {
            let id = ir::GlobalId::new(name.as_string_id());
            let vid = builder.emit(Instr::Special(ir::instr::Special::Textual(
                ir::instr::Textual::LoadGlobal { id, is_const: true },
            )));
            (vid, false)
        }
    }
}
