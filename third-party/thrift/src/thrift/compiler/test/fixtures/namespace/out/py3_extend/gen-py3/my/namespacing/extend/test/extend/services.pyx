#
# Autogenerated by Thrift for thrift/compiler/test/fixtures/namespace/src/extend.thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

cimport cython
from typing import AsyncIterator
from cpython.version cimport PY_VERSION_HEX
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
from libcpp.pair cimport pair
from cython.operator cimport dereference as deref
from cpython.ref cimport PyObject
from thrift.python.exceptions cimport (
    ApplicationError as __ApplicationError,
    cTApplicationException,
    cTApplicationExceptionType__UNKNOWN,
)
from thrift.py3.server cimport ServiceInterface
from thrift.python.server_impl.request_context cimport (
    Cpp2RequestContext,
    RequestContext,
    THRIFT_REQUEST_CONTEXT as __THRIFT_REQUEST_CONTEXT,
)
from thrift.python.server_impl.request_context import RequestContext
from folly cimport (
  cFollyPromise,
  cFollyUnit,
  c_unit,
)
from thrift.python.common cimport (
    cThriftServiceMetadataResponse as __fbthrift_cThriftServiceMetadataResponse,
    ServiceMetadata,
    MetadataBox as __MetadataBox,
)

from thrift.py3.types cimport make_unique

cimport folly.futures
from folly.executor cimport get_executor
cimport folly.iobuf as _fbthrift_iobuf
import folly.iobuf as _fbthrift_iobuf
from folly.iobuf cimport move as move_iobuf
from folly.memory cimport to_shared_ptr as __to_shared_ptr

cimport my.namespacing.extend.test.extend.types as _my_namespacing_extend_test_extend_types
cimport my.namespacing.extend.test.extend.cbindings as _my_namespacing_extend_test_extend_cbindings
import my.namespacing.extend.test.extend.types as _my_namespacing_extend_test_extend_types
cimport my.namespacing.test.hsmodule.services as _my_namespacing_test_hsmodule_services
import my.namespacing.test.hsmodule.services as _my_namespacing_test_hsmodule_services
import my.namespacing.test.hsmodule.types as _my_namespacing_test_hsmodule_types
cimport my.namespacing.test.hsmodule.types as _my_namespacing_test_hsmodule_types
cimport my.namespacing.test.hsmodule.cbindings as _my_namespacing_test_hsmodule_cbindings

cimport my.namespacing.extend.test.extend.services_interface as _fbthrift_services_interface

import asyncio
import functools
import sys
import traceback
import types as _py_types

from my.namespacing.extend.test.extend.services_wrapper cimport cExtendTestServiceInterface



@cython.auto_pickle(False)
cdef class Promise_cbool:
    cdef cFollyPromise[cbool]* cPromise

    def __cinit__(self):
        self.cPromise = new cFollyPromise[cbool](cFollyPromise[cbool].makeEmpty())

    def __dealloc__(self):
        del self.cPromise

    @staticmethod
    cdef _fbthrift_create(cFollyPromise[cbool] cPromise):
        cdef Promise_cbool inst = Promise_cbool.__new__(Promise_cbool)
        inst.cPromise[0] = cmove(cPromise)
        return inst

@cython.auto_pickle(False)
cdef class Promise_cFollyUnit:
    cdef cFollyPromise[cFollyUnit]* cPromise

    def __cinit__(self):
        self.cPromise = new cFollyPromise[cFollyUnit](cFollyPromise[cFollyUnit].makeEmpty())

    def __dealloc__(self):
        del self.cPromise

    @staticmethod
    cdef _fbthrift_create(cFollyPromise[cFollyUnit] cPromise):
        cdef Promise_cFollyUnit inst = Promise_cFollyUnit.__new__(Promise_cFollyUnit)
        inst.cPromise[0] = cmove(cPromise)
        return inst

cdef object _ExtendTestService_annotations = _py_types.MappingProxyType({
})


@cython.auto_pickle(False)
cdef class ExtendTestServiceInterface(
    _my_namespacing_test_hsmodule_services.HsTestServiceInterface
):
    annotations = _ExtendTestService_annotations

    def __cinit__(self):
        self._cpp_obj = cExtendTestServiceInterface(
            <PyObject *> self,
            get_executor()
        )

    _fbthrift_annotations_DO_NOT_USE_check = {
        'return': 'bool',
        'struct1': 'my.namespacing.test.hsmodule.types.HsFoo', 
    }

    async def check(
            self,
            struct1):
        raise NotImplementedError("async def check is not implemented")

    @staticmethod
    def __get_metadata__():
        cdef __fbthrift_cThriftServiceMetadataResponse response
        ServiceMetadata[_fbthrift_services_interface.cExtendTestServiceSvIf].gen(response)
        return __MetadataBox.box(cmove(deref(response.metadata_ref())))

    @staticmethod
    def __get_thrift_name__():
        return "extend.ExtendTestService"



cdef api void call_cy_ExtendTestService_check(
    object self,
    Cpp2RequestContext* ctx,
    cFollyPromise[cbool] cPromise,
    unique_ptr[_my_namespacing_test_hsmodule_cbindings.cHsFoo] struct1
) noexcept:
    cdef Promise_cbool __promise = Promise_cbool._fbthrift_create(cmove(cPromise))
    arg_struct1 = _my_namespacing_test_hsmodule_types.HsFoo._create_FBTHRIFT_ONLY_DO_NOT_USE(shared_ptr[_my_namespacing_test_hsmodule_cbindings.cHsFoo](struct1.release()))
    __context = RequestContext._fbthrift_create(ctx)
    __context_token = __THRIFT_REQUEST_CONTEXT.set(__context)
    asyncio.get_event_loop().create_task(
        ExtendTestService_check_coro(
            self,
            __promise,
            arg_struct1
        )
    )
    __THRIFT_REQUEST_CONTEXT.reset(__context_token)
cdef api void call_cy_ExtendTestService_onStartServing(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) noexcept:
    cdef Promise_cFollyUnit __promise = Promise_cFollyUnit._fbthrift_create(cmove(cPromise))
    asyncio.get_event_loop().create_task(
        ExtendTestService_onStartServing_coro(
            self,
            __promise
        )
    )
cdef api void call_cy_ExtendTestService_onStopRequested(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) noexcept:
    cdef Promise_cFollyUnit __promise = Promise_cFollyUnit._fbthrift_create(cmove(cPromise))
    asyncio.get_event_loop().create_task(
        ExtendTestService_onStopRequested_coro(
            self,
            __promise
        )
    )
async def ExtendTestService_check_coro(
    object self,
    Promise_cbool promise,
    struct1
):
    try:
        result = await self.check(
                    struct1)
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler ExtendTestService.check:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    except asyncio.CancelledError as ex:
        print("Coroutine was cancelled in service handler ExtendTestService.check:", file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, (f'Application was cancelled on the server with message: {str(ex)}').encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(<cbool> result)

async def ExtendTestService_onStartServing_coro(
    object self,
    Promise_cFollyUnit promise
):
    try:
        result = await self.onStartServing()
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler ExtendTestService.onStartServing:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    except asyncio.CancelledError as ex:
        print("Coroutine was cancelled in service handler ExtendTestService.onStartServing:", file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, (f'Application was cancelled on the server with message: {str(ex)}').encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

async def ExtendTestService_onStopRequested_coro(
    object self,
    Promise_cFollyUnit promise
):
    try:
        result = await self.onStopRequested()
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler ExtendTestService.onStopRequested:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    except asyncio.CancelledError as ex:
        print("Coroutine was cancelled in service handler ExtendTestService.onStopRequested:", file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, (f'Application was cancelled on the server with message: {str(ex)}').encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

