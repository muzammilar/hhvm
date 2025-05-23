// Autogenerated by Thrift for thrift/compiler/test/fixtures/stream/src/module.thrift
//
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
//  @generated

package module


import (
    "context"
    "errors"
    "fmt"
    "io"
    "reflect"

    thrift "github.com/facebook/fbthrift/thrift/lib/go/thrift/types"
    metadata "github.com/facebook/fbthrift/thrift/lib/thrift/metadata"
)

// (needed to ensure safety because of naive import list construction)
var _ = context.Background
var _ = errors.New
var _ = fmt.Printf
var _ = io.EOF
var _ = reflect.Ptr
var _ = thrift.VOID
var _ = metadata.GoUnusedProtection__

type PubSubStreamingService interface {
}

type PubSubStreamingServiceClientInterface interface {
    io.Closer
}

type PubSubStreamingServiceClient struct {
    ch thrift.RequestChannel
}
// Compile time interface enforcer
var _ PubSubStreamingServiceClientInterface = (*PubSubStreamingServiceClient)(nil)

func NewPubSubStreamingServiceChannelClient(channel thrift.RequestChannel) *PubSubStreamingServiceClient {
    return &PubSubStreamingServiceClient{
        ch: channel,
    }
}

func NewPubSubStreamingServiceClient(prot thrift.DO_NOT_USE_ChannelWrapper) *PubSubStreamingServiceClient {
    var channel thrift.RequestChannel
    if prot != nil {
        channel = prot.DO_NOT_USE_WrapChannel()
    }
    return NewPubSubStreamingServiceChannelClient(channel)
}

func (c *PubSubStreamingServiceClient) Close() error {
    return c.ch.Close()
}


type PubSubStreamingServiceProcessor struct {
    processorFunctionMap map[string]thrift.ProcessorFunction
    functionServiceMap   map[string]string
    handler              PubSubStreamingService
}

func NewPubSubStreamingServiceProcessor(handler PubSubStreamingService) *PubSubStreamingServiceProcessor {
    p := &PubSubStreamingServiceProcessor{
        handler:              handler,
        processorFunctionMap: make(map[string]thrift.ProcessorFunction),
        functionServiceMap:   make(map[string]string),
    }

    return p
}

func (p *PubSubStreamingServiceProcessor) AddToProcessorFunctionMap(key string, processorFunction thrift.ProcessorFunction) {
    p.processorFunctionMap[key] = processorFunction
}

func (p *PubSubStreamingServiceProcessor) AddToFunctionServiceMap(key, service string) {
    p.functionServiceMap[key] = service
}

func (p *PubSubStreamingServiceProcessor) GetProcessorFunction(key string) (processor thrift.ProcessorFunction) {
    return p.processorFunctionMap[key]
}

func (p *PubSubStreamingServiceProcessor) ProcessorFunctionMap() map[string]thrift.ProcessorFunction {
    return p.processorFunctionMap
}

func (p *PubSubStreamingServiceProcessor) FunctionServiceMap() map[string]string {
    return p.functionServiceMap
}

func (p *PubSubStreamingServiceProcessor) PackageName() string {
    return "module"
}

func (p *PubSubStreamingServiceProcessor) GetThriftMetadata() *metadata.ThriftMetadata {
    return GetThriftMetadataForService("module.PubSubStreamingService")
}


