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

#include <thrift/lib/cpp2/server/overload/QpsOverloadChecker.h>

namespace apache::thrift {

folly::Optional<OverloadResult> QpsOverloadChecker::checkOverload(
    const CheckOverloadParams params) {
  if (FOLLY_UNLIKELY(params.method == nullptr)) {
    return folly::none;
  }

  const auto maxQps = server_.getMaxQps();
  if (!server_.getMethodsBypassMaxRequestsLimit().contains(*params.method) &&
      !qpsTokenBucket_.consume(1.0, maxQps, maxQps)) {
    LoadShedder loadShedder = LoadShedder::MAX_QPS;
    if (auto* cpuConcurrencyController = server_.getCPUConcurrencyController();
        cpuConcurrencyController != nullptr &&
        cpuConcurrencyController->requestShed(
            CPUConcurrencyController::Method::MAX_QPS)) {
      loadShedder = LoadShedder::CPU_CONCURRENCY_CONTROLLER;
    }
    return OverloadResult{
        kOverloadedErrorCode, "load shedding due to qps limit", loadShedder};
  } else {
    return folly::none;
  }
}

} // namespace apache::thrift
