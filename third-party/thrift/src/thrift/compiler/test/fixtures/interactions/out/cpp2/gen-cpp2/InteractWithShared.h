/**
 * Autogenerated by Thrift for thrift/compiler/test/fixtures/interactions/src/module.thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated @nocommit
 */
#pragma once

#include <thrift/lib/cpp2/gen/service_h.h>

#include "thrift/compiler/test/fixtures/interactions/gen-cpp2/InteractWithSharedAsyncClient.h"
#include "thrift/compiler/test/fixtures/interactions/gen-cpp2/module_types.h"
#include "thrift/compiler/test/fixtures/interactions/gen-cpp2/shared_types.h"
#include <thrift/lib/cpp2/async/ServerStream.h>
#include <thrift/lib/cpp2/async/Sink.h>

namespace folly {
  class IOBuf;
  class IOBufQueue;
}
namespace apache { namespace thrift {
  class Cpp2RequestContext;
  class BinaryProtocolReader;
  class CompactProtocolReader;
  namespace transport { class THeader; }
}}

namespace cpp2 {
class InteractWithShared;
class InteractWithSharedAsyncProcessor;

class InteractWithSharedServiceInfoHolder : public apache::thrift::ServiceInfoHolder {
  public:
   apache::thrift::ServiceRequestInfoMap const& requestInfoMap() const override;
   static apache::thrift::ServiceRequestInfoMap staticRequestInfoMap();
};
} // namespace cpp2

namespace apache::thrift {
template <>
class ServiceHandler<::cpp2::InteractWithShared> : public apache::thrift::ServerInterface {
  static_assert(!folly::is_detected_v<::apache::thrift::detail::st::detect_complete, ::cpp2::InteractWithShared>, "Definition collision with service tag. Either rename the Thrift service using @cpp.Name annotation or rename the conflicting C++ type.");

 public:
  std::string_view getGeneratedName() const override { return "InteractWithShared"; }

  typedef ::cpp2::InteractWithSharedAsyncProcessor ProcessorType;
  std::unique_ptr<apache::thrift::AsyncProcessor> getProcessor() override;
  CreateMethodMetadataResult createMethodMetadata() override;
  bool isThriftGenerated() const override final { return true; }
 private:
  std::optional<std::reference_wrapper<apache::thrift::ServiceRequestInfoMap const>> getServiceRequestInfoMap() const;
 public:
class MyInteractionServiceInfoHolder : public apache::thrift::ServiceInfoHolder {
  public:
   apache::thrift::ServiceRequestInfoMap const& requestInfoMap() const override;
   static apache::thrift::ServiceRequestInfoMap staticRequestInfoMap();
};


class MyInteractionIf : public apache::thrift::Tile, public apache::thrift::ServerInterface {
 public:
  std::string_view getGeneratedName() const override { return "MyInteraction"; }

  typedef ::cpp2::InteractWithSharedAsyncProcessor ProcessorType;
  std::unique_ptr<apache::thrift::AsyncProcessor> getProcessor() override {
    std::terminate();
  }
  CreateMethodMetadataResult createMethodMetadata() override {
    std::terminate();
  }
  virtual ::std::int32_t sync_frobnicate();
  [[deprecated("Use sync_frobnicate instead")]] virtual ::std::int32_t frobnicate();
  virtual folly::SemiFuture<::std::int32_t> semifuture_frobnicate();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<::std::int32_t> co_frobnicate();
  virtual folly::coro::Task<::std::int32_t> co_frobnicate(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_frobnicate(apache::thrift::HandlerCallbackPtr<::std::int32_t> callback);
  virtual void sync_ping();
  [[deprecated("Use sync_ping instead")]] virtual void ping();
  virtual folly::SemiFuture<folly::Unit> semifuture_ping();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<void> co_ping();
  virtual folly::coro::Task<void> co_ping(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_ping(apache::thrift::HandlerCallbackOneWay::Ptr callback);
  virtual ::apache::thrift::ServerStream<bool> sync_truthify();
  [[deprecated("Use sync_truthify instead")]] virtual ::apache::thrift::ServerStream<bool> truthify();
  virtual folly::SemiFuture<::apache::thrift::ServerStream<bool>> semifuture_truthify();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<::apache::thrift::ServerStream<bool>> co_truthify();
  virtual folly::coro::Task<::apache::thrift::ServerStream<bool>> co_truthify(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_truthify(apache::thrift::HandlerCallbackPtr<::apache::thrift::ServerStream<bool>> callback);
  virtual ::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string> sync_encode();
  [[deprecated("Use sync_encode instead")]] virtual ::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string> encode();
  virtual folly::SemiFuture<::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string>> semifuture_encode();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string>> co_encode();
  virtual folly::coro::Task<::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string>> co_encode(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_encode(apache::thrift::HandlerCallbackPtr<::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string>> callback);
 private:
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_frobnicate{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_ping{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_truthify{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_encode{apache::thrift::detail::si::InvocationType::AsyncTm};
};class SharedInteractionServiceInfoHolder : public apache::thrift::ServiceInfoHolder {
  public:
   apache::thrift::ServiceRequestInfoMap const& requestInfoMap() const override;
   static apache::thrift::ServiceRequestInfoMap staticRequestInfoMap();
};


class SharedInteractionIf : public apache::thrift::Tile, public apache::thrift::ServerInterface {
 public:
  std::string_view getGeneratedName() const override { return "SharedInteraction"; }

  typedef ::cpp2::InteractWithSharedAsyncProcessor ProcessorType;
  std::unique_ptr<apache::thrift::AsyncProcessor> getProcessor() override {
    std::terminate();
  }
  CreateMethodMetadataResult createMethodMetadata() override {
    std::terminate();
  }
  virtual ::std::int32_t sync_init();
  [[deprecated("Use sync_init instead")]] virtual ::std::int32_t init();
  virtual folly::SemiFuture<::std::int32_t> semifuture_init();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<::std::int32_t> co_init();
  virtual folly::coro::Task<::std::int32_t> co_init(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_init(apache::thrift::HandlerCallbackPtr<::std::int32_t> callback);
  virtual void sync_do_something(::thrift::shared_interactions::DoSomethingResult& /*_return*/);
  [[deprecated("Use sync_do_something instead")]] virtual void do_something(::thrift::shared_interactions::DoSomethingResult& /*_return*/);
  virtual folly::SemiFuture<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> semifuture_do_something();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> co_do_something();
  virtual folly::coro::Task<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> co_do_something(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_do_something(apache::thrift::HandlerCallbackPtr<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> callback);
  virtual void sync_tear_down();
  [[deprecated("Use sync_tear_down instead")]] virtual void tear_down();
  virtual folly::SemiFuture<folly::Unit> semifuture_tear_down();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<void> co_tear_down();
  virtual folly::coro::Task<void> co_tear_down(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_tear_down(apache::thrift::HandlerCallbackPtr<void> callback);
 private:
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_init{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_do_something{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_tear_down{apache::thrift::detail::si::InvocationType::AsyncTm};
};
  virtual void sync_do_some_similar_things(::thrift::shared_interactions::DoSomethingResult& /*_return*/);
  [[deprecated("Use sync_do_some_similar_things instead")]] virtual void do_some_similar_things(::thrift::shared_interactions::DoSomethingResult& /*_return*/);
  virtual folly::Future<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> future_do_some_similar_things();
  virtual folly::SemiFuture<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> semifuture_do_some_similar_things();
#if FOLLY_HAS_COROUTINES
  virtual folly::coro::Task<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> co_do_some_similar_things();
  virtual folly::coro::Task<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> co_do_some_similar_things(apache::thrift::RequestParams params);
#endif
  virtual void async_tm_do_some_similar_things(apache::thrift::HandlerCallbackPtr<std::unique_ptr<::thrift::shared_interactions::DoSomethingResult>> callback);
  virtual std::unique_ptr<MyInteractionIf> createMyInteraction();
  virtual std::unique_ptr<SharedInteractionIf> createshared.SharedInteraction();
 private:
  static ::cpp2::InteractWithSharedServiceInfoHolder __fbthrift_serviceInfoHolder;
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_do_some_similar_things{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_createMyInteraction{apache::thrift::detail::si::InvocationType::AsyncTm};
  std::atomic<apache::thrift::detail::si::InvocationType> __fbthrift_invocation_createshared.SharedInteraction{apache::thrift::detail::si::InvocationType::AsyncTm};
};

namespace detail {
template <> struct TSchemaAssociation<::cpp2::InteractWithShared, false> {
  static ::folly::Range<const ::std::string_view*>(*bundle)();
  static constexpr int64_t programId = 5169293820847068718;
  static constexpr ::std::string_view definitionKey = {"\x5e\x89\x9e\x37\x87\x31\xb2\x19\x68\x89\x31\x3f\x45\xd3\x56\xa9", 16};
};
}
} // namespace apache::thrift

namespace cpp2 {
using InteractWithSharedSvIf [[deprecated("Use apache::thrift::ServiceHandler<InteractWithShared> instead")]] = ::apache::thrift::ServiceHandler<InteractWithShared>;
} // namespace cpp2

namespace cpp2 {
class InteractWithSharedSvNull : public ::apache::thrift::ServiceHandler<InteractWithShared> {
 public:
  void do_some_similar_things(::thrift::shared_interactions::DoSomethingResult& /*_return*/) override;
};

class InteractWithSharedAsyncProcessor : public ::apache::thrift::GeneratedAsyncProcessorBase {
 public:
  std::string_view getServiceName() override;
  void getServiceMetadata(apache::thrift::metadata::ThriftServiceMetadataResponse& response) override;
  using BaseAsyncProcessor = void;
 protected:
  ::apache::thrift::ServiceHandler<::cpp2::InteractWithShared>* iface_;
 public:
  void processSerializedCompressedRequestWithMetadata(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, const apache::thrift::AsyncProcessorFactory::MethodMetadata& methodMetadata, apache::thrift::protocol::PROTOCOL_TYPES protType, apache::thrift::Cpp2RequestContext* context, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm) override;
  void executeRequest(apache::thrift::ServerRequest&& serverRequest, const apache::thrift::AsyncProcessorFactory::MethodMetadata& methodMetadata) override;
 public:
  using ProcessFuncs = GeneratedAsyncProcessorBase::ProcessFuncs<InteractWithSharedAsyncProcessor>;
  using ProcessMap = GeneratedAsyncProcessorBase::ProcessMap<ProcessFuncs>;
  using InteractionConstructor = GeneratedAsyncProcessorBase::InteractionConstructor<InteractWithSharedAsyncProcessor>;
  using InteractionConstructorMap = GeneratedAsyncProcessorBase::InteractionConstructorMap<InteractionConstructor>;
  static const InteractWithSharedAsyncProcessor::ProcessMap& getOwnProcessMap();
  static const InteractWithSharedAsyncProcessor::InteractionConstructorMap& getInteractionConstructorMap();
  std::unique_ptr<apache::thrift::Tile> createInteractionImpl(const std::string& name, int16_t) override;
 private:
  static const InteractWithSharedAsyncProcessor::ProcessMap kOwnProcessMap_;
  static const InteractWithSharedAsyncProcessor::InteractionConstructorMap interactionConstructorMap_;
 private:
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_do_some_similar_things(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_do_some_similar_things(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static apache::thrift::SerializedResponse return_do_some_similar_things(apache::thrift::ContextStack* ctx, ::thrift::shared_interactions::DoSomethingResult const& _return);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_do_some_similar_things(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
  std::unique_ptr<apache::thrift::Tile> createMyInteraction() {
    return iface_->createMyInteraction();
  }
  std::unique_ptr<apache::thrift::Tile> createshared.SharedInteraction() {
    return iface_->createshared.SharedInteraction();
  }
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_MyInteraction_frobnicate(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_MyInteraction_frobnicate(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static apache::thrift::SerializedResponse return_MyInteraction_frobnicate(apache::thrift::ContextStack* ctx, ::std::int32_t const& _return);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_MyInteraction_frobnicate(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_MyInteraction_ping(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_MyInteraction_ping(apache::thrift::ServerRequest&& serverRequest);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_MyInteraction_truthify(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_MyInteraction_truthify(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static apache::thrift::ResponseAndServerStreamFactory return_MyInteraction_truthify(apache::thrift::ContextStack* ctx, folly::Executor::KeepAlive<> executor, ::apache::thrift::ServerStream<bool>&& _return);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_MyInteraction_truthify(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_MyInteraction_encode(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_MyInteraction_encode(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static std::pair<apache::thrift::SerializedResponse, apache::thrift::detail::SinkConsumerImpl> return_MyInteraction_encode(apache::thrift::ContextStack* ctx, ::apache::thrift::ResponseAndSinkConsumer<::std::set<::std::int32_t>, ::std::string, ::std::string>&& _return, folly::Executor::KeepAlive<> executor);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_MyInteraction_encode(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_SharedInteraction_init(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_SharedInteraction_init(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static apache::thrift::SerializedResponse return_SharedInteraction_init(apache::thrift::ContextStack* ctx, ::std::int32_t const& _return);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_SharedInteraction_init(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_SharedInteraction_do_something(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_SharedInteraction_do_something(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static apache::thrift::SerializedResponse return_SharedInteraction_do_something(apache::thrift::ContextStack* ctx, ::thrift::shared_interactions::DoSomethingResult const& _return);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_SharedInteraction_do_something(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void setUpAndProcess_SharedInteraction_tear_down(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedCompressedRequest&& serializedRequest, apache::thrift::Cpp2RequestContext* ctx, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm);
  template <typename ProtocolIn_, typename ProtocolOut_>
  void executeRequest_SharedInteraction_tear_down(apache::thrift::ServerRequest&& serverRequest);
  template <class ProtocolIn_, class ProtocolOut_>
  static apache::thrift::SerializedResponse return_SharedInteraction_tear_down(apache::thrift::ContextStack* ctx);
  template <class ProtocolIn_, class ProtocolOut_>
  static void throw_wrapped_SharedInteraction_tear_down(apache::thrift::ResponseChannelRequest::UniquePtr req,int32_t protoSeqId,apache::thrift::ContextStack* ctx,folly::exception_wrapper ew,apache::thrift::Cpp2RequestContext* reqCtx);
 public:
  InteractWithSharedAsyncProcessor(::apache::thrift::ServiceHandler<::cpp2::InteractWithShared>* iface) :
      iface_(iface) {}
  ~InteractWithSharedAsyncProcessor() override {}
};

} // namespace cpp2
