
#
# Autogenerated by Thrift
#
# DO NOT EDIT
#  @generated
#

from thrift.python.capi.cpp_converter cimport cpp_to_python, python_to_cpp
from libcpp.utility cimport move as cmove

cdef extern from "thrift/compiler/test/fixtures/inject_metadata_fields/gen-python-capi/module/thrift_types_capi.h":
    cdef cppclass _fbthrift__NamespaceTag "module::NamespaceTag"

cdef cFields Fields_convert_to_cpp(object inst) except *:
    return cmove(python_to_cpp[cFields, _fbthrift__NamespaceTag](inst))

cdef object Fields_from_cpp(const cFields& c_struct):
    return cpp_to_python[cFields, _fbthrift__NamespaceTag](c_struct)

cdef cFieldsInjectedToEmptyStruct FieldsInjectedToEmptyStruct_convert_to_cpp(object inst) except *:
    return cmove(python_to_cpp[cFieldsInjectedToEmptyStruct, _fbthrift__NamespaceTag](inst))

cdef object FieldsInjectedToEmptyStruct_from_cpp(const cFieldsInjectedToEmptyStruct& c_struct):
    return cpp_to_python[cFieldsInjectedToEmptyStruct, _fbthrift__NamespaceTag](c_struct)

cdef cFieldsInjectedToStruct FieldsInjectedToStruct_convert_to_cpp(object inst) except *:
    return cmove(python_to_cpp[cFieldsInjectedToStruct, _fbthrift__NamespaceTag](inst))

cdef object FieldsInjectedToStruct_from_cpp(const cFieldsInjectedToStruct& c_struct):
    return cpp_to_python[cFieldsInjectedToStruct, _fbthrift__NamespaceTag](c_struct)

cdef cFieldsInjectedWithIncludedStruct FieldsInjectedWithIncludedStruct_convert_to_cpp(object inst) except *:
    return cmove(python_to_cpp[cFieldsInjectedWithIncludedStruct, _fbthrift__NamespaceTag](inst))

cdef object FieldsInjectedWithIncludedStruct_from_cpp(const cFieldsInjectedWithIncludedStruct& c_struct):
    return cpp_to_python[cFieldsInjectedWithIncludedStruct, _fbthrift__NamespaceTag](c_struct)

