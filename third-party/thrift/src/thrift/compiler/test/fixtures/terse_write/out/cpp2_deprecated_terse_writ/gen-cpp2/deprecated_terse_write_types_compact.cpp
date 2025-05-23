/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/terse_write/src/deprecated_terse_write.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#include "thrift/compiler/test/fixtures/terse_write/gen-cpp2/deprecated_terse_write_types.tcc"

namespace facebook::thrift::test::terse_write::deprecated {

template void MyStruct::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyStruct::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyStruct::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyStruct::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void MyUnion::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t MyUnion::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t MyUnion::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t MyUnion::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void StructLevelTerseStruct::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t StructLevelTerseStruct::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t StructLevelTerseStruct::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t StructLevelTerseStruct::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void FieldLevelTerseStruct::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t FieldLevelTerseStruct::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t FieldLevelTerseStruct::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t FieldLevelTerseStruct::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void CppRefStructFields::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t CppRefStructFields::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t CppRefStructFields::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t CppRefStructFields::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void DeprecatedTerseWriteWithCustomDefault::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t DeprecatedTerseWriteWithCustomDefault::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t DeprecatedTerseWriteWithCustomDefault::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t DeprecatedTerseWriteWithCustomDefault::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

template void DeprecatedTerseWriteWithRedundantCustomDefault::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t DeprecatedTerseWriteWithRedundantCustomDefault::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t DeprecatedTerseWriteWithRedundantCustomDefault::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t DeprecatedTerseWriteWithRedundantCustomDefault::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

} // namespace facebook::thrift::test::terse_write::deprecated
