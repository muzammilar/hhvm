/*
   +----------------------------------------------------------------------+
   | HipHop for PHP                                                       |
   +----------------------------------------------------------------------+
   | Copyright (c) 2010-present Facebook, Inc. (http://www.facebook.com)  |
   | Copyright (c) 1997-2010 The PHP Group                                |
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

#ifndef incl_HPHP_EXT_ASIO_WAITABLE_WAIT_HANDLE_H_
#define incl_HPHP_EXT_ASIO_WAITABLE_WAIT_HANDLE_H_

#include "hphp/runtime/ext/extension.h"
#include "hphp/runtime/ext/asio/ext_wait-handle.h"
#include "hphp/runtime/ext/asio/asio-session.h"

namespace HPHP {
///////////////////////////////////////////////////////////////////////////////
// class WaitableWaitHandle

/**
 * A waitable wait handle is a wait handle that can be waited for by a blockable
 * wait handle if a result is not yet available. Once the wait handle finishes,
 * all blocked wait handles are notified.
 */
struct AsioBlockable;
struct AsioContext;

struct c_WaitableWaitHandle :
    c_Awaitable,
    SystemLib::ClassLoader<"HH\\WaitableWaitHandle"> {
  using SystemLib::ClassLoader<"HH\\WaitableWaitHandle">::classof;
  using SystemLib::ClassLoader<"HH\\WaitableWaitHandle">::className;
  WAITHANDLE_DTOR(WaitableWaitHandle)

  explicit c_WaitableWaitHandle(Class*, HeaderKind, type_scan::Index) noexcept;
  ~c_WaitableWaitHandle();

 public:
  static constexpr ptrdiff_t ctxStateIdxOff() {
    return offsetof(c_WaitableWaitHandle, m_ctxStateIdx);
  }
  static constexpr ptrdiff_t parentChainOff() {
    return offsetof(c_WaitableWaitHandle, m_parentChain);
  }

  ContextIndex getContextIndex() const;
  ContextStateIndex getContextStateIndex() const;
  void setContextStateIndex(ContextStateIndex ctxStateIdx);
  bool isInContext() const;
  AsioContext* getContext() const;
  AsioBlockableChain& getParentChain();
  void join();
  String getName();

 protected:
  c_WaitableWaitHandle* getChild();
  bool isDescendantOf(c_WaitableWaitHandle* wait_handle) const;
  void detectCycle(c_WaitableWaitHandle* child) const;

 private:
  [[noreturn]] NEVER_INLINE
  void throwCycleException(c_WaitableWaitHandle* child) const;
};

///////////////////////////////////////////////////////////////////////////////
}

#include "hphp/runtime/ext/asio/ext_waitable-wait-handle-inl.h"

#endif // incl_HPHP_EXT_ASIO_WAITABLE_WAIT_HANDLE_H_
