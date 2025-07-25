/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

package test.fixtures.req_opt;

import com.facebook.swift.codec.*;
import com.facebook.swift.codec.ThriftField.Requiredness;
import com.facebook.swift.codec.ThriftField.Recursiveness;
import com.google.common.collect.*;
import java.util.*;
import javax.annotation.Nullable;
import org.apache.thrift.*;
import org.apache.thrift.TException;
import org.apache.thrift.transport.*;
import org.apache.thrift.protocol.*;
import org.apache.thrift.protocol.TProtocol;
import static com.google.common.base.MoreObjects.toStringHelper;
import static com.google.common.base.MoreObjects.ToStringHelper;

@SwiftGenerated
@com.facebook.swift.codec.ThriftStruct(value="Foo", builder=Foo.Builder.class)
public final class Foo implements com.facebook.thrift.payload.ThriftSerializable {
    @ThriftConstructor
    public Foo(
        @com.facebook.swift.codec.ThriftField(value=1, name="myInteger", requiredness=Requiredness.REQUIRED) final int myInteger,
        @com.facebook.swift.codec.ThriftField(value=2, name="myString", requiredness=Requiredness.OPTIONAL) final String myString,
        @com.facebook.swift.codec.ThriftField(value=3, name="myBools", requiredness=Requiredness.NONE) final List<Boolean> myBools,
        @com.facebook.swift.codec.ThriftField(value=4, name="myNumbers", requiredness=Requiredness.REQUIRED) final List<Integer> myNumbers
    ) {
        this.myInteger = myInteger;
        this.myString = myString;
        this.myBools = myBools;
        this.myNumbers = myNumbers;
    }
    
    @ThriftConstructor
    protected Foo() {
      this.myInteger = 0;
      this.myString = null;
      this.myBools = null;
      this.myNumbers = null;
    }

    public static Builder builder() {
      return new Builder();
    }

    public static Builder builder(Foo other) {
      return new Builder(other);
    }

    public static class Builder {
        private int myInteger = 0;
        private String myString = null;
        private List<Boolean> myBools = null;
        private List<Integer> myNumbers = null;
    
        @com.facebook.swift.codec.ThriftField(value=1, name="myInteger", requiredness=Requiredness.REQUIRED)    public Builder setMyInteger(int myInteger) {
            this.myInteger = myInteger;
            return this;
        }
    
        public int getMyInteger() { return myInteger; }
    
            @com.facebook.swift.codec.ThriftField(value=2, name="myString", requiredness=Requiredness.OPTIONAL)    public Builder setMyString(String myString) {
            this.myString = myString;
            return this;
        }
    
        public String getMyString() { return myString; }
    
            @com.facebook.swift.codec.ThriftField(value=3, name="myBools", requiredness=Requiredness.NONE)    public Builder setMyBools(List<Boolean> myBools) {
            this.myBools = myBools;
            return this;
        }
    
        public List<Boolean> getMyBools() { return myBools; }
    
            @com.facebook.swift.codec.ThriftField(value=4, name="myNumbers", requiredness=Requiredness.REQUIRED)    public Builder setMyNumbers(List<Integer> myNumbers) {
            this.myNumbers = myNumbers;
            return this;
        }
    
        public List<Integer> getMyNumbers() { return myNumbers; }
    
        public Builder() { }
        public Builder(Foo other) {
            this.myInteger = other.myInteger;
            this.myString = other.myString;
            this.myBools = other.myBools;
            this.myNumbers = other.myNumbers;
        }
    
        @ThriftConstructor
        public Foo build() {
            Foo result = new Foo (
                this.myInteger,
                this.myString,
                this.myBools,
                this.myNumbers
            );
            return result;
        }
    }
    
    public static final Map<String, Integer> NAMES_TO_IDS = new HashMap<>();
    public static final Map<String, Integer> THRIFT_NAMES_TO_IDS = new HashMap<>();
    public static final Map<Integer, TField> FIELD_METADATA = new HashMap<>();
    private static final TStruct STRUCT_DESC = new TStruct("Foo");
    private final int myInteger;
    public static final int _MYINTEGER = 1;
    private static final TField MY_INTEGER_FIELD_DESC = new TField("myInteger", TType.I32, (short)1);
        private final String myString;
    public static final int _MYSTRING = 2;
    private static final TField MY_STRING_FIELD_DESC = new TField("myString", TType.STRING, (short)2);
        private final List<Boolean> myBools;
    public static final int _MYBOOLS = 3;
    private static final TField MY_BOOLS_FIELD_DESC = new TField("myBools", TType.LIST, (short)3);
        private final List<Integer> myNumbers;
    public static final int _MYNUMBERS = 4;
    private static final TField MY_NUMBERS_FIELD_DESC = new TField("myNumbers", TType.LIST, (short)4);
    static {
      NAMES_TO_IDS.put("myInteger", 1);
      THRIFT_NAMES_TO_IDS.put("myInteger", 1);
      FIELD_METADATA.put(1, MY_INTEGER_FIELD_DESC);
      NAMES_TO_IDS.put("myString", 2);
      THRIFT_NAMES_TO_IDS.put("myString", 2);
      FIELD_METADATA.put(2, MY_STRING_FIELD_DESC);
      NAMES_TO_IDS.put("myBools", 3);
      THRIFT_NAMES_TO_IDS.put("myBools", 3);
      FIELD_METADATA.put(3, MY_BOOLS_FIELD_DESC);
      NAMES_TO_IDS.put("myNumbers", 4);
      THRIFT_NAMES_TO_IDS.put("myNumbers", 4);
      FIELD_METADATA.put(4, MY_NUMBERS_FIELD_DESC);
    }
    
    
    @com.facebook.swift.codec.ThriftField(value=1, name="myInteger", requiredness=Requiredness.REQUIRED)
    public int getMyInteger() { return myInteger; }

    
    @Nullable
    @com.facebook.swift.codec.ThriftField(value=2, name="myString", requiredness=Requiredness.OPTIONAL)
    public String getMyString() { return myString; }

    
    @Nullable
    @com.facebook.swift.codec.ThriftField(value=3, name="myBools", requiredness=Requiredness.NONE)
    public List<Boolean> getMyBools() { return myBools; }

    
    
    @com.facebook.swift.codec.ThriftField(value=4, name="myNumbers", requiredness=Requiredness.REQUIRED)
    public List<Integer> getMyNumbers() { return myNumbers; }

    @java.lang.Override
    public String toString() {
        ToStringHelper helper = toStringHelper(this);
        helper.add("myInteger", myInteger);
        helper.add("myString", myString);
        helper.add("myBools", myBools);
        helper.add("myNumbers", myNumbers);
        return helper.toString();
    }

    @java.lang.Override
    public boolean equals(java.lang.Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
    
        Foo other = (Foo)o;
    
        return
            Objects.equals(myInteger, other.myInteger) &&
            Objects.equals(myString, other.myString) &&
            Objects.equals(myBools, other.myBools) &&
            Objects.equals(myNumbers, other.myNumbers) &&
            true;
    }

    @java.lang.Override
    public int hashCode() {
        return Arrays.deepHashCode(new java.lang.Object[] {
            myInteger,
            myString,
            myBools,
            myNumbers
        });
    }

    
    public static com.facebook.thrift.payload.Reader<Foo> asReader() {
      return Foo::read0;
    }
    
    public static Foo read0(TProtocol oprot) throws TException {
      TField __field;
      oprot.readStructBegin(Foo.NAMES_TO_IDS, Foo.THRIFT_NAMES_TO_IDS, Foo.FIELD_METADATA);
      Foo.Builder builder = new Foo.Builder();
      while (true) {
        __field = oprot.readFieldBegin();
        if (__field.type == TType.STOP) { break; }
        switch (__field.id) {
        case _MYINTEGER:
          if (__field.type == TType.I32) {
            int myInteger = oprot.readI32();
            builder.setMyInteger(myInteger);
          } else {
            TProtocolUtil.skip(oprot, __field.type);
          }
          break;
        case _MYSTRING:
          if (__field.type == TType.STRING) {
            String  myString = oprot.readString();
            builder.setMyString(myString);
          } else {
            TProtocolUtil.skip(oprot, __field.type);
          }
          break;
        case _MYBOOLS:
          if (__field.type == TType.LIST) {
            List<Boolean> myBools;
                {
                TList _list = oprot.readListBegin();
                myBools = new ArrayList<Boolean>(Math.max(0, _list.size));
                for (int _i = 0; (_list.size < 0) ? oprot.peekList() : (_i < _list.size); _i++) {
                    
                    boolean _value1 = oprot.readBool();
                    myBools.add(_value1);
                }
                oprot.readListEnd();
                }
            builder.setMyBools(myBools);
          } else {
            TProtocolUtil.skip(oprot, __field.type);
          }
          break;
        case _MYNUMBERS:
          if (__field.type == TType.LIST) {
            List<Integer> myNumbers;
                {
                TList _list = oprot.readListBegin();
                myNumbers = new ArrayList<Integer>(Math.max(0, _list.size));
                for (int _i = 0; (_list.size < 0) ? oprot.peekList() : (_i < _list.size); _i++) {
                    
                    int _value1 = oprot.readI32();
                    myNumbers.add(_value1);
                }
                oprot.readListEnd();
                }
            builder.setMyNumbers(myNumbers);
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
      oprot.writeFieldBegin(MY_INTEGER_FIELD_DESC);
      oprot.writeI32(this.myInteger);
      oprot.writeFieldEnd();
      if (myString != null) {
        oprot.writeFieldBegin(MY_STRING_FIELD_DESC);
        oprot.writeString(this.myString);
        oprot.writeFieldEnd();
      }
      if (myBools != null) {
        oprot.writeFieldBegin(MY_BOOLS_FIELD_DESC);
        List<Boolean> _iter0 = myBools;
        oprot.writeListBegin(new TList(TType.BOOL, _iter0.size()));
            for (boolean _iter1 : _iter0) {
              oprot.writeBool(_iter1);
            }
            oprot.writeListEnd();
        oprot.writeFieldEnd();
      }
      if (myNumbers != null) {
        oprot.writeFieldBegin(MY_NUMBERS_FIELD_DESC);
        List<Integer> _iter0 = myNumbers;
        oprot.writeListBegin(new TList(TType.I32, _iter0.size()));
            for (int _iter1 : _iter0) {
              oprot.writeI32(_iter1);
            }
            oprot.writeListEnd();
        oprot.writeFieldEnd();
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

    private static class _FooLazy {
        private static final Foo _DEFAULT = new Foo.Builder().build();
    }
    
    public static Foo defaultInstance() {
        return  _FooLazy._DEFAULT;
    }
}
