/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/any/src/module.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */

#include "thrift/compiler/test/fixtures/any/gen-cpp2/module_data.h"
#include "thrift/compiler/test/fixtures/any/gen-cpp2/module_constants.h"

#include <thrift/lib/cpp2/gen/module_data_cpp.h>

namespace apache::thrift {

THRIFT_DATA_MEMBER const std::string_view TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::detail::MyStruct>::name = "MyStruct";
THRIFT_DATA_MEMBER const std::array<std::string_view, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::detail::MyStruct>::fields_names = { {
  "myString"sv,
}};
THRIFT_DATA_MEMBER const std::array<int16_t, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::detail::MyStruct>::fields_ids = { {
  1,
}};
THRIFT_DATA_MEMBER const std::array<protocol::TType, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::detail::MyStruct>::fields_types = { {
  TType::T_STRING,
}};
THRIFT_DATA_MEMBER const std::array<int, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::detail::MyStruct>::isset_indexes = { {
  0,
}};

THRIFT_DATA_MEMBER const std::string_view TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyUnion>::name = "MyUnion";
THRIFT_DATA_MEMBER const std::array<std::string_view, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyUnion>::fields_names = { {
  "myString"sv,
}};
THRIFT_DATA_MEMBER const std::array<int16_t, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyUnion>::fields_ids = { {
  1,
}};
THRIFT_DATA_MEMBER const std::array<protocol::TType, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyUnion>::fields_types = { {
  TType::T_STRING,
}};
THRIFT_DATA_MEMBER const std::array<int, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyUnion>::isset_indexes = { {
  0,
}};

THRIFT_DATA_MEMBER const std::string_view TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyException>::name = "MyException";
THRIFT_DATA_MEMBER const std::array<std::string_view, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyException>::fields_names = { {
  "myString"sv,
}};
THRIFT_DATA_MEMBER const std::array<int16_t, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyException>::fields_ids = { {
  1,
}};
THRIFT_DATA_MEMBER const std::array<protocol::TType, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyException>::fields_types = { {
  TType::T_STRING,
}};
THRIFT_DATA_MEMBER const std::array<int, 1> TStructDataStorage<::facebook::thrift::compiler::test::fixtures::any::MyException>::isset_indexes = { {
  0,
}};

namespace detail {

::folly::Range<const ::std::string_view*>(*TSchemaAssociation<::facebook::thrift::compiler::test::fixtures::any::detail::MyStruct, false>::bundle)() =
    nullptr;

::folly::Range<const ::std::string_view*>(*TSchemaAssociation<::facebook::thrift::compiler::test::fixtures::any::MyUnion, false>::bundle)() =
    nullptr;

::folly::Range<const ::std::string_view*>(*TSchemaAssociation<::facebook::thrift::compiler::test::fixtures::any::MyException, false>::bundle)() =
    nullptr;

} // namespace detail
} // namespace apache::thrift
