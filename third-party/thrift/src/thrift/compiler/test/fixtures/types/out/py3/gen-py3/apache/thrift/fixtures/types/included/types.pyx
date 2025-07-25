#
# Autogenerated by Thrift for included.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
cimport cython as __cython
from cpython.object cimport PyTypeObject
from libcpp.memory cimport shared_ptr, make_shared, unique_ptr
from libcpp.optional cimport optional as __optional
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from libcpp.utility cimport move as cmove
from cpython cimport bool as pbool
from cython.operator cimport dereference as deref, preincrement as inc, address as ptr_address
import thrift.py3.types
from thrift.py3.types import _IsSet as _fbthrift_IsSet
from thrift.py3.types cimport make_unique
cimport thrift.py3.types
cimport thrift.py3.exceptions
cimport thrift.python.exceptions
import thrift.python.converter
from thrift.python.types import EnumMeta as __EnumMeta
from thrift.python.std_libcpp cimport sv_to_str as __sv_to_str, string_view as __cstring_view
from thrift.python.types cimport BadEnum as __BadEnum
from thrift.py3.types cimport (
    richcmp as __richcmp,
    init_unicode_from_cpp as __init_unicode_from_cpp,
    set_iter as __set_iter,
    map_iter as __map_iter,
    reference_shared_ptr as __reference_shared_ptr,
    get_field_name_by_index as __get_field_name_by_index,
    reset_field as __reset_field,
    translate_cpp_enum_to_python,
    const_pointer_cast,
    make_const_shared,
    constant_shared_ptr,
    mixin_deprecation_log_error,
)
from thrift.py3.types cimport _ensure_py3_or_raise, _ensure_py3_container_or_raise
cimport thrift.py3.serializer as serializer
from thrift.python.protocol cimport Protocol as __Protocol
import folly.iobuf as _fbthrift_iobuf
from folly.optional cimport cOptional
from folly.memory cimport to_shared_ptr as __to_shared_ptr
from folly.range cimport Range as __cRange

import sys
from collections.abc import Sequence, Set, Mapping, Iterable
import weakref as __weakref
import builtins as _builtins
import importlib

import apache.thrift.fixtures.types.included.thrift_types as _fbthrift_python_types

from apache.thrift.fixtures.types.included.containers_FBTHRIFT_ONLY_DO_NOT_USE import (
    std_unordered_map__Map__i32_string,
    List__std_unordered_map__Map__i32_string,
)

_fbthrift__module_name__ = "apache.thrift.fixtures.types.included.types"

cdef object get_types_reflection():
    return importlib.import_module(
        "apache.thrift.fixtures.types.included.types_reflection"
    )

cdef _apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string] std_unordered_map__Map__i32_string__make_instance(object items) except *:
    cdef _apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string] c_inst
    cdef cint32_t c_key
    if items is None:
        return cmove(c_inst)
    for key, item in items.items():
        if not isinstance(key, int):
            raise TypeError(f"{key!r} is not of type int")
        c_key = <cint32_t> key
        if not isinstance(item, str):
            raise TypeError(f"{item!r} is not of type str")

        c_inst[c_key] = item.encode('UTF-8')
    return cmove(c_inst)

cdef object std_unordered_map__Map__i32_string__from_cpp(const _apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string]& c_map) except *:
    cdef dict py_items = {}
    cdef __map_iter[_apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string]] iter = __map_iter[_apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string]](c_map)
    cdef cint32_t ckey = 0
    cdef string cval
    for i in range(c_map.size()):
        iter.genNextKeyVal(ckey, cval)
        py_items[ckey] = __init_unicode_from_cpp(cval)
    return std_unordered_map__Map__i32_string(py_items, private_ctor_token=thrift.py3.types._fbthrift_map_private_ctor)

cdef vector[_apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string]] List__std_unordered_map__Map__i32_string__make_instance(object items) except *:
    cdef vector[_apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string]] c_inst
    if items is None:
        return cmove(c_inst)
    for item in items:
        if item is None:
            raise TypeError("None is not of the type _typing.Mapping[int, str]")
        if not isinstance(item, std_unordered_map__Map__i32_string):
            item = std_unordered_map__Map__i32_string(item)
        c_inst.push_back(std_unordered_map__Map__i32_string__make_instance(item))
    return cmove(c_inst)

cdef object List__std_unordered_map__Map__i32_string__from_cpp(const vector[_apache_thrift_fixtures_types_included_cbindings.std_unordered_map[cint32_t,string]]& c_vec) except *:
    cdef list py_list = []
    cdef int idx = 0
    for idx in range(c_vec.size()):
        py_list.append(std_unordered_map__Map__i32_string__from_cpp(c_vec[idx]))
    return List__std_unordered_map__Map__i32_string(py_list, thrift.py3.types._fbthrift_list_private_ctor)


SomeMap = std_unordered_map__Map__i32_string
SomeListOfTypeMap = List__std_unordered_map__Map__i32_string
