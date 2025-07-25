#
# Autogenerated by Thrift for thrift/compiler/test/fixtures/exceptions/src/module.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
from libc.stdint cimport (
    int8_t as cint8_t,
    int16_t as cint16_t,
    int32_t as cint32_t,
    int64_t as cint64_t,
)
from libcpp.memory cimport shared_ptr, make_shared, unique_ptr
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from libcpp.utility cimport move as cmove
from cython.operator cimport dereference as deref, typeid
from cpython.ref cimport PyObject
from thrift.py3.client cimport cRequestChannel_ptr, makeClientWrapper, cClientWrapper
from thrift.py3.exceptions cimport try_make_shared_exception
from thrift.python.exceptions cimport create_py_exception
from folly cimport cFollyTry, cFollyUnit, c_unit
from folly.cast cimport down_cast_ptr
from libcpp.typeinfo cimport type_info
import thrift.py3.types
cimport thrift.py3.types
from thrift.py3.types cimport make_unique
import thrift.py3.client
cimport thrift.py3.client
from thrift.python.common cimport (
    RpcOptions as __RpcOptions,
    cThriftServiceMetadataResponse as __fbthrift_cThriftServiceMetadataResponse,
    ServiceMetadata,
    MetadataBox as __MetadataBox,
)

from folly.futures cimport bridgeFutureWith
from folly.executor cimport get_executor
cimport folly.iobuf as _fbthrift_iobuf
import folly.iobuf as _fbthrift_iobuf
from folly.iobuf cimport move as move_iobuf
cimport cython

import sys
import types as _py_types
from asyncio import get_event_loop as asyncio_get_event_loop, shield as asyncio_shield, InvalidStateError as asyncio_InvalidStateError

cimport module.types as _module_types
cimport module.cbindings as _module_cbindings
import module.types as _module_types

cimport module.services_interface as _fbthrift_services_interface

from module.clients_wrapper cimport cRaiserAsyncClient, cRaiserClientWrapper


cdef void Raiser_doBland_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
) noexcept:
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void Raiser_doRaise_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
) noexcept:
    client, pyfuture, options = <object> userdata  
    if result.hasException[_module_cbindings.cBanal]():
        try:
            exc = _module_types.Banal._create_FBTHRIFT_ONLY_DO_NOT_USE(try_make_shared_exception[_module_cbindings.cBanal](result.exception()))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))
        else:
            pyfuture.set_exception(exc)
    elif result.hasException[_module_cbindings.cFiery]():
        try:
            exc = _module_types.Fiery._create_FBTHRIFT_ONLY_DO_NOT_USE(try_make_shared_exception[_module_cbindings.cFiery](result.exception()))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))
        else:
            pyfuture.set_exception(exc)
    elif result.hasException[_module_cbindings.cSerious]():
        try:
            exc = _module_types.Serious._create_FBTHRIFT_ONLY_DO_NOT_USE(try_make_shared_exception[_module_cbindings.cSerious](result.exception()))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))
        else:
            pyfuture.set_exception(exc)
    elif result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void Raiser_get200_callback(
    cFollyTry[string]&& result,
    PyObject* userdata
) noexcept:
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(result.value().data().decode('UTF-8'))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void Raiser_get500_callback(
    cFollyTry[string]&& result,
    PyObject* userdata
) noexcept:
    client, pyfuture, options = <object> userdata  
    if result.hasException[_module_cbindings.cFiery]():
        try:
            exc = _module_types.Fiery._create_FBTHRIFT_ONLY_DO_NOT_USE(try_make_shared_exception[_module_cbindings.cFiery](result.exception()))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))
        else:
            pyfuture.set_exception(exc)
    elif result.hasException[_module_cbindings.cBanal]():
        try:
            exc = _module_types.Banal._create_FBTHRIFT_ONLY_DO_NOT_USE(try_make_shared_exception[_module_cbindings.cBanal](result.exception()))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))
        else:
            pyfuture.set_exception(exc)
    elif result.hasException[_module_cbindings.cSerious]():
        try:
            exc = _module_types.Serious._create_FBTHRIFT_ONLY_DO_NOT_USE(try_make_shared_exception[_module_cbindings.cSerious](result.exception()))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))
        else:
            pyfuture.set_exception(exc)
    elif result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(result.value().data().decode('UTF-8'))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))


cdef object _Raiser_annotations = _py_types.MappingProxyType({
})


@cython.auto_pickle(False)
cdef class Raiser(thrift.py3.client.Client):
    annotations = _Raiser_annotations

    cdef const type_info* _typeid(Raiser self):
        return &typeid(cRaiserAsyncClient)

    cdef bind_client(Raiser self, cRequestChannel_ptr&& channel):
        self._client = makeClientWrapper[cRaiserAsyncClient, cRaiserClientWrapper](
            cmove(channel)
        )

    _fbthrift_annotations_DO_NOT_USE_doBland = {
        'return': 'None',
        
    }

    @cython.always_allow_keywords(True)
    def doBland(
            Raiser self,
            *,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = self._loop
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cRaiserClientWrapper, cClientWrapper](self._client.get()).doBland(rpc_options._cpp_obj, 
            ),
            Raiser_doBland_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    _fbthrift_annotations_DO_NOT_USE_doRaise = {
        'return': 'None',
        
    }

    @cython.always_allow_keywords(True)
    def doRaise(
            Raiser self,
            *,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = self._loop
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cRaiserClientWrapper, cClientWrapper](self._client.get()).doRaise(rpc_options._cpp_obj, 
            ),
            Raiser_doRaise_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    _fbthrift_annotations_DO_NOT_USE_get200 = {
        'return': 'str',
        
    }

    @cython.always_allow_keywords(True)
    def get200(
            Raiser self,
            *,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = self._loop
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[string](
            self._executor,
            down_cast_ptr[cRaiserClientWrapper, cClientWrapper](self._client.get()).get200(rpc_options._cpp_obj, 
            ),
            Raiser_get200_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    _fbthrift_annotations_DO_NOT_USE_get500 = {
        'return': 'str',
        
    }

    @cython.always_allow_keywords(True)
    def get500(
            Raiser self,
            *,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = self._loop
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[string](
            self._executor,
            down_cast_ptr[cRaiserClientWrapper, cClientWrapper](self._client.get()).get500(rpc_options._cpp_obj, 
            ),
            Raiser_get500_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)


    @staticmethod
    def __get_metadata__():
        cdef __fbthrift_cThriftServiceMetadataResponse response
        ServiceMetadata[_fbthrift_services_interface.cRaiserSvIf].gen(response)
        return __MetadataBox.box(cmove(deref(response.metadata_ref())))

    @staticmethod
    def __get_thrift_name__():
        return "module.Raiser"

