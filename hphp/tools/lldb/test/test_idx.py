# Copyright 2022-present Facebook. All Rights Reserved.

# pyre-unsafe

from . import base  # usort: skip (must be first, needed for sys.path side-effects)
import hphp.tools.lldb.idx as idx


class IdxCommandTestCase(base.TestHHVMBinary):
    def setUp(self):
        super().setUp(test_file="slow/reified-generics/reified-parent.php")

    def test_idx_command_on_fixed_vector(self):
        self.run_until_breakpoint("checkClassReifiedGenericMismatch")
        _, output = self.run_commands(["idx c->m_slotIndex 0"])
        self.assertTrue(output, "(unsigned short) *&(tmp) = 0")

    def test_idx_helper_on_fixed_vector(self):
        self.run_until_breakpoint("checkClassReifiedGenericMismatch")
        slot_index = self.frame.FindVariable("c").GetChildMemberWithName("m_slotIndex")
        val = idx.idx(slot_index, 0)
        self.assertEqual(val.unsigned, 0)
        val = idx.idx(slot_index, 1)
        self.assertEqual(val.unsigned, 1)
