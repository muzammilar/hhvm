/*
   +----------------------------------------------------------------------+
   | HipHop for PHP                                                       |
   +----------------------------------------------------------------------+
   | Copyright (c) 2010-present Facebook, Inc. (http://www.facebook.com)  |
   +----------------------------------------------------------------------+
   | This source file is subject to version 3.01 of the PHP license,      |
   | that is bundled with this package in the file LICENSE, and is        |
   | available through the world-wide-web at the following url:           |
   | http://www.php.net/license/3_01.txt                                  |
   | If you did not receive a copy of the PHP license and are unable to   |
   | obtain it through the world-wide-web, please send a note to          |
   | license@php.net so we can mail you a copy immediately.               |
   +----------------------------------------------------------------------+
*/

namespace HPHP {
namespace jit {

struct OpInfo {
  const char* name;
  uint64_t flags;
  std::vector<IRSrcFlag> srcFlags;
};
extern OpInfo g_opInfo[];

inline const char* opcodeName(Opcode opcode) {
  return g_opInfo[uint16_t(opcode)].name;
}

inline bool opcodeHasFlags(Opcode opcode, uint64_t flags) {
  return g_opInfo[uint16_t(opcode)].flags & flags;
}

inline bool hasEdges(Opcode opcode) {
  return opcodeHasFlags(opcode, Branch) || opcodeMayRaise(opcode);
}

inline bool opHasExtraData(Opcode op) {
  return opcodeHasFlags(op, HasExtra);
}

inline Optional<Opcode> nameToOpcode(const std::string& str) {
#define O(name, ...) if (str == #name) return Opcode::name;
  IR_OPCODES
#undef O
  return std::nullopt;
}

} // namespace jit
} // namespace HPHP
