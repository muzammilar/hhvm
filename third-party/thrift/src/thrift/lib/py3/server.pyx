# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from cpython.version cimport PY_VERSION_HEX
from libcpp.memory cimport unique_ptr, shared_ptr, make_shared
from libcpp.optional cimport optional
from cython.operator cimport dereference as deref, preincrement as inc
from libc.stdint cimport uint64_t
from cpython.ref cimport PyObject
from folly.executor cimport get_executor
from folly.range cimport StringPiece
from libcpp.utility cimport move as cmove

import asyncio
import collections
import ipaddress
from pathlib import Path
import os

from enum import Enum
from thrift.python.common import Priority, Headers # noqa
from thrift.python.server_impl.event_handler cimport (
    SSLPolicy__DISABLED,
    SSLPolicy__PERMITTED,
    SSLPolicy__REQUIRED,
    getRequestId,
    makeFromPath,
    object_partial,
)
from thrift.python.server_impl.request_context import ( # noqa
    ClientMetadata,
    ConnectionContext,
    ReadHeaders,
    RequestContext,
    SocketAddress,
    WriteHeaders, 
)
from thrift.python.server_impl.request_context cimport handleAddressCallback


from contextvars import ContextVar
# don't include in the module dict, so only cython can set it
THRIFT_REQUEST_CONTEXT = ContextVar('ThriftRequestContext')
get_context = THRIFT_REQUEST_CONTEXT.get



class SSLPolicy(Enum):
    DISABLED = <int> (SSLPolicy__DISABLED)
    PERMITTED = <int> (SSLPolicy__PERMITTED)
    REQUIRED = <int> (SSLPolicy__REQUIRED)


cdef class AsyncProcessorFactory:
    async def __aenter__(self):
        # Establish async context managers as a way for end users to async initalize
        # internal structures used by Service Handlers.
        return self

    async def __aexit__(self, *exc_info):
        # Same as above, but allow end users to define things to be cleaned up
        pass

    @staticmethod
    def __get_metadata__():
        raise NotImplementedError()

    @staticmethod
    def __get_thrift_name__():
        raise NotImplementedError()

    async def onStartServing(self):
        pass

    async def onStopRequested(self):
        pass

    cdef cbool requireResourcePools(AsyncProcessorFactory self):
        """
        Override this method to conditionally call the requireResourcePools
        method of ThriftServer.
        NOTE: Once resource pools are the only option, it may be possible
        to remove this method.
        """
        # Tests for some implementations that use py3 servers fail
        # if this function returns True.
        # Some py3 tests implementation do not create metadata, which is a
        # prerequisite to call requireResourcePools() on the ThriftServer.
        # This function can return False with no adverse effects
        # in production. The effect is that py3 tests will not run with
        # resource pools enabled.
        # This function is still relevant because derived implementations
        # like thrift-python may enable resource pools
        # due to better guarantees about the presence of metadata.
        return False


cdef class ServiceInterface(AsyncProcessorFactory):
    pass


cdef class StatusServerInterface:
    pass




cdef class ThriftServer:
    def __cinit__(self):
        self.server = make_shared[cThriftServer]()

    def __init__(self, AsyncProcessorFactory handler, int port=0, ip=None, path=None, socket_fd=None):
        self.loop = asyncio.get_event_loop()
        self.factory = handler
        if handler is not None:
            self.server.get().setThreadManagerFromExecutor(get_executor(), b'python_executor')
            if handler._cpp_obj:
                self.server.get().setInterface(handler._cpp_obj)
                # Per the Thrift Resource Pools documentation, to enable resource pools,
                # use `requireResourcePools()` on the server before it starts.
                # Provide the opportunity for the handler implementation to
                # determine whether to enable resource pools.
                # For example, python servers have a Thrift Flag that gates the use of
                # resource pools.
                if handler.requireResourcePools():
                    self.server.get().requireResourcePools()
            else:
                raise RuntimeError(
                    'The handler is not valid, it has no C++ handler. Maybe its not a '
                    'generated ServiceInterface?'
                )
        else:
            # This thrift server is only for monitoring/status/control
            self.server.get().setInterface(make_shared[EmptyAsyncProcessorFactory]())
        if socket_fd:
            self.server.get().useExistingSocket(int(socket_fd))
        elif path:
            fspath = os.fsencode(path)
            self.server.get().setAddress(
                makeFromPath(
                    StringPiece(fspath, len(fspath))
                )
            )
        elif ip:
            # We stringify to accept python ipaddress objects
            self.server.get().setAddress(str(ip).encode('utf-8'), port)
        else:
            self.server.get().setPort(port)
        self.address_future = self.loop.create_future()
        self.server.get().setServerEventHandler(
            make_shared[Py3ServerEventHandler](
                get_executor(),
                object_partial(handleAddressCallback, <PyObject*> self.address_future)
            )
        )
        self.server.get().metadata().wrapper = b"ThriftServer-py3"

    async def serve(self):
        # This check is only useful for C++-based Thrift servers.
        # TODO(praihan): remove this after migration of C++ services onto extra interfaces
        self.server.get().setAllowCheckUnimplementedExtraInterfaces(False)
        def _serve():
            with nogil:
                self.server.get().serve()
        try:
            await self.loop.run_in_executor(None, _serve)
            self.address_future.cancel()
        except asyncio.CancelledError:
            try:
                await self.get_address()
            finally:
                self.server.get().stop()
            raise
        except Exception as e:
            self.server.get().stop()
            # If somebody is waiting on get_address and the server died
            # then we should forward this exception over to that future.
            if not self.address_future.done():
                self.address_future.set_exception(e)
            raise

    def set_status_interface(self, StatusServerInterface iface not None):
        self.server.get().setStatusInterface(iface._cpp_obj)

    def get_address(self):
        return asyncio.shield(self.address_future)

    def get_active_requests(self):
        return self.server.get().getActiveRequests()

    def get_max_requests(self):
        return self.server.get().getMaxRequests()

    def set_max_requests(self, max_requests):
        self.server.get().setMaxRequests(max_requests)

    def get_max_connections(self):
        return self.server.get().getMaxConnections()

    def set_max_connections(self, max_connections):
        self.server.get().setMaxConnections(max_connections)

    def get_listen_backlog(self):
        return self.server.get().getListenBacklog()

    def set_listen_backlog(self, listen_backlog):
        self.server.get().setListenBacklog(listen_backlog)

    def set_io_worker_threads(self, num):
        self.server.get().setNumIOWorkerThreads(num)

    def get_io_worker_threads(self):
        return self.server.get().getNumIOWorkerThreads()

    def get_cpu_worker_threads(self):
        return self.server.get().getNumCPUWorkerThreads()

    def set_workers_join_timeout(self, timeout):
        self.server.get().setWorkersJoinTimeout(seconds(<int64_t>timeout))

    def get_ssl_policy(self):
        cdef cSSLPolicy cPolicy = self.server.get().getSSLPolicy()
        if cPolicy == SSLPolicy__DISABLED:
            return SSLPolicy.DISABLED
        elif cPolicy == SSLPolicy__PERMITTED:
            return SSLPolicy.PERMITTED
        elif cPolicy == SSLPolicy__REQUIRED:
            return SSLPolicy.REQUIRED
        else:
            raise RuntimeError("Unknown SSLPolicy defined.")

    def set_ssl_policy(self, policy):
        cdef cSSLPolicy cPolicy
        if policy == SSLPolicy.DISABLED:
            cPolicy = SSLPolicy__DISABLED
        elif policy == SSLPolicy.PERMITTED:
            cPolicy = SSLPolicy__PERMITTED
        elif policy == SSLPolicy.REQUIRED:
            cPolicy = SSLPolicy__REQUIRED
        else:
            raise RuntimeError("Unknown SSLPolicy defined.")
        self.server.get().setSSLPolicy(cPolicy)

    def set_allow_plaintext_on_loopback(self, enabled):
        self.server.get().setAllowPlaintextOnLoopback(enabled);

    def is_plaintext_allowed_on_loopback(self):
        return self.server.get().isPlaintextAllowedOnLoopback();

    def set_idle_timeout(self, seconds):
        self.server.get().setIdleTimeout(milliseconds(<int64_t>(seconds * 1000)))

    def get_idle_timeout(self):
        return self.server.get().getIdleTimeout().count() / 1000

    def set_queue_timeout(self, seconds):
        self.server.get().setQueueTimeout(milliseconds(<int64_t>(seconds * 1000)))

    def get_queue_timeout(self):
        return self.server.get().getQueueTimeout().count() / 1000

    def set_socket_queue_timeout(self, seconds):
        self.server.get().setSocketQueueTimeout(milliseconds(<int64_t>(seconds * 1000)))

    def get_socket_queue_timeout(self):
        return self.server.get().getSocketQueueTimeoutMs().count() / 1000
    
    cdef void set_is_overloaded(self, cIsOverloadedFunc is_overloaded):
        self.server.get().setIsOverloaded(cmove(is_overloaded))

    def set_language_framework_name(self, name):
        self.server.get().metadata().languageFramework = name.encode()

    def stop(self):
        self.server.get().stop()

    def stop_listening(self):
        self.server.get().stopListening()

    def use_existing_socket(self, socket):
        self.server.get().useExistingSocket(socket)

    def set_stop_workers_on_stop_listening(self, cbool stop_workers):
        self.server.get().setStopWorkersOnStopListening(stop_workers)

    def get_stop_workers_on_stop_listening(self):
        return self.server.get().getStopWorkersOnStopListening()

    def set_idle_server_timeout(self, seconds):
        self.server.get().setIdleServerTimeout(milliseconds(<int64_t>(seconds * 1000)))

    def get_quick_exit_on_shutdown_timeout(self):
        return self.server.get().getQuickExitOnShutdownTimeout()

    def set_quick_exit_on_shutdown_timeout(self, cbool quick_exit_on_shutdown_timeout):
        self.server.get().setQuickExitOnShutdownTimeout(quick_exit_on_shutdown_timeout)

    cdef void add_routing_handler(self, unique_ptr[cTransportRoutingHandler] handler):
        self.server.get().addRoutingHandler(cmove(handler))

    def disable_info_logging(self):
        self.server.get().disableInfoLogging()

    def is_resource_pool_enabled(self) -> bool:
        return self.server.get().resourcePoolEnabled()

    def set_task_expire_time(self, seconds):
        self.server.get().setTaskExpireTime(milliseconds(<int64_t>(seconds * 1000)))

    def set_use_client_timeout(self, cbool use_client_timeout):
        self.server.get().setUseClientTimeout(use_client_timeout)
