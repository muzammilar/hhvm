/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

package test.fixtures.sink;

import com.facebook.swift.codec.*;
import com.facebook.swift.codec.ThriftField.Requiredness;
import com.facebook.swift.codec.ThriftField.Recursiveness;
import java.util.*;
import javax.annotation.Nullable;
import org.apache.thrift.*;
import org.apache.thrift.transport.*;
import org.apache.thrift.protocol.*;
import com.google.common.collect.*;

@SwiftGenerated
@com.facebook.swift.codec.ThriftStruct("SinkException2")
public final class SinkException2 extends org.apache.thrift.TBaseException implements com.facebook.thrift.payload.ThriftSerializable {
    private static final long serialVersionUID = 1L;

    
    public static final Map<String, Integer> NAMES_TO_IDS = new HashMap();
    public static final Map<String, Integer> THRIFT_NAMES_TO_IDS = new HashMap();
    public static final Map<Integer, TField> FIELD_METADATA = new HashMap<>();

    private static final TStruct STRUCT_DESC = new TStruct("SinkException2");
    private final long reason;
    public static final int _REASON = 1;
    private static final TField REASON_FIELD_DESC = new TField("reason", TType.I64, (short)1);

    static {
      NAMES_TO_IDS.put("reason", 1);
      THRIFT_NAMES_TO_IDS.put("reason", 1);
      FIELD_METADATA.put(1, REASON_FIELD_DESC);
    }

    @ThriftConstructor
    public SinkException2(
        @com.facebook.swift.codec.ThriftField(value=1, name="reason", requiredness=Requiredness.NONE) final long reason
    ) {
        this.reason = reason;
    }
    
    @ThriftConstructor
    protected SinkException2() {
      this.reason = 0L;
    }

    public static class Builder {
        private long reason = 0L;
    
        @com.facebook.swift.codec.ThriftField(value=1, name="reason", requiredness=Requiredness.NONE)    public Builder setReason(long reason) {
            this.reason = reason;
            return this;
        }
    
        public long getReason() { return reason; }
    
        public Builder() { }
        public Builder(SinkException2 other) {
            this.reason = other.reason;
        }
    
        @ThriftConstructor
        public SinkException2 build() {
            SinkException2 result = new SinkException2 (
                this.reason
            );
            return result;
        }
    }

    
    
    @com.facebook.swift.codec.ThriftField(value=1, name="reason", requiredness=Requiredness.NONE)
    public long getReason() { return reason; }

    
    public static com.facebook.thrift.payload.Reader<SinkException2> asReader() {
      return SinkException2::read0;
    }
    
    public static SinkException2 read0(TProtocol oprot) throws TException {
      TField __field;
      oprot.readStructBegin(SinkException2.NAMES_TO_IDS, SinkException2.THRIFT_NAMES_TO_IDS, SinkException2.FIELD_METADATA);
      SinkException2.Builder builder = new SinkException2.Builder();
      while (true) {
        __field = oprot.readFieldBegin();
        if (__field.type == TType.STOP) { break; }
        switch (__field.id) {
        case _REASON:
          if (__field.type == TType.I64) {
            long reason = oprot.readI64();
            builder.setReason(reason);
          } else {
            TProtocolUtil.skip(oprot, __field.type);
          }
          break;
        default:
          TProtocolUtil.skip(oprot, __field.type);
          break;
        }
        oprot.readFieldEnd();
      }
      oprot.readStructEnd();
      return builder.build();
    }

    public void write0(TProtocol oprot) throws TException {
      oprot.writeStructBegin(STRUCT_DESC);
      oprot.writeFieldBegin(REASON_FIELD_DESC);
      oprot.writeI64(this.reason);
      oprot.writeFieldEnd();
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

    private static class _SinkException2Lazy {
        private static final SinkException2 _DEFAULT = new SinkException2.Builder().build();
    }
    
    public static SinkException2 defaultInstance() {
        return  _SinkException2Lazy._DEFAULT;
    }}
