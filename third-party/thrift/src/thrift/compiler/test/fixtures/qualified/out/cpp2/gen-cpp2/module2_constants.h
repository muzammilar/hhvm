/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/qualified/src/module2.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#pragma once

#include <thrift/lib/cpp2/gen/module_constants_h.h>

#include "thrift/compiler/test/fixtures/qualified/gen-cpp2/module2_types.h"

namespace module2 {
/** Glean {"file": "thrift/compiler/test/fixtures/qualified/src/module2.thrift"} */
namespace module2_constants {

  /** Glean {"constant": "c2"} */
  ::module2::Struct const& c2();

  /** Glean {"constant": "c3"} */
  ::module2::Struct const& c3();

  /** Glean {"constant": "c4"} */
  ::module2::Struct const& c4();

  FOLLY_EXPORT ::std::string_view _fbthrift_schema_9188ad030fa5981a();
  FOLLY_EXPORT ::folly::Range<const ::std::string_view*> _fbthrift_schema_9188ad030fa5981a_includes();
  FOLLY_EXPORT ::folly::Range<const ::std::string_view*> _fbthrift_schema_9188ad030fa5981a_uris();

} // namespace module2_constants
} // namespace module2
