/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/includes/src/matching_module_name.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#include "thrift/compiler/test/fixtures/includes/gen-cpp2/matching_module_name_types.h"
#include "thrift/compiler/test/fixtures/includes/gen-cpp2/matching_module_name_types.tcc"

#include <thrift/lib/cpp2/gen/module_types_cpp.h>

#include "thrift/compiler/test/fixtures/includes/gen-cpp2/matching_module_name_data.h"
[[maybe_unused]] static constexpr std::string_view kModuleName = "matching_module_name";


namespace apache {
namespace thrift {
namespace detail {

void TccStructTraits<::matching_module_name::MyStruct>::translateFieldName(
    std::string_view _fname,
    int16_t& fid,
    apache::thrift::protocol::TType& _ftype) noexcept {
  using data = apache::thrift::TStructDataStorage<::matching_module_name::MyStruct>;
  static const st::translate_field_name_table table{
      data::fields_size,
      data::fields_names.data(),
      data::fields_ids.data(),
      data::fields_types.data()};
  st::translate_field_name(_fname, fid, _ftype, table);
}

} // namespace detail
} // namespace thrift
} // namespace apache

namespace matching_module_name {

std::string_view MyStruct::__fbthrift_get_field_name(::apache::thrift::FieldOrdinal ord) {
  if (ord == ::apache::thrift::FieldOrdinal{0}) { return {}; }
  return apache::thrift::TStructDataStorage<MyStruct>::fields_names[folly::to_underlying(ord) - 1];
}
std::string_view MyStruct::__fbthrift_get_class_name() {
  return apache::thrift::TStructDataStorage<MyStruct>::name;
}


MyStruct::MyStruct(apache::thrift::FragileConstructor, ::matching_module_name::OtherStruct OtherStructField__arg) :
    __fbthrift_field_OtherStructField(std::move(OtherStructField__arg)) { 
  __isset.set(folly::index_constant<0>(), true);
}


void MyStruct::__fbthrift_clear() {
  // clear all fields
  ::apache::thrift::clear(this->__fbthrift_field_OtherStructField);
  __isset = {};
}

void MyStruct::__fbthrift_clear_terse_fields() {
}

bool MyStruct::__fbthrift_is_empty() const {
  return false;
}

bool MyStruct::operator==([[maybe_unused]] const MyStruct& rhs) const {
  return ::apache::thrift::op::detail::StructEquality{}(*this, rhs);
}

bool MyStruct::operator<([[maybe_unused]] const MyStruct& rhs) const {
  return ::apache::thrift::op::detail::StructLessThan{}(*this, rhs);
}


const ::matching_module_name::OtherStruct& MyStruct::get_OtherStructField() const& {
  return __fbthrift_field_OtherStructField;
}

::matching_module_name::OtherStruct MyStruct::get_OtherStructField() && {
  return static_cast<::matching_module_name::OtherStruct&&>(__fbthrift_field_OtherStructField);
}

void swap([[maybe_unused]] MyStruct& a, [[maybe_unused]] MyStruct& b) {
  using ::std::swap;
  swap(a.__fbthrift_field_OtherStructField, b.__fbthrift_field_OtherStructField);
  swap(a.__isset, b.__isset);
}


static_assert(
    ::apache::thrift::detail::st::gen_check_json<
        MyStruct,
        ::apache::thrift::type_class::structure,
        ::matching_module_name::OtherStruct>,
    "inconsistent use of json option");

} // namespace matching_module_name

namespace matching_module_name { namespace {
[[maybe_unused]] FOLLY_ERASE void validateAdapters() {
}
}} // namespace matching_module_name
namespace apache::thrift::detail::annotation {
}
