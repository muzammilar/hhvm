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

#pragma once

#include <vector>
#include "hphp/runtime/base/req-root.h"
#include "hphp/runtime/debugger/debugger_base.h"
#include "hphp/runtime/debugger/debugger_command.h"

namespace HPHP::Eval {
///////////////////////////////////////////////////////////////////////////////

struct CmdMachine : DebuggerCommand {
  static bool AttachSandbox(DebuggerClient &client, const char *user = nullptr,
                            const char *name = nullptr, bool force = false);

  CmdMachine() : DebuggerCommand(KindOfMachine) {}

  void list(DebuggerClient&) override;
  void help(DebuggerClient&) override;

  bool onServer(DebuggerProxy&) override;
  void onClient(DebuggerClient&) override;

protected:
  void sendImpl(DebuggerThriftBuffer&) override;
  void recvImpl(DebuggerThriftBuffer&) override;

private:
  static bool AttachSandbox(DebuggerClient &client,
                            DSandboxInfoPtr sandbox,
                            bool force = false);

  std::vector<DSandboxInfoPtr> m_sandboxes;
  bool m_force{false};
  bool m_succeed{false};

  bool processList(DebuggerClient &client, bool output = true);
};

///////////////////////////////////////////////////////////////////////////////
}
