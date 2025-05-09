/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/basic/src/module.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#include "thrift/compiler/test/fixtures/basic/gen-cpp2/module_types.tcc"

namespace test::fixtures::basic {

template void MyStruct::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyStruct::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyStruct::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyStruct::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void Containers::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t Containers::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t Containers::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t Containers::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void MyDataItem::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyDataItem::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyDataItem::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyDataItem::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void MyUnion::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyUnion::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyUnion::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyUnion::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void MyException::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyException::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyException::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyException::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void MyExceptionWithMessage::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyExceptionWithMessage::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyExceptionWithMessage::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyExceptionWithMessage::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void ReservedKeyword::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t ReservedKeyword::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t ReservedKeyword::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t ReservedKeyword::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void UnionToBeRenamed::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t UnionToBeRenamed::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t UnionToBeRenamed::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t UnionToBeRenamed::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

} // namespace test::fixtures::basic
