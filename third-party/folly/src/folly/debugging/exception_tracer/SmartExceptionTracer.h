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

#pragma once

#include <folly/ExceptionWrapper.h>
#include <folly/debugging/exception_tracer/Compatibility.h>
#include <folly/debugging/exception_tracer/ExceptionTracer.h>

#if FOLLY_HAVE_ELF && FOLLY_HAVE_DWARF

#if FOLLY_HAS_EXCEPTION_TRACER

#define FOLLY_HAVE_SMART_EXCEPTION_TRACER 1

// These functions report stack traces if available.
// To enable collecting stack traces your binary must also include the
// smart_exception_stack_trace_hooks target.

namespace folly::exception_tracer {

ExceptionInfo getTrace(const std::exception_ptr& ex);

ExceptionInfo getTrace(const std::exception& ex);

ExceptionInfo getTrace(const exception_wrapper& ew);

ExceptionInfo getAsyncTrace(const std::exception_ptr& ex);

ExceptionInfo getAsyncTrace(const std::exception& ex);

ExceptionInfo getAsyncTrace(const exception_wrapper& ew);

} // namespace folly::exception_tracer

#endif //  FOLLY_HAS_EXCEPTION_TRACER

#endif // FOLLY_HAVE_ELF && FOLLY_HAVE_DWARF
