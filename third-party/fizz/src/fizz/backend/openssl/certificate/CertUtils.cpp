/*
 *  Copyright (c) 2018-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree.
 */

#include <fizz/backend/openssl/certificate/CertUtils.h>
#include <fizz/backend/openssl/certificate/OpenSSLPeerCertImpl.h>
#include <fizz/backend/openssl/certificate/OpenSSLSelfCertImpl.h>
#include <fizz/protocol/Certificate.h>
#include <folly/ssl/OpenSSLCertUtils.h>
#include <openssl/bio.h>

namespace {
int getCurveName(EVP_PKEY* key) {
  auto ecKey = EVP_PKEY_get0_EC_KEY(key);
  if (ecKey) {
    return EC_GROUP_get_curve_name(EC_KEY_get0_group(ecKey));
  }
  return 0;
}
} // namespace

namespace fizz {
namespace openssl {

namespace detail {

folly::Optional<std::string> getIdentityFromX509(X509* x) {
  auto cn = folly::ssl::OpenSSLCertUtils::getCommonName(*x);
  if (cn.has_value()) {
    return std::move(cn).value();
  }

  return folly::ssl::OpenSSLCertUtils::getSubject(*x);
}
} // namespace detail

CertificateMsg CertUtils::getCertMessage(
    const std::vector<folly::ssl::X509UniquePtr>& certs,
    Buf certificateRequestContext) {
  // compose the cert entry list
  std::vector<CertificateEntry> entries;
  for (const auto& cert : certs) {
    CertificateEntry entry;
    int len = i2d_X509(cert.get(), nullptr);
    if (len < 0) {
      throw std::runtime_error("Error computing length");
    }
    entry.cert_data = folly::IOBuf::create(len);
    auto dataPtr = entry.cert_data->writableData();
    len = i2d_X509(cert.get(), &dataPtr);
    if (len < 0) {
      throw std::runtime_error("Error converting cert to DER");
    }
    entry.cert_data->append(len);
    // TODO: add any extensions.
    entries.push_back(std::move(entry));
  }

  CertificateMsg msg;
  msg.certificate_request_context = std::move(certificateRequestContext);
  msg.certificate_list = std::move(entries);
  return msg;
}

std::unique_ptr<PeerCert> CertUtils::makePeerCert(folly::ByteRange range) {
  if (range.size() == 0) {
    throw std::runtime_error("empty peer cert");
  }
  const unsigned char* begin = range.data();
  folly::ssl::X509UniquePtr cert(d2i_X509(nullptr, &begin, range.size()));
  if (!cert) {
    throw std::runtime_error("could not read cert");
  }
  if (begin != range.data() + range.size()) {
    VLOG(1) << "Did not read to end of certificate";
  }
  return makePeerCert(std::move(cert));
}
std::unique_ptr<PeerCert> CertUtils::makePeerCert(Buf certData) {
  return makePeerCert(certData->coalesce());
}

std::unique_ptr<PeerCert> CertUtils::makePeerCert(
    folly::ssl::X509UniquePtr cert) {
  folly::ssl::EvpPkeyUniquePtr pubKey(X509_get_pubkey(cert.get()));
  if (!pubKey) {
    throw std::runtime_error("couldn't get pubkey from peer cert");
  }
  const auto pkeyID = EVP_PKEY_id(pubKey.get());
  if (pkeyID == EVP_PKEY_RSA) {
    return std::make_unique<OpenSSLPeerCertImpl<KeyType::RSA>>(std::move(cert));
  } else if (pkeyID == EVP_PKEY_EC) {
    switch (getCurveName(pubKey.get())) {
      case NID_X9_62_prime256v1:
        return std::make_unique<OpenSSLPeerCertImpl<KeyType::P256>>(
            std::move(cert));
      case NID_secp384r1:
        return std::make_unique<OpenSSLPeerCertImpl<KeyType::P384>>(
            std::move(cert));
      case NID_secp521r1:
        return std::make_unique<OpenSSLPeerCertImpl<KeyType::P521>>(
            std::move(cert));
      default:
        break;
    }
  } else if (pkeyID == EVP_PKEY_ED25519) {
    return std::make_unique<OpenSSLPeerCertImpl<KeyType::ED25519>>(
        std::move(cert));
  }
  throw std::runtime_error("unknown peer cert type");
}

folly::ssl::EvpPkeyUniquePtr CertUtils::readPrivateKeyFromBuffer(
    std::string keyData,
    char* password) {
  folly::ssl::BioUniquePtr b(BIO_new_mem_buf(
      const_cast<void*>( // needed by openssl 1.0.2d at least
          reinterpret_cast<const void*>(keyData.data())),
      keyData.size()));

  if (!b) {
    throw std::runtime_error("failed to create BIO");
  }

  folly::ssl::EvpPkeyUniquePtr key(
      PEM_read_bio_PrivateKey(b.get(), nullptr, nullptr, password));

  if (!key) {
    throw std::runtime_error("Failed to read key");
  }

  return key;
}

namespace {

std::unique_ptr<SelfCert> selfCertFromDataInternal(
    std::string certData,
    std::string keyData,
    char* password,
    const std::vector<std::shared_ptr<CertificateCompressor>>& compressors) {
  auto certs = folly::ssl::OpenSSLCertUtils::readCertsFromBuffer(
      folly::StringPiece(certData));
  if (certs.empty()) {
    throw std::runtime_error("no certificates read");
  }

  auto key = CertUtils::readPrivateKeyFromBuffer(std::move(keyData), password);

  return CertUtils::makeSelfCert(std::move(certs), std::move(key), compressors);
}

} // namespace

std::unique_ptr<SelfCert> CertUtils::makeSelfCert(
    std::string certData,
    std::string keyData,
    const std::vector<std::shared_ptr<CertificateCompressor>>& compressors) {
  return selfCertFromDataInternal(
      std::move(certData), std::move(keyData), nullptr, compressors);
}

std::unique_ptr<SelfCert> CertUtils::makeSelfCert(
    std::string certData,
    std::string encryptedKeyData,
    std::string password,
    const std::vector<std::shared_ptr<CertificateCompressor>>& compressors) {
  return selfCertFromDataInternal(
      std::move(certData),
      std::move(encryptedKeyData),
      &password[0],
      compressors);
}

KeyType CertUtils::getKeyType(const folly::ssl::EvpPkeyUniquePtr& key) {
  const auto pkeyID = EVP_PKEY_id(key.get());
  if (pkeyID == EVP_PKEY_RSA) {
    return KeyType::RSA;
  } else if (pkeyID == EVP_PKEY_EC) {
    switch (getCurveName(key.get())) {
      case NID_X9_62_prime256v1:
        return KeyType::P256;
      case NID_secp384r1:
        return KeyType::P384;
      case NID_secp521r1:
        return KeyType::P521;
    }
  } else if (pkeyID == EVP_PKEY_ED25519) {
    return KeyType::ED25519;
  }

  throw std::runtime_error("unknown key type");
}

std::vector<SignatureScheme> CertUtils::getSigSchemes(KeyType type) {
  switch (type) {
    case KeyType::RSA:
      return getSigSchemes<KeyType::RSA>();
    case KeyType::P256:
      return getSigSchemes<KeyType::P256>();
    case KeyType::P384:
      return getSigSchemes<KeyType::P384>();
    case KeyType::P521:
      return getSigSchemes<KeyType::P521>();
    case KeyType::ED25519:
      return getSigSchemes<KeyType::ED25519>();
  }

  throw std::runtime_error("unknown key type");
}

std::unique_ptr<SelfCert> CertUtils::makeSelfCert(
    std::vector<folly::ssl::X509UniquePtr> certs,
    folly::ssl::EvpPkeyUniquePtr key,
    const std::vector<std::shared_ptr<CertificateCompressor>>& compressors) {
  folly::ssl::EvpPkeyUniquePtr pubKey(X509_get_pubkey(certs.front().get()));
  if (!pubKey) {
    throw std::runtime_error("Failed to read public key");
  }

  switch (getKeyType(pubKey)) {
    case KeyType::RSA:
      return std::make_unique<OpenSSLSelfCertImpl<KeyType::RSA>>(
          std::move(key), std::move(certs), compressors);
    case KeyType::P256:
      return std::make_unique<OpenSSLSelfCertImpl<KeyType::P256>>(
          std::move(key), std::move(certs), compressors);
    case KeyType::P384:
      return std::make_unique<OpenSSLSelfCertImpl<KeyType::P384>>(
          std::move(key), std::move(certs), compressors);
    case KeyType::P521:
      return std::make_unique<OpenSSLSelfCertImpl<KeyType::P521>>(
          std::move(key), std::move(certs), compressors);
    case KeyType::ED25519:
      return std::make_unique<OpenSSLSelfCertImpl<KeyType::ED25519>>(
          std::move(key), std::move(certs), compressors);
  }

  throw std::runtime_error("unknown self cert type");
}

CompressedCertificate CertUtils::cloneCompressedCert(
    const CompressedCertificate& src) {
  CompressedCertificate ret;
  ret.algorithm = src.algorithm;
  ret.compressed_certificate_message =
      src.compressed_certificate_message->clone();
  ret.uncompressed_length = src.uncompressed_length;
  return ret;
}

namespace {
class Serializer : public CertificateSerialization {
  std::unique_ptr<folly::IOBuf> serialize(
      const fizz::Cert& cert) const override {
    if (auto opensslCert =
            dynamic_cast<const folly::OpenSSLTransportCertificate*>(&cert)) {
      if (auto x509 = opensslCert->getX509()) {
        return folly::ssl::OpenSSLCertUtils::derEncode(*x509);
      }
    }
    return nullptr;
  }

  std::shared_ptr<const fizz::Cert> deserialize(
      folly::ByteRange range) const override {
    return CertUtils::makePeerCert(range);
  }
};
} // namespace

const CertificateSerialization& certificateSerializer() {
  static Serializer instance;
  return instance;
}

} // namespace openssl
} // namespace fizz
