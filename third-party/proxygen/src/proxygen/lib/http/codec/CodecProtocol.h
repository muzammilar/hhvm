/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <cstdint>
#include <folly/Optional.h>
#include <folly/Range.h>
#include <proxygen/lib/utils/Export.h>
#include <string>

namespace proxygen {

enum class CodecProtocol : uint8_t {
  HTTP_1_1,
  HTTP_2,
  HQ,
  HTTP_3,
  HTTP_BINARY,
  TUNNEL_LITE,
};

/**
 * Returns a debugging name to refer to the given protocol.
 */
extern const std::string& getCodecProtocolString(CodecProtocol);

/**
 * Check if given debugging name refers to a valid protocol.
 */
extern bool isValidCodecProtocolStr(folly::StringPiece protocolStr);

/**
 * Get the protocol from the given debugging name.
 * If it's an invalid string, return the default protocol.
 */
extern CodecProtocol getCodecProtocolFromStr(folly::StringPiece protocolStr);

/**
 * Check if the given protocol is HTTP 1.1
 */
extern bool isHTTP1_1CodecProtocol(CodecProtocol protocol);

/**
 * Check if the given protocol is HTTP2.
 */
extern bool isHTTP2CodecProtocol(CodecProtocol protocol);

/**
 * Check if the given protocol is HQ
 */
extern bool isHQCodecProtocol(CodecProtocol protocol);

/**
 * Check if the given protocol is HTTP_BINARY
 */
extern bool isHTTPBinaryCodecProtocol(CodecProtocol protocol);

/**
 * Check if the given protocol supports paraellel requests
 */
extern bool isParallelCodecProtocol(CodecProtocol protocol);

/**
 * Check whether server has accepted client's upgrade request
 */
extern bool serverAcceptedUpgrade(const std::string& clientUpgrade,
                                  const std::string& serverUpgrade);

} // namespace proxygen
