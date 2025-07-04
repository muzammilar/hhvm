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

#include "hphp/runtime/vm/bc-pattern.h"

#include <iterator>

#include "hphp/runtime/vm/func.h"
#include "hphp/runtime/vm/hhbc-codec.h"

namespace HPHP {
//////////////////////////////////////////////////////////////////////

using Result = BCPattern::Result;

Result BCPattern::matchAnchored(const Func* func) {
  return matchAnchored(func->entry(), 0, func->bclen());
}

Result BCPattern::matchAnchored(PC entry, Offset start, Offset end) {
  Result result;

  matchAnchored(m_pattern, entry, start, end, result);
  return result;
}

void BCPattern::matchAnchored(const Expr& pattern, PC entry,
                              Offset start, Offset end, Result& result) {
  auto pos = pattern.begin();

  for (auto inst = start; inst != end; ) {
    // Detect a match.
    if (pos == pattern.end()) {
      result.m_start = entry + start;
      result.m_end = entry + inst;
      return;
    }

    auto const op = peek_op(entry + inst);

    // Skip pattern-globally ignored opcodes.
    if (m_ignores.contains(op)) {
      inst = next(entry, inst);
      continue;
    }

    // Check for alternations whenever we fail to match.
    auto nomatch = [&] {
      if (!pos->hasAlt()) return result.erase();

      // Pop the capture if we made one.
      if (pos->shouldCapture()) {
        result.m_captures.pop_back();
      }

      for (auto const& atom : pos->getAlt()) {
        // Construct the full alternate pattern.
        auto alt = Expr { atom };
        alt.insert(alt.end(), std::next(pos), pattern.end());
        auto res = result;

        // Match on the alternate.
        matchAnchored(alt, entry, inst, end, res);

        if (res.found()) {
          result = res;
          result.m_start = entry + start;
          return;
        }
      }
      return result.erase();
    };

    // Capture the atom if desired.
    if (pos->shouldCapture()) {
      result.m_captures.push_back(entry + inst);
    }

    // Check for shallow match.
    if (pos->op() != op) {
      return nomatch();
    }

    auto filter = pos->getFilter();

    // Check for deep match if desired.
    if (filter && !filter(entry + inst, result.m_captures)) {
      return nomatch();
    }

    if ((pos->op() == Op::JmpZ || pos->op() == Op::JmpNZ)) {
      // Match the taken block, if there is one.
      auto const offsets = instrJumpTargets(entry, inst);
      assertx(offsets.size() == 1);

      auto res = result;
      matchAnchored(pos->getTaken(), entry, offsets[0], end, res);

      if (!res.found()) {
        return nomatch();
      }

      // Grab the captures.
      result.m_captures = res.m_captures;
    }

    if (pos->hasSeq()) {
      // Match the subsequence if we have one.
      auto res = result;
      matchAnchored(pos->getSeq(), entry, next(entry, inst), end, res);

      if (!res.found()) {
        return nomatch();
      }

      // Set the PC.
      result.m_captures = res.m_captures;
      inst = res.m_end - entry;
    } else {
      // Step the PC.
      inst = next(entry, inst);
    }

    // Step the pattern.
    ++pos;
  }

  // Detect a terminal match.
  if (pos == pattern.end()) {
    result.m_start = entry + start;
    result.m_end = entry + end;
  }
}

//////////////////////////////////////////////////////////////////////
}
