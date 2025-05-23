

#
# Autogenerated by Thrift
#
# DO NOT EDIT
#  @generated
#

from __future__ import annotations

import abc as _abc
import typing as _typing
import builtins as _fbthrift_builtins



import folly.iobuf as _fbthrift_iobuf
import thrift.python.abstract_types as _fbthrift_python_abstract_types
import apache.thrift.fixtures.types.included.thrift_abstract_types as _fbthrift__apache__thrift__fixtures__types__included__thrift_abstract_types

from apache.thrift.fixtures.types.module.thrift_enums import (
    has_bitwise_ops,
    has_bitwise_ops as _fbthrift_has_bitwise_ops,
    is_unscoped,
    is_unscoped as _fbthrift_is_unscoped,
    MyForwardRefEnum,
    MyForwardRefEnum as _fbthrift_MyForwardRefEnum,
)

class empty_struct(_abc.ABC):
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[None]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.empty_struct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.empty_struct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.empty_struct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.empty_struct": ...  # type: ignore
_fbthrift_empty_struct = empty_struct
class decorated_struct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> str: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[str]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.decorated_struct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.decorated_struct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.decorated_struct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.decorated_struct": ...  # type: ignore
_fbthrift_decorated_struct = decorated_struct
class ContainerStruct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldB(self) -> _typing.Sequence[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldC(self) -> _typing.Sequence[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldD(self) -> _typing.Sequence[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldE(self) -> _typing.Sequence[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldF(self) -> _typing.AbstractSet[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldG(self) -> _typing.Mapping[int, str]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldH(self) -> _typing.Mapping[int, str]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldA(self) -> _typing.Sequence[int]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[int], _typing.Sequence[int], _typing.Sequence[int], _typing.Sequence[int], _typing.AbstractSet[int], _typing.Mapping[int, str], _typing.Mapping[int, str], _typing.Sequence[int]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.ContainerStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.ContainerStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.ContainerStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.ContainerStruct": ...  # type: ignore
_fbthrift_ContainerStruct = ContainerStruct
class CppTypeStruct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def fieldA(self) -> _typing.Sequence[int]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[int]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.CppTypeStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.CppTypeStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.CppTypeStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.CppTypeStruct": ...  # type: ignore
_fbthrift_CppTypeStruct = CppTypeStruct
class VirtualStruct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def MyIntField(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.VirtualStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.VirtualStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.VirtualStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.VirtualStruct": ...  # type: ignore
_fbthrift_VirtualStruct = VirtualStruct
class MyStructWithForwardRefEnum(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def a(self) -> _fbthrift_MyForwardRefEnum: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def b(self) -> _fbthrift_MyForwardRefEnum: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_fbthrift_MyForwardRefEnum, _fbthrift_MyForwardRefEnum]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.MyStructWithForwardRefEnum": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.MyStructWithForwardRefEnum": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.MyStructWithForwardRefEnum": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.MyStructWithForwardRefEnum": ...  # type: ignore
_fbthrift_MyStructWithForwardRefEnum = MyStructWithForwardRefEnum
class TrivialNumeric(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def a(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def b(self) -> bool: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, bool]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.TrivialNumeric": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.TrivialNumeric": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.TrivialNumeric": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.TrivialNumeric": ...  # type: ignore
_fbthrift_TrivialNumeric = TrivialNumeric
class TrivialNestedWithDefault(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def z(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def n(self) -> _fbthrift_TrivialNumeric: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, _fbthrift_TrivialNumeric]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.TrivialNestedWithDefault": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.TrivialNestedWithDefault": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.TrivialNestedWithDefault": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.TrivialNestedWithDefault": ...  # type: ignore
_fbthrift_TrivialNestedWithDefault = TrivialNestedWithDefault
class ComplexString(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def a(self) -> str: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def b(self) -> _typing.Mapping[str, int]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[str, _typing.Mapping[str, int]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.ComplexString": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.ComplexString": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.ComplexString": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.ComplexString": ...  # type: ignore
_fbthrift_ComplexString = ComplexString
class ComplexNestedWithDefault(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def z(self) -> str: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def n(self) -> _fbthrift_ComplexString: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[str, _fbthrift_ComplexString]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.ComplexNestedWithDefault": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.ComplexNestedWithDefault": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.ComplexNestedWithDefault": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.ComplexNestedWithDefault": ...  # type: ignore
_fbthrift_ComplexNestedWithDefault = ComplexNestedWithDefault
class MinPadding(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def small(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def big(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def medium(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def biggish(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def tiny(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, int, int, int, int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.MinPadding": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.MinPadding": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.MinPadding": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.MinPadding": ...  # type: ignore
_fbthrift_MinPadding = MinPadding
class MinPaddingWithCustomType(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def small(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def biggish(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def medium(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def big(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def tiny(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, int, int, int, int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.MinPaddingWithCustomType": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.MinPaddingWithCustomType": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.MinPaddingWithCustomType": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.MinPaddingWithCustomType": ...  # type: ignore
_fbthrift_MinPaddingWithCustomType = MinPaddingWithCustomType
class MyStruct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def MyIntField(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def MyStringField(self) -> str: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def majorVer(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def data(self) -> _fbthrift_MyDataItem: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, str, int, _fbthrift_MyDataItem]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.MyStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.MyStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.MyStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.MyStruct": ...  # type: ignore
_fbthrift_MyStruct = MyStruct
class MyDataItem(_abc.ABC):
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[None]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.MyDataItem": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.MyDataItem": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.MyDataItem": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.MyDataItem": ...  # type: ignore
_fbthrift_MyDataItem = MyDataItem
class Renaming(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def foo(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.Renaming": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.Renaming": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.Renaming": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.Renaming": ...  # type: ignore
_fbthrift_Renaming = Renaming
class AnnotatedTypes(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def binary_field(self) -> bytes: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def list_field(self) -> _typing.Sequence[_typing.Mapping[int, str]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[bytes, _typing.Sequence[_typing.Mapping[int, str]]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.AnnotatedTypes": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.AnnotatedTypes": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.AnnotatedTypes": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.AnnotatedTypes": ...  # type: ignore
_fbthrift_AnnotatedTypes = AnnotatedTypes
class ForwardUsageRoot(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def ForwardUsageStruct(self) -> _typing.Optional[_fbthrift_ForwardUsageStruct]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def ForwardUsageByRef(self) -> _typing.Optional[_fbthrift_ForwardUsageByRef]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_fbthrift_ForwardUsageStruct, _fbthrift_ForwardUsageByRef]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.ForwardUsageRoot": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.ForwardUsageRoot": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.ForwardUsageRoot": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.ForwardUsageRoot": ...  # type: ignore
_fbthrift_ForwardUsageRoot = ForwardUsageRoot
class ForwardUsageStruct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def foo(self) -> _typing.Optional[_fbthrift_ForwardUsageRoot]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_fbthrift_ForwardUsageRoot]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.ForwardUsageStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.ForwardUsageStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.ForwardUsageStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.ForwardUsageStruct": ...  # type: ignore
_fbthrift_ForwardUsageStruct = ForwardUsageStruct
class ForwardUsageByRef(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def foo(self) -> _typing.Optional[_fbthrift_ForwardUsageRoot]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_fbthrift_ForwardUsageRoot]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.ForwardUsageByRef": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.ForwardUsageByRef": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.ForwardUsageByRef": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.ForwardUsageByRef": ...  # type: ignore
_fbthrift_ForwardUsageByRef = ForwardUsageByRef
class IncompleteMap(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[_typing.Mapping[int, _fbthrift_IncompleteMapDep]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Mapping[int, _fbthrift_IncompleteMapDep]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.IncompleteMap": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.IncompleteMap": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.IncompleteMap": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.IncompleteMap": ...  # type: ignore
_fbthrift_IncompleteMap = IncompleteMap
class IncompleteMapDep(_abc.ABC):
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[None]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.IncompleteMapDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.IncompleteMapDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.IncompleteMapDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.IncompleteMapDep": ...  # type: ignore
_fbthrift_IncompleteMapDep = IncompleteMapDep
class CompleteMap(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[_typing.Mapping[int, _fbthrift_CompleteMapDep]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Mapping[int, _fbthrift_CompleteMapDep]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.CompleteMap": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.CompleteMap": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.CompleteMap": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.CompleteMap": ...  # type: ignore
_fbthrift_CompleteMap = CompleteMap
class CompleteMapDep(_abc.ABC):
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[None]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.CompleteMapDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.CompleteMapDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.CompleteMapDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.CompleteMapDep": ...  # type: ignore
_fbthrift_CompleteMapDep = CompleteMapDep
class IncompleteList(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[_typing.Sequence[_fbthrift_IncompleteListDep]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[_fbthrift_IncompleteListDep]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.IncompleteList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.IncompleteList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.IncompleteList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.IncompleteList": ...  # type: ignore
_fbthrift_IncompleteList = IncompleteList
class IncompleteListDep(_abc.ABC):
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[None]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.IncompleteListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.IncompleteListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.IncompleteListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.IncompleteListDep": ...  # type: ignore
_fbthrift_IncompleteListDep = IncompleteListDep
class CompleteList(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[_typing.Sequence[_fbthrift_CompleteListDep]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[_fbthrift_CompleteListDep]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.CompleteList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.CompleteList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.CompleteList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.CompleteList": ...  # type: ignore
_fbthrift_CompleteList = CompleteList
class CompleteListDep(_abc.ABC):
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[None]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.CompleteListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.CompleteListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.CompleteListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.CompleteListDep": ...  # type: ignore
_fbthrift_CompleteListDep = CompleteListDep
class AdaptedList(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[_typing.Sequence[_fbthrift_AdaptedListDep]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[_fbthrift_AdaptedListDep]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.AdaptedList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.AdaptedList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.AdaptedList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.AdaptedList": ...  # type: ignore
_fbthrift_AdaptedList = AdaptedList
class AdaptedListDep(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _fbthrift_AdaptedList: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_fbthrift_AdaptedList]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.AdaptedListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.AdaptedListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.AdaptedListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.AdaptedListDep": ...  # type: ignore
_fbthrift_AdaptedListDep = AdaptedListDep
class DependentAdaptedList(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[_typing.Sequence[_fbthrift_DependentAdaptedListDep]]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[_fbthrift_DependentAdaptedListDep]]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.DependentAdaptedList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.DependentAdaptedList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.DependentAdaptedList": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.DependentAdaptedList": ...  # type: ignore
_fbthrift_DependentAdaptedList = DependentAdaptedList
class DependentAdaptedListDep(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def field(self) -> _typing.Optional[int]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.DependentAdaptedListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.DependentAdaptedListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.DependentAdaptedListDep": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.DependentAdaptedListDep": ...  # type: ignore
_fbthrift_DependentAdaptedListDep = DependentAdaptedListDep
class AllocatorAware(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def aa_list(self) -> _typing.Sequence[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def aa_set(self) -> _typing.AbstractSet[int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def aa_map(self) -> _typing.Mapping[int, int]: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def aa_string(self) -> str: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def not_a_container(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def aa_unique(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def aa_shared(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[_typing.Sequence[int], _typing.AbstractSet[int], _typing.Mapping[int, int], str, int, int, int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.AllocatorAware": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.AllocatorAware": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.AllocatorAware": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.AllocatorAware": ...  # type: ignore
_fbthrift_AllocatorAware = AllocatorAware
class AllocatorAware2(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def not_a_container(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def box_field(self) -> _typing.Optional[int]: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.AllocatorAware2": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.AllocatorAware2": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.AllocatorAware2": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.AllocatorAware2": ...  # type: ignore
_fbthrift_AllocatorAware2 = AllocatorAware2
class TypedefStruct(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def i32_field(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def IntTypedef_field(self) -> int: ...
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def UintTypedef_field(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int, int, int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.TypedefStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.TypedefStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.TypedefStruct": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.TypedefStruct": ...  # type: ignore
_fbthrift_TypedefStruct = TypedefStruct
class StructWithDoubleUnderscores(_abc.ABC):
    # pyre-ignore[16]: Module `_fbthrift_builtins` has no attribute `property`.
    @_fbthrift_builtins.property
    @_abc.abstractmethod
    def _StructWithDoubleUnderscores__field(self) -> int: ...
    @_abc.abstractmethod
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int]]]: ...
    @_abc.abstractmethod
    def _to_mutable_python(self) -> "apache.thrift.fixtures.types.module.thrift_mutable_types.StructWithDoubleUnderscores": ...  # type: ignore
    @_abc.abstractmethod
    def _to_python(self) -> "apache.thrift.fixtures.types.module.thrift_types.StructWithDoubleUnderscores": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py3(self) -> "apache.thrift.fixtures.types.module.types.StructWithDoubleUnderscores": ...  # type: ignore
    @_abc.abstractmethod
    def _to_py_deprecated(self) -> "module.ttypes.StructWithDoubleUnderscores": ...  # type: ignore
_fbthrift_StructWithDoubleUnderscores = StructWithDoubleUnderscores

TBinary = bytes
IntTypedef = int
UintTypedef = int
SomeListOfTypeMap_2468 = _typing.Sequence[_typing.Mapping[int, str]]
TBinary_8623 = bytes
i32_9314 = int
list_i32_9187 = _typing.Sequence[int]
map_i32_i32_9565 = _typing.Mapping[int, int]
map_i32_string_1261 = _typing.Mapping[int, str]
set_i32_7070 = _typing.AbstractSet[int]
set_i32_7194 = _typing.AbstractSet[int]
string_5252 = str
