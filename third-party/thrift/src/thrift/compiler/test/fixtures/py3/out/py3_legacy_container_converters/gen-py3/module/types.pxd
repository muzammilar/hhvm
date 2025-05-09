#
# Autogenerated by Thrift for thrift/compiler/test/fixtures/py3/src/module.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libc.stdint cimport (
    int8_t as cint8_t,
    int16_t as cint16_t,
    int32_t as cint32_t,
    int64_t as cint64_t,
    uint16_t as cuint16_t,
    uint32_t as cuint32_t,
)
from libcpp.string cimport string
from libcpp cimport bool as cbool, nullptr, nullptr_t
from cpython cimport bool as pbool
from libcpp.memory cimport shared_ptr, unique_ptr
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap, pair as cpair
from libcpp.unordered_map cimport unordered_map as cumap
cimport folly.iobuf as _fbthrift_iobuf
from thrift.python.exceptions cimport cTException
from thrift.py3.types cimport (
    bstring,
    field_ref as __field_ref,
    optional_field_ref as __optional_field_ref,
    required_field_ref as __required_field_ref,
    terse_field_ref as __terse_field_ref,
    union_field_ref as __union_field_ref,
    get_union_field_value as __get_union_field_value,
)
from thrift.python.common cimport cThriftMetadata as __fbthrift_cThriftMetadata
cimport thrift.py3.exceptions
cimport thrift.py3.types
from libc.stdint cimport int64_t
from thrift.python.common cimport (
    RpcOptions as __RpcOptions,
    MetadataBox as __MetadataBox,
)
from folly.optional cimport cOptional as __cOptional


cimport module.types as _fbthrift_types
cimport module.types_fields as _fbthrift_types_fields
cimport module.cbindings as _module_cbindings

cdef extern from "thrift/compiler/test/fixtures/py3/gen-py3/module/types.h":
  pass



cdef class SimpleException(thrift.py3.exceptions.GeneratedError):
    cdef shared_ptr[_module_cbindings.cSimpleException] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__SimpleException_FieldsSetter _fields_setter
    cdef inline object err_code_impl(self)

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cSimpleException])



cdef class OptionalRefStruct(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cOptionalRefStruct] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__OptionalRefStruct_FieldsSetter _fields_setter
    cdef inline object optional_blob_impl(self)
    cdef _fbthrift_iobuf.IOBuf __fbthrift_cached_optional_blob

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cOptionalRefStruct])



cdef class SimpleStruct(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cSimpleStruct] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__SimpleStruct_FieldsSetter _fields_setter
    cdef inline object is_on_impl(self)
    cdef inline object tiny_int_impl(self)
    cdef inline object small_int_impl(self)
    cdef inline object nice_sized_int_impl(self)
    cdef inline object big_int_impl(self)
    cdef inline object real_impl(self)
    cdef inline object smaller_real_impl(self)
    cdef inline object something_impl(self)
    cdef inline object opt_default_int_impl(self)
    cdef inline object opt_default_str_impl(self)
    cdef inline object opt_default_enum_impl(self)
    cdef object __fbthrift_cached_something
    cdef object __fbthrift_cached_opt_default_enum

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cSimpleStruct])



cdef class HiddenTypeFieldsStruct(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cHiddenTypeFieldsStruct] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__HiddenTypeFieldsStruct_FieldsSetter _fields_setter

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cHiddenTypeFieldsStruct])



cdef class ComplexStruct(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cComplexStruct] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__ComplexStruct_FieldsSetter _fields_setter
    cdef inline object structOne_impl(self)
    cdef inline object structTwo_impl(self)
    cdef inline object an_integer_impl(self)
    cdef inline object name_impl(self)
    cdef inline object an_enum_impl(self)
    cdef inline object some_bytes_impl(self)
    cdef inline object sender_impl(self)
    cdef inline object cdef__impl(self)
    cdef inline object bytes_with_cpp_type_impl(self)
    cdef SimpleStruct __fbthrift_cached_structOne
    cdef SimpleStruct __fbthrift_cached_structTwo
    cdef object __fbthrift_cached_an_enum

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cComplexStruct])



cdef class BinaryUnion(thrift.py3.types.Union):
    cdef shared_ptr[_module_cbindings.cBinaryUnion] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef int64_t type_int
    cdef object py_type
    cdef object py_value
    cdef _initialize_py(BinaryUnion self)

    @staticmethod
    cdef unique_ptr[_module_cbindings.cBinaryUnion] _make_instance(
        _module_cbindings.cBinaryUnion* base_instance,
        _fbthrift_iobuf.IOBuf iobuf_val
    ) except *

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cBinaryUnion])



cdef class BinaryUnionStruct(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cBinaryUnionStruct] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__BinaryUnionStruct_FieldsSetter _fields_setter
    cdef inline object u_impl(self)
    cdef BinaryUnion __fbthrift_cached_u

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cBinaryUnionStruct])



cdef class CustomFields(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cCustomFields] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__CustomFields_FieldsSetter _fields_setter
    cdef inline object bool_field_impl(self)
    cdef inline object integer_field_impl(self)
    cdef inline object double_field_impl(self)
    cdef inline object string_field_impl(self)
    cdef inline object binary_field_impl(self)
    cdef inline object list_field_impl(self)
    cdef inline object set_field_impl(self)
    cdef inline object map_field_impl(self)
    cdef inline object struct_field_impl(self)
    cdef object __fbthrift_cached_list_field
    cdef object __fbthrift_cached_set_field
    cdef object __fbthrift_cached_map_field
    cdef SimpleStruct __fbthrift_cached_struct_field

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cCustomFields])



cdef class CustomTypedefFields(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cCustomTypedefFields] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__CustomTypedefFields_FieldsSetter _fields_setter
    cdef inline object bool_field_impl(self)
    cdef inline object integer_field_impl(self)
    cdef inline object double_field_impl(self)
    cdef inline object string_field_impl(self)
    cdef inline object binary_field_impl(self)
    cdef inline object list_field_impl(self)
    cdef inline object set_field_impl(self)
    cdef inline object map_field_impl(self)
    cdef inline object struct_field_impl(self)
    cdef object __fbthrift_cached_list_field
    cdef object __fbthrift_cached_set_field
    cdef object __fbthrift_cached_map_field
    cdef SimpleStruct __fbthrift_cached_struct_field

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cCustomTypedefFields])



cdef class AdaptedTypedefFields(thrift.py3.types.Struct):
    cdef shared_ptr[_module_cbindings.cAdaptedTypedefFields] _cpp_obj_FBTHRIFT_ONLY_DO_NOT_USE
    cdef _fbthrift_types_fields.__AdaptedTypedefFields_FieldsSetter _fields_setter
    cdef inline object bool_field_impl(self)
    cdef inline object integer_field_impl(self)
    cdef inline object double_field_impl(self)
    cdef inline object string_field_impl(self)
    cdef inline object binary_field_impl(self)
    cdef inline object list_field_impl(self)
    cdef inline object set_field_impl(self)
    cdef inline object map_field_impl(self)
    cdef inline object struct_field_impl(self)
    cdef object __fbthrift_cached_list_field
    cdef object __fbthrift_cached_set_field
    cdef object __fbthrift_cached_map_field
    cdef SimpleStruct __fbthrift_cached_struct_field

    @staticmethod
    cdef _create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_module_cbindings.cAdaptedTypedefFields])


cdef vector[cint16_t] List__i16__make_instance(object items) except *
cdef object List__i16__from_cpp(const vector[cint16_t]&) except *

cdef vector[cint32_t] List__i32__make_instance(object items) except *
cdef object List__i32__from_cpp(const vector[cint32_t]&) except *

cdef vector[cint64_t] List__i64__make_instance(object items) except *
cdef object List__i64__from_cpp(const vector[cint64_t]&) except *

cdef vector[string] List__string__make_instance(object items) except *
cdef object List__string__from_cpp(const vector[string]&) except *

cdef vector[_module_cbindings.cSimpleStruct] List__SimpleStruct__make_instance(object items) except *
cdef object List__SimpleStruct__from_cpp(const vector[_module_cbindings.cSimpleStruct]&) except *

cdef cset[cint32_t] Set__i32__make_instance(object items) except *
cdef object Set__i32__from_cpp(const cset[cint32_t]&) except *

cdef cset[string] Set__string__make_instance(object items) except *
cdef object Set__string__from_cpp(const cset[string]&) except *

cdef cmap[string,string] Map__string_string__make_instance(object items) except *
cdef object Map__string_string__from_cpp(const cmap[string,string]&) except *

cdef cmap[string,_module_cbindings.cSimpleStruct] Map__string_SimpleStruct__make_instance(object items) except *
cdef object Map__string_SimpleStruct__from_cpp(const cmap[string,_module_cbindings.cSimpleStruct]&) except *

cdef cmap[string,cint16_t] Map__string_i16__make_instance(object items) except *
cdef object Map__string_i16__from_cpp(const cmap[string,cint16_t]&) except *

cdef vector[vector[cint32_t]] List__List__i32__make_instance(object items) except *
cdef object List__List__i32__from_cpp(const vector[vector[cint32_t]]&) except *

cdef cmap[string,cint32_t] Map__string_i32__make_instance(object items) except *
cdef object Map__string_i32__from_cpp(const cmap[string,cint32_t]&) except *

cdef cmap[string,cmap[string,cint32_t]] Map__string_Map__string_i32__make_instance(object items) except *
cdef object Map__string_Map__string_i32__from_cpp(const cmap[string,cmap[string,cint32_t]]&) except *

cdef vector[cset[string]] List__Set__string__make_instance(object items) except *
cdef object List__Set__string__from_cpp(const vector[cset[string]]&) except *

cdef cmap[string,vector[_module_cbindings.cSimpleStruct]] Map__string_List__SimpleStruct__make_instance(object items) except *
cdef object Map__string_List__SimpleStruct__from_cpp(const cmap[string,vector[_module_cbindings.cSimpleStruct]]&) except *

cdef vector[vector[string]] List__List__string__make_instance(object items) except *
cdef object List__List__string__from_cpp(const vector[vector[string]]&) except *

cdef vector[cset[cint32_t]] List__Set__i32__make_instance(object items) except *
cdef object List__Set__i32__from_cpp(const vector[cset[cint32_t]]&) except *

cdef vector[cmap[string,string]] List__Map__string_string__make_instance(object items) except *
cdef object List__Map__string_string__from_cpp(const vector[cmap[string,string]]&) except *

cdef vector[string] List__binary__make_instance(object items) except *
cdef object List__binary__from_cpp(const vector[string]&) except *

cdef cset[string] Set__binary__make_instance(object items) except *
cdef object Set__binary__from_cpp(const cset[string]&) except *

cdef vector[_module_cbindings.cAnEnum] List__AnEnum__make_instance(object items) except *
cdef object List__AnEnum__from_cpp(const vector[_module_cbindings.cAnEnum]&) except *

cdef _module_cbindings._std_unordered_map[cint32_t,cint32_t] _std_unordered_map__Map__i32_i32__make_instance(object items) except *
cdef object _std_unordered_map__Map__i32_i32__from_cpp(const _module_cbindings._std_unordered_map[cint32_t,cint32_t]&) except *

cdef _module_cbindings._MyType _MyType__List__i32__make_instance(object items) except *
cdef object _MyType__List__i32__from_cpp(const _module_cbindings._MyType&) except *

cdef _module_cbindings._MyType _MyType__Set__i32__make_instance(object items) except *
cdef object _MyType__Set__i32__from_cpp(const _module_cbindings._MyType&) except *

cdef _module_cbindings._MyType _MyType__Map__i32_i32__make_instance(object items) except *
cdef object _MyType__Map__i32_i32__from_cpp(const _module_cbindings._MyType&) except *

cdef _module_cbindings._py3_simple_AdaptedList _py3_simple_AdaptedList__List__i32__make_instance(object items) except *
cdef object _py3_simple_AdaptedList__List__i32__from_cpp(const _module_cbindings._py3_simple_AdaptedList&) except *

cdef _module_cbindings._py3_simple_AdaptedSet _py3_simple_AdaptedSet__Set__i32__make_instance(object items) except *
cdef object _py3_simple_AdaptedSet__Set__i32__from_cpp(const _module_cbindings._py3_simple_AdaptedSet&) except *

cdef _module_cbindings._py3_simple_AdaptedMap _py3_simple_AdaptedMap__Map__i32_i32__make_instance(object items) except *
cdef object _py3_simple_AdaptedMap__Map__i32_i32__from_cpp(const _module_cbindings._py3_simple_AdaptedMap&) except *

cdef cmap[cint32_t,double] Map__i32_double__make_instance(object items) except *
cdef object Map__i32_double__from_cpp(const cmap[cint32_t,double]&) except *

cdef vector[cmap[cint32_t,double]] List__Map__i32_double__make_instance(object items) except *
cdef object List__Map__i32_double__from_cpp(const vector[cmap[cint32_t,double]]&) except *

cdef cmap[_module_cbindings.cAnEnumRenamed,cint32_t] Map__AnEnumRenamed_i32__make_instance(object items) except *
cdef object Map__AnEnumRenamed_i32__from_cpp(const cmap[_module_cbindings.cAnEnumRenamed,cint32_t]&) except *


