
#
# Autogenerated by Thrift for thrift/compiler/test/fixtures/basic/src/module.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport make_shared, unique_ptr
from cython.operator cimport dereference as deref, address
from libcpp.utility cimport move as cmove
from thrift.py3.types cimport const_pointer_cast
cimport test.fixtures.basic.module.thrift_converter as _test_fixtures_basic_module_thrift_converter
import test.fixtures.basic.module.types as _test_fixtures_basic_module_types


cdef shared_ptr[_fbthrift_cbindings.cMyStruct] MyStruct_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cMyStruct](
        _test_fixtures_basic_module_thrift_converter.MyStruct_convert_to_cpp(inst)
    )
cdef object MyStruct_from_cpp(const shared_ptr[_fbthrift_cbindings.cMyStruct]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.MyStruct_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.MyStruct.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cContainers] Containers_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cContainers](
        _test_fixtures_basic_module_thrift_converter.Containers_convert_to_cpp(inst)
    )
cdef object Containers_from_cpp(const shared_ptr[_fbthrift_cbindings.cContainers]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.Containers_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.Containers.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cMyDataItem] MyDataItem_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cMyDataItem](
        _test_fixtures_basic_module_thrift_converter.MyDataItem_convert_to_cpp(inst)
    )
cdef object MyDataItem_from_cpp(const shared_ptr[_fbthrift_cbindings.cMyDataItem]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.MyDataItem_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.MyDataItem.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cMyUnion] MyUnion_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cMyUnion](
        _test_fixtures_basic_module_thrift_converter.MyUnion_convert_to_cpp(inst)
    )
cdef object MyUnion_from_cpp(const shared_ptr[_fbthrift_cbindings.cMyUnion]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.MyUnion_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.MyUnion.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cMyException] MyException_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cMyException](
        _test_fixtures_basic_module_thrift_converter.MyException_convert_to_cpp(inst)
    )
cdef object MyException_from_cpp(const shared_ptr[_fbthrift_cbindings.cMyException]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.MyException_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.MyException.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cMyExceptionWithMessage] MyExceptionWithMessage_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cMyExceptionWithMessage](
        _test_fixtures_basic_module_thrift_converter.MyExceptionWithMessage_convert_to_cpp(inst)
    )
cdef object MyExceptionWithMessage_from_cpp(const shared_ptr[_fbthrift_cbindings.cMyExceptionWithMessage]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.MyExceptionWithMessage_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.MyExceptionWithMessage.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cReservedKeyword] ReservedKeyword_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cReservedKeyword](
        _test_fixtures_basic_module_thrift_converter.ReservedKeyword_convert_to_cpp(inst)
    )
cdef object ReservedKeyword_from_cpp(const shared_ptr[_fbthrift_cbindings.cReservedKeyword]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.ReservedKeyword_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.ReservedKeyword.from_python(_py_struct)
    return _py_struct

cdef shared_ptr[_fbthrift_cbindings.cUnionToBeRenamed] UnionToBeRenamed_convert_to_cpp(object inst) except*:
    try:
        inst = inst._fbthrift__inner
    except AttributeError:
        pass

    return make_shared[_fbthrift_cbindings.cUnionToBeRenamed](
        _test_fixtures_basic_module_thrift_converter.UnionToBeRenamed_convert_to_cpp(inst)
    )
cdef object UnionToBeRenamed_from_cpp(const shared_ptr[_fbthrift_cbindings.cUnionToBeRenamed]& c_struct):
    _py_struct = _test_fixtures_basic_module_thrift_converter.UnionToBeRenamed_from_cpp(deref(const_pointer_cast(c_struct)))
    _py_struct = _test_fixtures_basic_module_types.UnionToBeRenamed.from_python(_py_struct)
    return _py_struct


