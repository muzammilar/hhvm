/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/py3/src/module.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#pragma once

#include <thrift/lib/cpp2/gen/module_constants_h.h>

#include "thrift/compiler/test/fixtures/py3/gen-py3cpp/module_types.h"

namespace py3::simple {
/** Glean {"file": "thrift/compiler/test/fixtures/py3/src/module.thrift"} */
namespace module_constants {

  /** Glean {"constant": "A_BOOL"} */
  constexpr bool const A_BOOL_ = true;
  /** Glean {"constant": "A_BOOL"} */
  constexpr bool A_BOOL() {
    return A_BOOL_;
  }

  /** Glean {"constant": "A_BYTE"} */
  constexpr ::std::int8_t const A_BYTE_ = static_cast<::std::int8_t>(8);
  /** Glean {"constant": "A_BYTE"} */
  constexpr ::std::int8_t A_BYTE() {
    return A_BYTE_;
  }

  /** Glean {"constant": "THE_ANSWER"} */
  constexpr ::std::int16_t const THE_ANSWER_ = static_cast<::std::int16_t>(42);
  /** Glean {"constant": "THE_ANSWER"} */
  constexpr ::std::int16_t THE_ANSWER() {
    return THE_ANSWER_;
  }

  /** Glean {"constant": "A_NUMBER"} */
  constexpr ::std::int32_t const A_NUMBER_ = static_cast<::std::int32_t>(84);
  /** Glean {"constant": "A_NUMBER"} */
  constexpr ::std::int32_t A_NUMBER() {
    return A_NUMBER_;
  }

  /** Glean {"constant": "A_BIG_NUMBER"} */
  constexpr ::std::int64_t const A_BIG_NUMBER_ = static_cast<::std::int64_t>(102);
  /** Glean {"constant": "A_BIG_NUMBER"} */
  constexpr ::std::int64_t A_BIG_NUMBER() {
    return A_BIG_NUMBER_;
  }

  /** Glean {"constant": "A_REAL_NUMBER"} */
  constexpr double const A_REAL_NUMBER_ = static_cast<double>(3.14);
  /** Glean {"constant": "A_REAL_NUMBER"} */
  constexpr double A_REAL_NUMBER() {
    return A_REAL_NUMBER_;
  }

  /** Glean {"constant": "A_FAKE_NUMBER"} */
  constexpr double const A_FAKE_NUMBER_ = static_cast<double>(3);
  /** Glean {"constant": "A_FAKE_NUMBER"} */
  constexpr double A_FAKE_NUMBER() {
    return A_FAKE_NUMBER_;
  }

  /** Glean {"constant": "A_WORD"} */
  constexpr char const * const A_WORD_ = "Good word";
  /** Glean {"constant": "A_WORD"} */
  constexpr char const * A_WORD() {
    return A_WORD_;
  }

  /** Glean {"constant": "SOME_BYTES"} */
  constexpr ::std::string_view SOME_BYTES_{"bytes", 5};
  /** Glean {"constant": "SOME_BYTES"} */
  constexpr ::std::string_view SOME_BYTES() {
    return SOME_BYTES_;
  }

  /** Glean {"constant": "A_STRUCT"} */
  ::py3::simple::SimpleStruct const& A_STRUCT();

  /** Glean {"constant": "EMPTY"} */
  ::py3::simple::SimpleStruct const& EMPTY();

  /** Glean {"constant": "WORD_LIST"} */
  ::std::vector<::std::string> const& WORD_LIST();

  /** Glean {"constant": "SOME_MAP"} */
  ::std::vector<::std::map<::std::int32_t, double>> const& SOME_MAP();

  /** Glean {"constant": "DIGITS"} */
  ::std::set<::std::int32_t> const& DIGITS();

  /** Glean {"constant": "A_CONST_MAP"} */
  ::std::map<::std::string, ::py3::simple::SimpleStruct> const& A_CONST_MAP();

  /** Glean {"constant": "ANOTHER_CONST_MAP"} */
  ::std::map<::py3::simple::AnEnumRenamed, ::std::int32_t> const& ANOTHER_CONST_MAP();

  FOLLY_EXPORT ::std::string_view _fbthrift_schema_ede9a07f0329a15a();
  FOLLY_EXPORT ::folly::Range<const ::std::string_view*> _fbthrift_schema_ede9a07f0329a15a_includes();
  FOLLY_EXPORT ::folly::Range<const ::std::string_view*> _fbthrift_schema_ede9a07f0329a15a_uris();

} // namespace module_constants
} // namespace py3::simple
