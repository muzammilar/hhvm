
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
import c.thrift_types as __thrift_types

cdef api int can_extract__c__C(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.C) else 0


cdef api object init__c__C(object data):
    return __thrift_types.C._fbthrift_from_internal_data(data)

cdef api int can_extract__c__E(object __obj) except -1:
    return 1 if isinstance(__obj, __thrift_types.E) else 0


cdef api object init__c__E(object data):
    return __thrift_types.E._fbthrift_from_internal_data(data)

