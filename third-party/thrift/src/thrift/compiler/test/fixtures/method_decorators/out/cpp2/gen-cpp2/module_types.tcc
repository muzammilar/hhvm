/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/method_decorators/src/module.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#pragma once

#include "thrift/compiler/test/fixtures/method_decorators/gen-cpp2/module_types.h"

#include <thrift/lib/cpp2/gen/module_types_tcc.h>


namespace apache {
namespace thrift {
namespace detail {

template <>
struct TccStructTraits<::cpp2::Request> {
  static void translateFieldName(
      std::string_view _fname,
      int16_t& fid,
      apache::thrift::protocol::TType& _ftype) noexcept;
};
template <>
struct TccStructTraits<::cpp2::Response> {
  static void translateFieldName(
      std::string_view _fname,
      int16_t& fid,
      apache::thrift::protocol::TType& _ftype) noexcept;
};

} // namespace detail
} // namespace thrift
} // namespace apache

namespace cpp2 {

template <class Protocol_>
void Request::readNoXfer(Protocol_* iprot) {
  __fbthrift_clear_terse_fields();

  apache::thrift::detail::ProtocolReaderStructReadState<Protocol_> _readState;

  _readState.readStructBegin(iprot);

  using apache::thrift::TProtocolException;


  if (UNLIKELY(!_readState.advanceToNextField(
          iprot,
          0,
          1,
          apache::thrift::protocol::T_STRING))) {
    goto _advance_failure;
  }
_readField_id:
  {
    ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::readWithContext(*iprot, this->__fbthrift_field_id, _readState);
  }
 this->__isset.set(0, true);

  if (UNLIKELY(!_readState.advanceToNextField(
          iprot,
          1,
          0,
          apache::thrift::protocol::T_STOP))) {
    goto _advance_failure;
  }

_end:
  _readState.readStructEnd(iprot);

  return;

  goto _advance_failure; // Avoid compiler warnings about unused labels.
  _advance_failure:
  _readState.afterAdvanceFailure(iprot);
_loop:
  if (_readState.atStop()) {
    goto _end;
  }
  if (iprot->kUsesFieldNames()) {
    _readState.template fillFieldTraitsFromName<apache::thrift::detail::TccStructTraits<Request>>();
  }

  switch (_readState.fieldId) {
    case 1:
    {
      if (LIKELY(_readState.isCompatibleWithType(iprot, apache::thrift::protocol::T_STRING))) {
        goto _readField_id;
      } else {
        goto _skip;
      }
    }
    default:
    {
_skip:
      _readState.skip(iprot);
      _readState.readFieldEnd(iprot);
      _readState.readFieldBeginNoInline(iprot);
      goto _loop;
    }
  }
}

template <class Protocol_>
uint32_t Request::serializedSize(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("Request");
  {
    xfer += prot_->serializedFieldSize("id", apache::thrift::protocol::T_STRING, 1);
    xfer += ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::serializedSize<false>(*prot_, this->__fbthrift_field_id);
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t Request::serializedSizeZC(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("Request");
  {
    xfer += prot_->serializedFieldSize("id", apache::thrift::protocol::T_STRING, 1);
    xfer += ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::serializedSize<false>(*prot_, this->__fbthrift_field_id);
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t Request::write(Protocol_* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->writeStructBegin("Request");
  bool previousFieldHasValue = true;
  {
    constexpr int16_t kPrevFieldId = 0;
    xfer += ::apache::thrift::detail::writeFieldBegin<apache::thrift::protocol::T_STRING, 1, kPrevFieldId>(*prot_, "id", previousFieldHasValue);
    previousFieldHasValue = true;
    xfer += ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::write(*prot_, this->__fbthrift_field_id);
    xfer += prot_->writeFieldEnd();
  }
  xfer += prot_->writeFieldStop();
  xfer += prot_->writeStructEnd();
  return xfer;
}

extern template void Request::readNoXfer<>(apache::thrift::BinaryProtocolReader*);
extern template uint32_t Request::write<>(apache::thrift::BinaryProtocolWriter*) const;
extern template uint32_t Request::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template uint32_t Request::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template void Request::readNoXfer<>(apache::thrift::CompactProtocolReader*);
extern template uint32_t Request::write<>(apache::thrift::CompactProtocolWriter*) const;
extern template uint32_t Request::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
extern template uint32_t Request::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;


template <class Protocol_>
void Response::readNoXfer(Protocol_* iprot) {
  __fbthrift_clear_terse_fields();

  apache::thrift::detail::ProtocolReaderStructReadState<Protocol_> _readState;

  _readState.readStructBegin(iprot);

  using apache::thrift::TProtocolException;


  if (UNLIKELY(!_readState.advanceToNextField(
          iprot,
          0,
          1,
          apache::thrift::protocol::T_STRING))) {
    goto _advance_failure;
  }
_readField_text:
  {
    ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::readWithContext(*iprot, this->__fbthrift_field_text, _readState);
  }
 this->__isset.set(0, true);

  if (UNLIKELY(!_readState.advanceToNextField(
          iprot,
          1,
          0,
          apache::thrift::protocol::T_STOP))) {
    goto _advance_failure;
  }

_end:
  _readState.readStructEnd(iprot);

  return;

  goto _advance_failure; // Avoid compiler warnings about unused labels.
  _advance_failure:
  _readState.afterAdvanceFailure(iprot);
_loop:
  if (_readState.atStop()) {
    goto _end;
  }
  if (iprot->kUsesFieldNames()) {
    _readState.template fillFieldTraitsFromName<apache::thrift::detail::TccStructTraits<Response>>();
  }

  switch (_readState.fieldId) {
    case 1:
    {
      if (LIKELY(_readState.isCompatibleWithType(iprot, apache::thrift::protocol::T_STRING))) {
        goto _readField_text;
      } else {
        goto _skip;
      }
    }
    default:
    {
_skip:
      _readState.skip(iprot);
      _readState.readFieldEnd(iprot);
      _readState.readFieldBeginNoInline(iprot);
      goto _loop;
    }
  }
}

template <class Protocol_>
uint32_t Response::serializedSize(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("Response");
  {
    xfer += prot_->serializedFieldSize("text", apache::thrift::protocol::T_STRING, 1);
    xfer += ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::serializedSize<false>(*prot_, this->__fbthrift_field_text);
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t Response::serializedSizeZC(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("Response");
  {
    xfer += prot_->serializedFieldSize("text", apache::thrift::protocol::T_STRING, 1);
    xfer += ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::serializedSize<false>(*prot_, this->__fbthrift_field_text);
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t Response::write(Protocol_* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->writeStructBegin("Response");
  bool previousFieldHasValue = true;
  {
    constexpr int16_t kPrevFieldId = 0;
    xfer += ::apache::thrift::detail::writeFieldBegin<apache::thrift::protocol::T_STRING, 1, kPrevFieldId>(*prot_, "text", previousFieldHasValue);
    previousFieldHasValue = true;
    xfer += ::apache::thrift::detail::pm::protocol_methods<::apache::thrift::type_class::string, ::std::string>::write(*prot_, this->__fbthrift_field_text);
    xfer += prot_->writeFieldEnd();
  }
  xfer += prot_->writeFieldStop();
  xfer += prot_->writeStructEnd();
  return xfer;
}

extern template void Response::readNoXfer<>(apache::thrift::BinaryProtocolReader*);
extern template uint32_t Response::write<>(apache::thrift::BinaryProtocolWriter*) const;
extern template uint32_t Response::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template uint32_t Response::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template void Response::readNoXfer<>(apache::thrift::CompactProtocolReader*);
extern template uint32_t Response::write<>(apache::thrift::CompactProtocolWriter*) const;
extern template uint32_t Response::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
extern template uint32_t Response::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;


} // namespace cpp2
