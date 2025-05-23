/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

use std::io::Cursor;

use bufsize::SizeCounter;
use bytes::Buf;
use bytes::BufMut;
use bytes::Bytes;
use bytes::BytesMut;
use bytes::buf::Chain;

use crate::varint;

pub trait BufExt: Buf {
    /// Copy `len` Bytes from this (and advance the position), or reuse them from the underlying
    /// buffer if possible.
    fn copy_or_reuse_bytes(&mut self, len: usize) -> Bytes {
        // Default is to just copy.
        self.copy_to_bytes(len)
    }

    /// Whether there are enough remaining bytes to advance this buffer's
    /// internal cursor by `n`.
    ///
    /// Disjoint buffers for which `remaining()` is not O(1) should override
    /// this method with a more efficient implementation.
    fn can_advance(&self, n: usize) -> bool {
        n <= self.remaining()
    }

    /// Number of more bytes needed in order to be able to advance by `n`.
    ///
    /// If `n <= remaining()`, this is 0. Otherwise `n - remaining()`.
    ///
    /// Disjoint buffers for which `remaining()` is not O(1) should override
    /// this method with a more efficient implementation.
    fn shortfall(&self, n: usize) -> usize {
        n.saturating_sub(self.remaining())
    }
}

impl BufExt for Bytes {}

impl BufExt for Cursor<Bytes> {
    // We can get a reference to the underlying Bytes here, and reuse that.
    fn copy_or_reuse_bytes(&mut self, len: usize) -> Bytes {
        let pos = self.position() as usize;
        let end = pos + len;
        // Panics if len is too large (same as Bytes)
        let bytes = self.get_ref().slice(pos..end);
        self.set_position(end as u64);
        bytes
    }
}

impl<T: AsRef<[u8]> + ?Sized> BufExt for Cursor<&T> {}

impl<T: BufExt, U: BufExt> BufExt for Chain<T, U> {
    fn can_advance(&self, n: usize) -> bool {
        let rest = self.first_ref().shortfall(n);
        self.last_ref().can_advance(rest)
    }

    fn shortfall(&self, n: usize) -> usize {
        let rest = self.first_ref().shortfall(n);
        self.last_ref().shortfall(rest)
    }
}

pub trait BufMutExt: BufMut {
    type Final: Send + 'static;

    fn put_varint_u64(&mut self, v: u64)
    where
        Self: Sized,
    {
        varint::write_u64(self, v)
    }

    fn put_varint_i64(&mut self, v: i64)
    where
        Self: Sized,
    {
        varint::write_u64(self, varint::zigzag(v))
    }

    fn finalize(self) -> Self::Final;
}

impl BufMutExt for BytesMut {
    type Final = Bytes;

    fn finalize(self) -> Self::Final {
        self.freeze()
    }
}

impl BufMutExt for SizeCounter {
    type Final = usize;

    #[inline]
    fn put_varint_u64(&mut self, v: u64) {
        self.put_uint(v, varint::u64_len(v));
    }

    #[inline]
    fn put_varint_i64(&mut self, v: i64) {
        self.put_int(v, varint::u64_len(varint::zigzag(v)));
    }

    #[inline]
    fn finalize(self) -> Self::Final {
        self.size()
    }
}
// new type so we can impl From for Bytes vs other things that are AsRef<[u8]>
// Not implemented for AsRef<[u8]> as Bytes implements that
pub struct DeserializeSource<B: BufExt>(pub(crate) B);

impl<B: BufExt> DeserializeSource<B> {
    pub fn new(b: B) -> Self {
        DeserializeSource(b)
    }
}

// These types will use a copying cursor
macro_rules! impl_deser_as_ref_u8 {
    ( $($t:ty),* ) => {
        $(
            impl<'a> From<&'a $t> for DeserializeSource<Cursor<&'a [u8]>> {
                fn from(from: &'a $t) -> Self {
                    let data: &[u8] = from.as_ref();
                    Self(Cursor::new(data))
                }
            }
        )*
    }
}

impl_deser_as_ref_u8!([u8], Vec<u8>, String, str);

// These types take ownership without copying
// Have to explicitly do the Into types as well due to no upstream From<&Bytes> for Bytes.
macro_rules! impl_deser_into_bytes {
    ( $($t:ty),* ) => {
        $(
            impl From<$t> for DeserializeSource<Cursor<Bytes>> {
                fn from(from: $t) -> Self {
                    Self(Cursor::new(from.into()))
                }
            }
        )*
    }
}

impl_deser_into_bytes!(Bytes, Vec<u8>, String);

// Special case for &Bytes that is not covered in upstream crates From defs
impl From<&Bytes> for DeserializeSource<Cursor<Bytes>> {
    fn from(from: &Bytes) -> Self {
        // ok to clone Bytes, it just increments ref count
        Self(Cursor::new(from.clone()))
    }
}
