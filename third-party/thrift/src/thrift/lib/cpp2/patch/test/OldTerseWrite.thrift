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

include "thrift/annotation/cpp.thrift"
include "thrift/lib/thrift/patch.thrift"

package "apache.org/thrift/test"

struct Foo {
  @cpp.DeprecatedTerseWrite
  1: string bar;
}

struct FooWithDef {
  @cpp.DeprecatedTerseWrite
  @patch.DeprecatedTerseWriteCustomDefaultDoNotUse
  1: i32 bar = 100;
}
