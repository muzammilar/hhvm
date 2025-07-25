/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <any>

#include <thrift/conformance/cpp2/Any.h>
#include <thrift/conformance/cpp2/AnyRegistry.h>
#include <thrift/conformance/cpp2/ConformanceHandler.h>
#include <thrift/conformance/cpp2/Protocol.h>
#include <thrift/lib/cpp2/patch/DynamicPatch.h>

namespace apache::thrift::conformance {

void ConformanceHandler::roundTrip(
    RoundTripResponse& res, std::unique_ptr<RoundTripRequest> req) {
  // Load the value.
  std::any val = AnyRegistry::generated().load(*req->value());
  // Figure out what protocol we are supposed to use.
  Protocol protocol = req->targetProtocol().has_value()
      ? Protocol(req->targetProtocol().value_unchecked())
      : getProtocol(*req->value());
  // Store the value and return the result.
  res.value() = AnyRegistry::generated().store(std::move(val), protocol);
}

void ConformanceHandler::patch(
    PatchOpResponse& res, std::unique_ptr<PatchOpRequest> req) {
  // Load the value.
  auto value = AnyRegistry::generated().load<protocol::Value>(*req->value());
  auto patchValue =
      AnyRegistry::generated().load<protocol::Value>(*req->patch());

  // This is needed right now to handle string/binary ambiguation and to treat
  // all string/binary as binary.
  auto rvalue = protocol::parseValue<CompactProtocolReader>(
      *protocol::serializeValue<CompactProtocolWriter>(value),
      static_cast<type::BaseType>(value.getType()));

  protocol::DynamicPatch patch{
      protocol::DynamicPatch::fromObject(patchValue.as_object())};
  patch.apply(rvalue);

  res.result() = AnyRegistry::generated().store(
      std::move(rvalue), getProtocol(*req->value()));
}

} // namespace apache::thrift::conformance
