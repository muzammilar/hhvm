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
#include "hphp/util/abi-cxx.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <memory>
#include <mutex>
#include <string>

#include <cxxabi.h>
#include <execinfo.h>

#include <folly/Demangle.h>
#include <folly/Format.h>

#include "hphp/util/functional.h"
#include "hphp/util/compatibility.h"
#include "hphp/util/hash-map.h"

#ifdef HHVM_FACEBOOK
#include <folly/experimental/symbolizer/Symbolizer.h>
#endif

namespace HPHP {

//////////////////////////////////////////////////////////////////////

namespace {

using G = std::lock_guard<std::mutex>;
std::mutex nameCacheLock;
hphp_fast_map<void*, std::string, pointer_hash<void>> nameCache;

}

//////////////////////////////////////////////////////////////////////

void registerNativeFunctionName(void* codeAddr, const std::string& name) {
  G g(nameCacheLock);
  nameCache[codeAddr] = name;
}

std::string getNativeFunctionName(void* codeAddr) {
  {
    G g(nameCacheLock);
    auto it = nameCache.find(codeAddr);
    if (it != end(nameCache)) return it->second;
  }
  std::string functionName;

#ifdef _MSC_VER
  HANDLE process = GetCurrentProcess();
  SYMBOL_INFO *symbol;
  DWORD64 addr_disp = 0;

  // syminitialize and symcleanup should really be once per process
  SymInitialize(process, nullptr, TRUE);

  symbol = (SYMBOL_INFO *)calloc(sizeof(SYMBOL_INFO) + 256 * sizeof(char), 1);
  symbol->MaxNameLen = 255;
  symbol->SizeOfStruct = sizeof(SYMBOL_INFO);

  if(SymFromAddr(process, (DWORD64) codeAddr, &addr_disp, symbol)) {
    functionName.assign(symbol->Name);

    int status;
    char* demangledName = (char*)calloc(1024, sizeof(char));
    status = !(int)UnDecorateSymbolName(
        symbol->Name, demangledName, 1023, UNDNAME_COMPLETE);
    SCOPE_EXIT { free(demangledName); };
    if (status == 0) functionName.assign(demangledName);

  }
  free(symbol);

  SymCleanup(process);
#elif defined(FACEBOOK)

  folly::symbolizer::Symbolizer symbolizer;
  folly::symbolizer::SymbolizedFrame frame;
  if (symbolizer.symbolize(uintptr_t(codeAddr), frame)) {
    functionName = folly::demangle(frame.name).toStdString();
  }

#else
  void* buf[1] = {codeAddr};
  char** symbols = backtrace_symbols(buf, 1);

  if (symbols != nullptr) {
    //
    // the output from backtrace_symbols looks like this:
    // ../path/hhvm/hhvm(_ZN4HPHP2VM6Transl17interpOneIterInitEv+0) [0x17cebe9]
    //
    // we first want to extract the mangled name from it to get this:
    // _ZN4HPHP2VM6Transl17interpOneIterInitEv
    //
    // and then pass this to abi::__cxa_demangle to get the demangled name:
    // HPHP::jit::interpOneIterInit()
    //
    // Sometimes, though, backtrace_symbols can't find the function name
    // and ends up giving us a blank mangled name, like this:
    // ../path/hhvm/hhvm() [0x17e4d01]
    // or this: [0x7fffca800130]
    //
    char* start = strchr(*symbols, '(');
    if (start) {
      start++;
      char* end = strchr(start, '+');
      if (end != nullptr) {
        functionName.assign(start, end);
        int status;
        char* demangledName = abi::__cxa_demangle(functionName.c_str(),
                                                  0, 0, &status);
        SCOPE_EXIT { free(demangledName); };
        if (status == 0) functionName.assign(demangledName);
      }
    }
  }

  // backtrace_symbols requires that we free the array of strings but not the
  // strings themselves.
  free(symbols);
#endif

  if (functionName.empty()) functionName = folly::format("{}", codeAddr).str();

  G g(nameCacheLock);
  return nameCache[codeAddr] = functionName;
}

//////////////////////////////////////////////////////////////////////

}
