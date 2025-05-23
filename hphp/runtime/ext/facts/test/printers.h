/*
   +----------------------------------------------------------------------+
   | HipHop for PHP                                                       |
   +----------------------------------------------------------------------+
   | Copyright (c) 2010-present Facebook, Inc. (http://www.facebook.com)  |
   +----------------------------------------------------------------------+
   | This source path is subject to version 3.01 of the PHP license,      |
   | that is bundled with this package in the path LICENSE, and is        |
   | available through the world-wide-web at the following url:           |
   | http://www.php.net/license/3_01.txt                                  |
   | If you did not receive a copy of the PHP license and are unable to   |
   | obtain it through the world-wide-web, please send a note to          |
   | license@php.net so we can mail you a copy immediately.               |
   +----------------------------------------------------------------------+
*/

#pragma once

#include <folly/portability/GMock.h>
#include <folly/portability/GTest.h>

#include "gmock/gmock.h"

#include "hphp/util/optional.h"

namespace HPHP {

template <typename T>
void PrintTo(const Optional<T>& optional, ::std::ostream* os) {
  if (optional.has_value()) {
    *os << "Optional(" << ::testing::PrintToString(*optional) << ")";
  } else {
    *os << "Optional(none)";
  }
}

} // namespace HPHP
