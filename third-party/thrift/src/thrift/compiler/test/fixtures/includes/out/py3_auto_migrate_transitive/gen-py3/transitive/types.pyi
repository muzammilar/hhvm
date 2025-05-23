#
# Autogenerated by Thrift for thrift/compiler/test/fixtures/includes/src/transitive.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

import enum as _python_std_enum
import folly.iobuf as _fbthrift_iobuf
import thrift.py3.types
import thrift.python.types
import thrift.py3.exceptions
import typing as _typing

import sys
import itertools
import transitive.thrift_types



class Foo(thrift.py3.types.Struct, _typing.Hashable):
    class __fbthrift_IsSet:
        a: bool
        pass

    a: _typing.Final[int] = ...

    def __init__(
        self, *,
        a: _typing.Optional[int]=None
    ) -> None: ...

    def __call__(
        self, *,
        a: _typing.Union[int, None]=None
    ) -> Foo: ...

    def __reduce__(self) -> _typing.Tuple[_typing.Callable, _typing.Tuple[_typing.Type['Foo'], bytes]]: ...
    def __hash__(self) -> int: ...
    def __str__(self) -> str: ...
    def __repr__(self) -> str: ...
    def __lt__(self, other: 'Foo') -> bool: ...
    def __gt__(self, other: 'Foo') -> bool: ...
    def __le__(self, other: 'Foo') -> bool: ...
    def __ge__(self, other: 'Foo') -> bool: ...

    def _to_python(self) -> transitive.thrift_types.Foo: ...
    def _to_py3(self) -> Foo: ...
    def _to_py_deprecated(self) -> "transitive.ttypes.Foo": ...   # type: ignore

ExampleFoo: Foo = ...
