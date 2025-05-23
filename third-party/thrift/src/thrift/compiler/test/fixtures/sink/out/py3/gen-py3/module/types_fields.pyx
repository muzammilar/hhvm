#
# Autogenerated by Thrift for thrift/compiler/test/fixtures/sink/src/module.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
cimport cython as __cython
from cython.operator cimport dereference as deref
from libcpp.utility cimport move as cmove
from thrift.py3.types cimport (
    assign_unique_ptr,
    assign_shared_ptr,
    assign_shared_const_ptr,
    bytes_to_string,
    make_unique,
    make_shared,
    make_const_shared,
)
cimport thrift.py3.types
from thrift.py3.types cimport (
    reset_field as __reset_field,
    StructFieldsSetter as __StructFieldsSetter
)

from thrift.py3.types cimport const_pointer_cast
from thrift.python.types cimport BadEnum as _fbthrift_BadEnum
from thrift.py3.types import _from_python_or_raise
from thrift.py3.types cimport _ensure_py3_container_or_raise


import module.types as _module_types


@__cython.auto_pickle(False)
cdef class __InitialResponse_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __InitialResponse_FieldsSetter _fbthrift_create(_module_cbindings.cInitialResponse* struct_cpp_obj):
        cdef __InitialResponse_FieldsSetter __fbthrift_inst = __InitialResponse_FieldsSetter.__new__(__InitialResponse_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"content")] = __InitialResponse_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__InitialResponse_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __InitialResponse_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field content
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cInitialResponse](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, str):
            raise TypeError(f'content is not a { str !r}.')
        deref(self._struct_cpp_obj).content_ref().assign(cmove(bytes_to_string(_fbthrift_value.encode('utf-8'))))


@__cython.auto_pickle(False)
cdef class __FinalResponse_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __FinalResponse_FieldsSetter _fbthrift_create(_module_cbindings.cFinalResponse* struct_cpp_obj):
        cdef __FinalResponse_FieldsSetter __fbthrift_inst = __FinalResponse_FieldsSetter.__new__(__FinalResponse_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"content")] = __FinalResponse_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__FinalResponse_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __FinalResponse_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field content
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cFinalResponse](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, str):
            raise TypeError(f'content is not a { str !r}.')
        deref(self._struct_cpp_obj).content_ref().assign(cmove(bytes_to_string(_fbthrift_value.encode('utf-8'))))


@__cython.auto_pickle(False)
cdef class __SinkPayload_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __SinkPayload_FieldsSetter _fbthrift_create(_module_cbindings.cSinkPayload* struct_cpp_obj):
        cdef __SinkPayload_FieldsSetter __fbthrift_inst = __SinkPayload_FieldsSetter.__new__(__SinkPayload_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"content")] = __SinkPayload_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__SinkPayload_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __SinkPayload_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field content
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cSinkPayload](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, str):
            raise TypeError(f'content is not a { str !r}.')
        deref(self._struct_cpp_obj).content_ref().assign(cmove(bytes_to_string(_fbthrift_value.encode('utf-8'))))


@__cython.auto_pickle(False)
cdef class __CompatibleWithKeywordSink_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __CompatibleWithKeywordSink_FieldsSetter _fbthrift_create(_module_cbindings.cCompatibleWithKeywordSink* struct_cpp_obj):
        cdef __CompatibleWithKeywordSink_FieldsSetter __fbthrift_inst = __CompatibleWithKeywordSink_FieldsSetter.__new__(__CompatibleWithKeywordSink_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"sink")] = __CompatibleWithKeywordSink_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__CompatibleWithKeywordSink_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __CompatibleWithKeywordSink_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field sink
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cCompatibleWithKeywordSink](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, str):
            raise TypeError(f'sink is not a { str !r}.')
        deref(self._struct_cpp_obj).sink_ref().assign(cmove(bytes_to_string(_fbthrift_value.encode('utf-8'))))


@__cython.auto_pickle(False)
cdef class __InitialException_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __InitialException_FieldsSetter _fbthrift_create(_module_cbindings.cInitialException* struct_cpp_obj):
        cdef __InitialException_FieldsSetter __fbthrift_inst = __InitialException_FieldsSetter.__new__(__InitialException_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"reason")] = __InitialException_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__InitialException_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __InitialException_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field reason
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cInitialException](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, str):
            raise TypeError(f'reason is not a { str !r}.')
        deref(self._struct_cpp_obj).reason_ref().assign(cmove(bytes_to_string(_fbthrift_value.encode('utf-8'))))


@__cython.auto_pickle(False)
cdef class __SinkException1_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __SinkException1_FieldsSetter _fbthrift_create(_module_cbindings.cSinkException1* struct_cpp_obj):
        cdef __SinkException1_FieldsSetter __fbthrift_inst = __SinkException1_FieldsSetter.__new__(__SinkException1_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"reason")] = __SinkException1_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__SinkException1_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __SinkException1_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field reason
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cSinkException1](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, str):
            raise TypeError(f'reason is not a { str !r}.')
        deref(self._struct_cpp_obj).reason_ref().assign(cmove(bytes_to_string(_fbthrift_value.encode('utf-8'))))


@__cython.auto_pickle(False)
cdef class __SinkException2_FieldsSetter(__StructFieldsSetter):

    @staticmethod
    cdef __SinkException2_FieldsSetter _fbthrift_create(_module_cbindings.cSinkException2* struct_cpp_obj):
        cdef __SinkException2_FieldsSetter __fbthrift_inst = __SinkException2_FieldsSetter.__new__(__SinkException2_FieldsSetter)
        __fbthrift_inst._struct_cpp_obj = struct_cpp_obj
        __fbthrift_inst._setters[__cstring_view(<const char*>"reason")] = __SinkException2_FieldsSetter._set_field_0
        return __fbthrift_inst

    cdef void set_field(__SinkException2_FieldsSetter self, const char* name, object value) except *:
        cdef __cstring_view cname = __cstring_view(name)
        cdef cumap[__cstring_view, __SinkException2_FieldsSetterFunc].iterator found = self._setters.find(cname)
        if found == self._setters.end():
            raise TypeError(f"invalid field name {name.decode('utf-8')}")
        deref(found).second(self, value)

    cdef void _set_field_0(self, _fbthrift_value) except *:
        # for field reason
        if _fbthrift_value is None:
            __reset_field[_module_cbindings.cSinkException2](deref(self._struct_cpp_obj), 0)
            return
        if not isinstance(_fbthrift_value, int):
            raise TypeError(f'reason is not a { int !r}.')
        _fbthrift_value = <cint64_t> _fbthrift_value
        deref(self._struct_cpp_obj).reason_ref().assign(_fbthrift_value)

