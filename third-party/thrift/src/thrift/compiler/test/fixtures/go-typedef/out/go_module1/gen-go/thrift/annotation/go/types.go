// Autogenerated by Thrift for thrift/annotation/go.thrift
//
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
//  @generated

package go_

import (
    "fmt"
    "reflect"

    thrift "github.com/facebook/fbthrift/thrift/lib/go/thrift/types"
)

// (needed to ensure safety because of naive import list construction)
var _ = fmt.Printf
var _ = reflect.Ptr
var _ = thrift.VOID

type Name struct {
    Name string `thrift:"name,1" json:"name" db:"name"`
}
// Compile time interface enforcer
var _ thrift.Struct = (*Name)(nil)

func NewName() *Name {
    return (&Name{}).setDefaults()
}

func (x *Name) GetName() string {
    return x.Name
}

func (x *Name) SetNameNonCompat(value string) *Name {
    x.Name = value
    return x
}

func (x *Name) SetName(value string) *Name {
    x.Name = value
    return x
}

func (x *Name) writeField1(p thrift.Encoder) error {  // Name
    if err := p.WriteFieldBegin("name", thrift.STRING, 1); err != nil {
        return thrift.PrependError("Name write field begin error: ", err)
    }

    item := x.Name
    if err := p.WriteString(item); err != nil {
        return err
    }

    if err := p.WriteFieldEnd(); err != nil {
        return thrift.PrependError("Name write field end error: ", err)
    }
    return nil
}

func (x *Name) readField1(p thrift.Decoder) error {  // Name
    result, err := p.ReadString()
    if err != nil {
        return err
    }

    x.Name = result
    return nil
}



func (x *Name) Write(p thrift.Encoder) error {
    if err := p.WriteStructBegin("Name"); err != nil {
        return thrift.PrependError("Name write struct begin error: ", err)
    }

    if err := x.writeField1(p); err != nil {
        return err
    }

    if err := p.WriteFieldStop(); err != nil {
        return thrift.PrependError("Name write field stop error: ", err)
    }

    if err := p.WriteStructEnd(); err != nil {
        return thrift.PrependError("Name write struct end error: ", err)
    }
    return nil
}

func (x *Name) Read(p thrift.Decoder) error {
    if _, err := p.ReadStructBegin(); err != nil {
        return thrift.PrependError("Name read error: ", err)
    }

    for {
        fieldName, wireType, id, err := p.ReadFieldBegin()
        if err != nil {
            return thrift.PrependError(fmt.Sprintf("Name field %d ('%s') read error: ", id, fieldName), err)
        }

        if wireType == thrift.STOP {
            break;
        }

        var fieldReadErr error
        switch {
        case ((id == 1 && wireType == thrift.STRING) || (id == thrift.NO_FIELD_ID && fieldName == "name")):  // name
            fieldReadErr = x.readField1(p)
        default:
            fieldReadErr = p.Skip(wireType)
        }

        if fieldReadErr != nil {
            return fieldReadErr
        }

        if err := p.ReadFieldEnd(); err != nil {
            return err
        }
    }

    if err := p.ReadStructEnd(); err != nil {
        return thrift.PrependError("Name read struct end error: ", err)
    }

    return nil
}

func (x *Name) String() string {
    return thrift.StructToString(reflect.ValueOf(x))
}

func (x *Name) setDefaults() *Name {
    return x.
        SetNameNonCompat("")
}

type Tag struct {
    Tag string `thrift:"tag,1" json:"tag" db:"tag"`
}
// Compile time interface enforcer
var _ thrift.Struct = (*Tag)(nil)

func NewTag() *Tag {
    return (&Tag{}).setDefaults()
}

func (x *Tag) GetTag() string {
    return x.Tag
}

func (x *Tag) SetTagNonCompat(value string) *Tag {
    x.Tag = value
    return x
}

func (x *Tag) SetTag(value string) *Tag {
    x.Tag = value
    return x
}

func (x *Tag) writeField1(p thrift.Encoder) error {  // Tag
    if err := p.WriteFieldBegin("tag", thrift.STRING, 1); err != nil {
        return thrift.PrependError("Tag write field begin error: ", err)
    }

    item := x.Tag
    if err := p.WriteString(item); err != nil {
        return err
    }

    if err := p.WriteFieldEnd(); err != nil {
        return thrift.PrependError("Tag write field end error: ", err)
    }
    return nil
}

func (x *Tag) readField1(p thrift.Decoder) error {  // Tag
    result, err := p.ReadString()
    if err != nil {
        return err
    }

    x.Tag = result
    return nil
}



func (x *Tag) Write(p thrift.Encoder) error {
    if err := p.WriteStructBegin("Tag"); err != nil {
        return thrift.PrependError("Tag write struct begin error: ", err)
    }

    if err := x.writeField1(p); err != nil {
        return err
    }

    if err := p.WriteFieldStop(); err != nil {
        return thrift.PrependError("Tag write field stop error: ", err)
    }

    if err := p.WriteStructEnd(); err != nil {
        return thrift.PrependError("Tag write struct end error: ", err)
    }
    return nil
}

func (x *Tag) Read(p thrift.Decoder) error {
    if _, err := p.ReadStructBegin(); err != nil {
        return thrift.PrependError("Tag read error: ", err)
    }

    for {
        fieldName, wireType, id, err := p.ReadFieldBegin()
        if err != nil {
            return thrift.PrependError(fmt.Sprintf("Tag field %d ('%s') read error: ", id, fieldName), err)
        }

        if wireType == thrift.STOP {
            break;
        }

        var fieldReadErr error
        switch {
        case ((id == 1 && wireType == thrift.STRING) || (id == thrift.NO_FIELD_ID && fieldName == "tag")):  // tag
            fieldReadErr = x.readField1(p)
        default:
            fieldReadErr = p.Skip(wireType)
        }

        if fieldReadErr != nil {
            return fieldReadErr
        }

        if err := p.ReadFieldEnd(); err != nil {
            return err
        }
    }

    if err := p.ReadStructEnd(); err != nil {
        return thrift.PrependError("Tag read struct end error: ", err)
    }

    return nil
}

func (x *Tag) String() string {
    return thrift.StructToString(reflect.ValueOf(x))
}

func (x *Tag) setDefaults() *Tag {
    return x.
        SetTagNonCompat("")
}

type MinimizePadding struct {
}
// Compile time interface enforcer
var _ thrift.Struct = (*MinimizePadding)(nil)

func NewMinimizePadding() *MinimizePadding {
    return (&MinimizePadding{}).setDefaults()
}



func (x *MinimizePadding) Write(p thrift.Encoder) error {
    if err := p.WriteStructBegin("MinimizePadding"); err != nil {
        return thrift.PrependError("MinimizePadding write struct begin error: ", err)
    }


    if err := p.WriteFieldStop(); err != nil {
        return thrift.PrependError("MinimizePadding write field stop error: ", err)
    }

    if err := p.WriteStructEnd(); err != nil {
        return thrift.PrependError("MinimizePadding write struct end error: ", err)
    }
    return nil
}

func (x *MinimizePadding) Read(p thrift.Decoder) error {
    if _, err := p.ReadStructBegin(); err != nil {
        return thrift.PrependError("MinimizePadding read error: ", err)
    }

    for {
        fieldName, wireType, id, err := p.ReadFieldBegin()
        if err != nil {
            return thrift.PrependError(fmt.Sprintf("MinimizePadding field %d ('%s') read error: ", id, fieldName), err)
        }

        if wireType == thrift.STOP {
            break;
        }

        var fieldReadErr error
        switch {
        default:
            fieldReadErr = p.Skip(wireType)
        }

        if fieldReadErr != nil {
            return fieldReadErr
        }

        if err := p.ReadFieldEnd(); err != nil {
            return err
        }
    }

    if err := p.ReadStructEnd(); err != nil {
        return thrift.PrependError("MinimizePadding read struct end error: ", err)
    }

    return nil
}

func (x *MinimizePadding) String() string {
    return thrift.StructToString(reflect.ValueOf(x))
}

func (x *MinimizePadding) setDefaults() *MinimizePadding {
    return x
}

type UseReflectCodec struct {
}
// Compile time interface enforcer
var _ thrift.Struct = (*UseReflectCodec)(nil)

func NewUseReflectCodec() *UseReflectCodec {
    return (&UseReflectCodec{}).setDefaults()
}



func (x *UseReflectCodec) Write(p thrift.Encoder) error {
    if err := p.WriteStructBegin("UseReflectCodec"); err != nil {
        return thrift.PrependError("UseReflectCodec write struct begin error: ", err)
    }


    if err := p.WriteFieldStop(); err != nil {
        return thrift.PrependError("UseReflectCodec write field stop error: ", err)
    }

    if err := p.WriteStructEnd(); err != nil {
        return thrift.PrependError("UseReflectCodec write struct end error: ", err)
    }
    return nil
}

func (x *UseReflectCodec) Read(p thrift.Decoder) error {
    if _, err := p.ReadStructBegin(); err != nil {
        return thrift.PrependError("UseReflectCodec read error: ", err)
    }

    for {
        fieldName, wireType, id, err := p.ReadFieldBegin()
        if err != nil {
            return thrift.PrependError(fmt.Sprintf("UseReflectCodec field %d ('%s') read error: ", id, fieldName), err)
        }

        if wireType == thrift.STOP {
            break;
        }

        var fieldReadErr error
        switch {
        default:
            fieldReadErr = p.Skip(wireType)
        }

        if fieldReadErr != nil {
            return fieldReadErr
        }

        if err := p.ReadFieldEnd(); err != nil {
            return err
        }
    }

    if err := p.ReadStructEnd(); err != nil {
        return thrift.PrependError("UseReflectCodec read struct end error: ", err)
    }

    return nil
}

func (x *UseReflectCodec) String() string {
    return thrift.StructToString(reflect.ValueOf(x))
}

func (x *UseReflectCodec) setDefaults() *UseReflectCodec {
    return x
}



// RegisterTypes registers types found in this file that have a thrift_uri with the passed in registry.
func RegisterTypes(registry interface {
  RegisterType(name string, initializer func() any)
}) {
    registry.RegisterType("facebook.com/thrift/annotation/go/Name", func() any { return NewName() })
    registry.RegisterType("facebook.com/thrift/annotation/go/Tag", func() any { return NewTag() })
    registry.RegisterType("facebook.com/thrift/annotation/go/MinimizePadding", func() any { return NewMinimizePadding() })
    registry.RegisterType("facebook.com/thrift/annotation/go/UseReflectCodec", func() any { return NewUseReflectCodec() })

}
