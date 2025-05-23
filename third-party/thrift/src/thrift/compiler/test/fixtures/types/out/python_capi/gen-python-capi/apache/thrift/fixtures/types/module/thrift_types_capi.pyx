
#
# Autogenerated by Thrift
#
# DO NOT EDIT
#  @generated
#

from cpython.ref cimport PyObject
from libcpp.utility cimport move as __move
from folly.iobuf cimport (
    from_unique_ptr as __IOBuf_from_unique_ptr,
    IOBuf as __IOBuf,
)
from thrift.python.serializer import (
    deserialize as __deserialize,
    Protocol as __Protocol,
    serialize_iobuf as __serialize_iobuf,
)
import apache.thrift.fixtures.types.module.thrift_types as __thrift_types

cdef api int can_extract__apache__thrift__fixtures__types__module__empty_struct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.empty_struct) else 0


cdef api object init__apache__thrift__fixtures__types__module__empty_struct(object data):
    return __thrift_types.empty_struct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__decorated_struct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.decorated_struct) else 0


cdef api object init__apache__thrift__fixtures__types__module__decorated_struct(object data):
    return __thrift_types.decorated_struct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__ContainerStruct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.ContainerStruct) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__ContainerStruct(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__ContainerStruct(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.ContainerStruct,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__ContainerStruct(object data):
    return __thrift_types.ContainerStruct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__CppTypeStruct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.CppTypeStruct) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__CppTypeStruct(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__CppTypeStruct(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.CppTypeStruct,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__CppTypeStruct(object data):
    return __thrift_types.CppTypeStruct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__VirtualStruct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.VirtualStruct) else 0


cdef api object init__apache__thrift__fixtures__types__module__VirtualStruct(object data):
    return __thrift_types.VirtualStruct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__MyStructWithForwardRefEnum(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.MyStructWithForwardRefEnum) else 0


cdef api object init__apache__thrift__fixtures__types__module__MyStructWithForwardRefEnum(object data):
    return __thrift_types.MyStructWithForwardRefEnum._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__TrivialNumeric(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.TrivialNumeric) else 0


cdef api object init__apache__thrift__fixtures__types__module__TrivialNumeric(object data):
    return __thrift_types.TrivialNumeric._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__TrivialNestedWithDefault(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.TrivialNestedWithDefault) else 0


cdef api object init__apache__thrift__fixtures__types__module__TrivialNestedWithDefault(object data):
    return __thrift_types.TrivialNestedWithDefault._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__ComplexString(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.ComplexString) else 0


cdef api object init__apache__thrift__fixtures__types__module__ComplexString(object data):
    return __thrift_types.ComplexString._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__ComplexNestedWithDefault(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.ComplexNestedWithDefault) else 0


cdef api object init__apache__thrift__fixtures__types__module__ComplexNestedWithDefault(object data):
    return __thrift_types.ComplexNestedWithDefault._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__MinPadding(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.MinPadding) else 0


cdef api object init__apache__thrift__fixtures__types__module__MinPadding(object data):
    return __thrift_types.MinPadding._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__MinPaddingWithCustomType(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.MinPaddingWithCustomType) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__MinPaddingWithCustomType(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__MinPaddingWithCustomType(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.MinPaddingWithCustomType,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__MinPaddingWithCustomType(object data):
    return __thrift_types.MinPaddingWithCustomType._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__MyStruct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.MyStruct) else 0


cdef api object init__apache__thrift__fixtures__types__module__MyStruct(object data):
    return __thrift_types.MyStruct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__MyDataItem(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.MyDataItem) else 0


cdef api object init__apache__thrift__fixtures__types__module__MyDataItem(object data):
    return __thrift_types.MyDataItem._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__Renaming(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.Renaming) else 0


cdef api object init__apache__thrift__fixtures__types__module__Renaming(object data):
    return __thrift_types.Renaming._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__AnnotatedTypes(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.AnnotatedTypes) else 0


cdef api object init__apache__thrift__fixtures__types__module__AnnotatedTypes(object data):
    return __thrift_types.AnnotatedTypes._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__ForwardUsageRoot(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.ForwardUsageRoot) else 0


cdef api object init__apache__thrift__fixtures__types__module__ForwardUsageRoot(object data):
    return __thrift_types.ForwardUsageRoot._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__ForwardUsageStruct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.ForwardUsageStruct) else 0


cdef api object init__apache__thrift__fixtures__types__module__ForwardUsageStruct(object data):
    return __thrift_types.ForwardUsageStruct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__ForwardUsageByRef(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.ForwardUsageByRef) else 0


cdef api object init__apache__thrift__fixtures__types__module__ForwardUsageByRef(object data):
    return __thrift_types.ForwardUsageByRef._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__IncompleteMap(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.IncompleteMap) else 0


cdef api object init__apache__thrift__fixtures__types__module__IncompleteMap(object data):
    return __thrift_types.IncompleteMap._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__IncompleteMapDep(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.IncompleteMapDep) else 0


cdef api object init__apache__thrift__fixtures__types__module__IncompleteMapDep(object data):
    return __thrift_types.IncompleteMapDep._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__CompleteMap(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.CompleteMap) else 0


cdef api object init__apache__thrift__fixtures__types__module__CompleteMap(object data):
    return __thrift_types.CompleteMap._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__CompleteMapDep(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.CompleteMapDep) else 0


cdef api object init__apache__thrift__fixtures__types__module__CompleteMapDep(object data):
    return __thrift_types.CompleteMapDep._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__IncompleteList(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.IncompleteList) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__IncompleteList(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__IncompleteList(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.IncompleteList,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__IncompleteList(object data):
    return __thrift_types.IncompleteList._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__IncompleteListDep(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.IncompleteListDep) else 0


cdef api object init__apache__thrift__fixtures__types__module__IncompleteListDep(object data):
    return __thrift_types.IncompleteListDep._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__CompleteList(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.CompleteList) else 0


cdef api object init__apache__thrift__fixtures__types__module__CompleteList(object data):
    return __thrift_types.CompleteList._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__CompleteListDep(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.CompleteListDep) else 0


cdef api object init__apache__thrift__fixtures__types__module__CompleteListDep(object data):
    return __thrift_types.CompleteListDep._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__AdaptedList(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.AdaptedList) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__AdaptedList(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__AdaptedList(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.AdaptedList,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__AdaptedList(object data):
    return __thrift_types.AdaptedList._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__AdaptedListDep(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.AdaptedListDep) else 0


cdef api object init__apache__thrift__fixtures__types__module__AdaptedListDep(object data):
    return __thrift_types.AdaptedListDep._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__DependentAdaptedList(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.DependentAdaptedList) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__DependentAdaptedList(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__DependentAdaptedList(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.DependentAdaptedList,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__DependentAdaptedList(object data):
    return __thrift_types.DependentAdaptedList._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__DependentAdaptedListDep(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.DependentAdaptedListDep) else 0


cdef api object init__apache__thrift__fixtures__types__module__DependentAdaptedListDep(object data):
    return __thrift_types.DependentAdaptedListDep._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__AllocatorAware(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.AllocatorAware) else 0


cdef api object init__apache__thrift__fixtures__types__module__AllocatorAware(object data):
    return __thrift_types.AllocatorAware._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__AllocatorAware2(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.AllocatorAware2) else 0


cdef api object init__apache__thrift__fixtures__types__module__AllocatorAware2(object data):
    return __thrift_types.AllocatorAware2._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__TypedefStruct(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.TypedefStruct) else 0

cdef api __cIOBuf* extract__apache__thrift__fixtures__types__module__TypedefStruct(object __obj) except NULL:
    cdef __IOBuf __buf = __serialize_iobuf(__obj, protocol=__Protocol.BINARY)
    return __buf._ours.release()

cdef api object construct__apache__thrift__fixtures__types__module__TypedefStruct(__unique_ptr[__cIOBuf] __s):
    return __deserialize(
        __thrift_types.TypedefStruct,
        __IOBuf_from_unique_ptr(__move(__s)),
        protocol=__Protocol.BINARY
    )

cdef api object init__apache__thrift__fixtures__types__module__TypedefStruct(object data):
    return __thrift_types.TypedefStruct._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__StructWithDoubleUnderscores(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.StructWithDoubleUnderscores) else 0


cdef api object init__apache__thrift__fixtures__types__module__StructWithDoubleUnderscores(object data):
    return __thrift_types.StructWithDoubleUnderscores._fbthrift_from_internal_data(data)

cdef api int can_extract__apache__thrift__fixtures__types__module__has_bitwise_ops(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.has_bitwise_ops) else 0

cdef api object construct__apache__thrift__fixtures__types__module__has_bitwise_ops(int64_t __val):
    return __thrift_types.has_bitwise_ops(__val)

cdef api int can_extract__apache__thrift__fixtures__types__module__is_unscoped(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.is_unscoped) else 0

cdef api object construct__apache__thrift__fixtures__types__module__is_unscoped(int64_t __val):
    return __thrift_types.is_unscoped(__val)

cdef api int can_extract__apache__thrift__fixtures__types__module__MyForwardRefEnum(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.MyForwardRefEnum) else 0

cdef api object construct__apache__thrift__fixtures__types__module__MyForwardRefEnum(int64_t __val):
    return __thrift_types.MyForwardRefEnum(__val)

