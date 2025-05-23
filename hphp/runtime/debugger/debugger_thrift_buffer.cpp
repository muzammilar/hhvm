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

#include "hphp/runtime/debugger/debugger_thrift_buffer.h"
#include "hphp/runtime/base/variable-serializer.h"
#include "hphp/runtime/base/variable-unserializer.h"

namespace HPHP {
///////////////////////////////////////////////////////////////////////////////
TRACE_SET_MOD(debugger)

String DebuggerThriftBuffer::readImpl() {
  TRACE(7, "DebuggerThriftBuffer::readImpl\n");
  assertx(m_size <= BUFFER_SIZE);
  int nread = getSocket()->readImpl(m_buffer, m_size);
  m_buffer[nread] = '\0';
  return String(m_buffer, nread, CopyString);
}

void DebuggerThriftBuffer::flushImpl(const String& data) {
  TRACE(7, "DebuggerThriftBuffer::flushImpl\n");
  getSocket()->write(data);
}

void DebuggerThriftBuffer::throwError(const char *msg, int code) {
  TRACE(2, "DebuggerThriftBuffer::throwError\n");
  throw Exception("Protocol Error (%d): %s", code, msg);
}

///////////////////////////////////////////////////////////////////////////////

const StaticString
  s_hit_limit("Hit serialization limit"),
  s_unknown_exp("Hit unknown exception"),
  s_type_mismatch("Type mismatch"),
  s_message("message");

template<typename T>
static inline int serializeImpl(T data, String& sdata) {
  TRACE(7, "DebuggerWireHelpers::serializeImpl\n");
  VariableSerializer vs(VariableSerializer::Type::DebuggerSerialize);
  try {
    sdata = vs.serialize(VarNR{data}, true);
  } catch (StringBufferLimitException& ) {
    sdata = s_hit_limit;
    return DebuggerWireHelpers::HitLimit;
  } catch (...) {
    sdata = s_unknown_exp;
    return DebuggerWireHelpers::UnknownError;
  }
  return DebuggerWireHelpers::NoError;
}

static inline int unserializeImpl(const String& sdata, Variant& data) {
  TRACE(7, "DebuggerWireHelpers::unserializeImpl(CStrRef sdata,\n");
  if (sdata.same(s_hit_limit)) {
    return DebuggerWireHelpers::HitLimit;
  }
  if (sdata.same(s_unknown_exp)) {
    return DebuggerWireHelpers::UnknownError;
  }
  VariableUnserializer vu(sdata.data(), sdata.size(),
                          VariableUnserializer::Type::DebuggerSerialize, true);
  try {
    data = vu.unserialize();
  } catch (const std::exception& e) {
    data = folly::sformat("unserialize() threw '{}'", e.what());
    return DebuggerWireHelpers::ErrorMsg;
  } catch (const Object& o) {
    // Get the message property from the Exception if we can. Otherwise, use
    // the class name.
    assertx(o->instanceof(SystemLib::getExceptionClass()));

    auto const info = o->getProp(
      MemberLookupContext(SystemLib::getExceptionClass(),
                          SystemLib::getExceptionClass()->moduleName()),
      s_message.get());
    if (info) {
      if (isStringType(info.type())) {
        data = folly::sformat(
          "unserialize() threw '{}' with message '{}'",
          o->getVMClass()->name(), info.val().pstr
        );
        return DebuggerWireHelpers::ErrorMsg;
      }
    }

    data = folly::sformat("unserialize() threw '{}'", o->getVMClass()->name());
    return DebuggerWireHelpers::ErrorMsg;
  }

  return DebuggerWireHelpers::NoError;
}

int DebuggerWireHelpers::WireSerialize(const Array& data, String& sdata) {
  TRACE(7, "DebuggerWireHelpers::WireSerialize(const Array& data,\n");
  return serializeImpl(data, sdata);
}

int DebuggerWireHelpers::WireSerialize(const Object& data, String& sdata) {
  TRACE(7, "DebuggerWireHelpers::WireSerialize(const Object& data,\n");
  return serializeImpl(data, sdata);
}

int DebuggerWireHelpers::WireSerialize(const Variant& data, String& sdata) {
  TRACE(7, "DebuggerWireHelpers::WireSerialize(const Variant& data,\n");
  return serializeImpl(data, sdata);
}

int DebuggerWireHelpers::WireUnserialize(String& sdata, Array& data) {
  TRACE(7, "DebuggerWireHelpers::WireUnserialize, Array& data)\n");
  Variant v;
  int ret = unserializeImpl(sdata, v);
  if (ret != NoError) {
    return ret;
  }
  if (!v.isArray() && !v.isNull()) {
    sdata = s_type_mismatch;
    return TypeMismatch;
  }
  data = v;
  return NoError;
}

int DebuggerWireHelpers::WireUnserialize(String& sdata, Object& data) {
  TRACE(7, "DebuggerWireHelpers::WireUnserialize, Object& data\n");
  Variant v;
  int ret = unserializeImpl(sdata, v);
  if (ret != NoError) {
    return ret;
  }
  if (!v.isObject() && !v.isNull()) {
    sdata = s_type_mismatch;
    return TypeMismatch;
  }
  data = v.toObject();
  return NoError;
}

int DebuggerWireHelpers::WireUnserialize(String& sdata, Variant& data) {
  TRACE(7, "DebuggerWireHelpers::WireUnserialize\n");
  return unserializeImpl(sdata, data);
}

///////////////////////////////////////////////////////////////////////////////
}
