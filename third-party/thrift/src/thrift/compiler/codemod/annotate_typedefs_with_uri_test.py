# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# pyre-unsafe

import os
import shutil
import tempfile
import textwrap
import unittest

import pkg_resources

from xplat.thrift.compiler.codemod.test_utils import read_file, run_binary, write_file


class AnnotateTypedefsWithUriTest(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.mkdtemp()
        self.addCleanup(shutil.rmtree, tmp, True)
        self.tmp = tmp
        self.addCleanup(os.chdir, os.getcwd())
        os.chdir(self.tmp)
        self.maxDiff = None

    def test_implicit_uri(self):
        write_file(
            "foo.thrift",
            textwrap.dedent(
                """\
                package "meta.com/test";

                typedef i32 MyInt;
                """
            ),
        )

        binary = pkg_resources.resource_filename(__name__, "codemod")
        run_binary(binary, "foo.thrift")

        self.assertEqual(
            read_file("foo.thrift"),
            textwrap.dedent(
                """\
                package "meta.com/test";

                include "thrift/annotation/thrift.thrift"

                @thrift.AllowLegacyTypedefUri
                typedef i32 MyInt;
                """
            ),
        )

    def test_explicit_uri(self):
        write_file(
            "foo.thrift",
            textwrap.dedent(
                """\
                include "thrift/annotation/thrift.thrift"

                @thrift.Uri{value="meta.com/thrift/test/MyInt"}
                typedef i32 MyInt;
                """
            ),
        )

        binary = pkg_resources.resource_filename(__name__, "codemod")
        run_binary(binary, "foo.thrift")

        self.assertEqual(
            read_file("foo.thrift"),
            textwrap.dedent(
                """\
                include "thrift/annotation/thrift.thrift"

                @thrift.AllowLegacyTypedefUri
                @thrift.Uri{value="meta.com/thrift/test/MyInt"}
                typedef i32 MyInt;
                """
            ),
        )

    def test_noop(self):
        write_file(
            "foo.thrift",
            textwrap.dedent(
                """\
                typedef i32 MyInt;
                """
            ),
        )

        binary = pkg_resources.resource_filename(__name__, "codemod")
        run_binary(binary, "foo.thrift")

        self.assertEqual(
            read_file("foo.thrift"),
            textwrap.dedent(
                """\
                typedef i32 MyInt;
                """
            ),
        )
