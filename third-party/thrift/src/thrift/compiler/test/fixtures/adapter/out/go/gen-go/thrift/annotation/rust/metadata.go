// Autogenerated by Thrift for thrift/annotation/rust.thrift
//
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
//  @generated

package rust

import (
    "maps"

    thrift "github.com/facebook/fbthrift/thrift/lib/go/thrift/types"
    metadata "github.com/facebook/fbthrift/thrift/lib/thrift/metadata"
)

// (needed to ensure safety because of naive import list construction)
var _ = thrift.VOID
var _ = maps.Copy[map[int]int, map[int]int]
var _ = metadata.GoUnusedProtection__

// Premade Thrift types
var (
    premadeThriftType_string =
        &metadata.ThriftType{
            TPrimitive:
                thrift.Pointerize(metadata.ThriftPrimitiveType_THRIFT_STRING_TYPE),
        }
    premadeThriftType_rust_Name =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Name",
                },
        }
    premadeThriftType_rust_Copy =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Copy",
                },
        }
    premadeThriftType_rust_RequestContext =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.RequestContext",
                },
        }
    premadeThriftType_rust_Arc =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Arc",
                },
        }
    premadeThriftType_rust_Box =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Box",
                },
        }
    premadeThriftType_rust_Exhaustive =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Exhaustive",
                },
        }
    premadeThriftType_rust_Ord =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Ord",
                },
        }
    premadeThriftType_rust_NewType =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.NewType",
                },
        }
    premadeThriftType_rust_Type =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Type",
                },
        }
    premadeThriftType_bool =
        &metadata.ThriftType{
            TPrimitive:
                thrift.Pointerize(metadata.ThriftPrimitiveType_THRIFT_BOOL_TYPE),
        }
    premadeThriftType_rust_Serde =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Serde",
                },
        }
    premadeThriftType_rust_Mod =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Mod",
                },
        }
    premadeThriftType_rust_Adapter =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Adapter",
                },
        }
    premadeThriftType_list_string =
        &metadata.ThriftType{
            TList:
                &metadata.ThriftListType{
                    ValueType: premadeThriftType_string,
                },
        }
    premadeThriftType_rust_Derive =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.Derive",
                },
        }
    premadeThriftType_rust_ServiceExn =
        &metadata.ThriftType{
            TStruct:
                &metadata.ThriftStructType{
                    Name: "rust.ServiceExn",
                },
        }
)

var premadeThriftTypesMap = func() map[string]*metadata.ThriftType {
    fbthriftThriftTypesMap := make(map[string]*metadata.ThriftType)
    fbthriftThriftTypesMap["string"] = premadeThriftType_string
    fbthriftThriftTypesMap["rust.Name"] = premadeThriftType_rust_Name
    fbthriftThriftTypesMap["rust.Copy"] = premadeThriftType_rust_Copy
    fbthriftThriftTypesMap["rust.RequestContext"] = premadeThriftType_rust_RequestContext
    fbthriftThriftTypesMap["rust.Arc"] = premadeThriftType_rust_Arc
    fbthriftThriftTypesMap["rust.Box"] = premadeThriftType_rust_Box
    fbthriftThriftTypesMap["rust.Exhaustive"] = premadeThriftType_rust_Exhaustive
    fbthriftThriftTypesMap["rust.Ord"] = premadeThriftType_rust_Ord
    fbthriftThriftTypesMap["rust.NewType"] = premadeThriftType_rust_NewType
    fbthriftThriftTypesMap["rust.Type"] = premadeThriftType_rust_Type
    fbthriftThriftTypesMap["bool"] = premadeThriftType_bool
    fbthriftThriftTypesMap["rust.Serde"] = premadeThriftType_rust_Serde
    fbthriftThriftTypesMap["rust.Mod"] = premadeThriftType_rust_Mod
    fbthriftThriftTypesMap["rust.Adapter"] = premadeThriftType_rust_Adapter
    fbthriftThriftTypesMap["rust.Derive"] = premadeThriftType_rust_Derive
    fbthriftThriftTypesMap["rust.ServiceExn"] = premadeThriftType_rust_ServiceExn
    return fbthriftThriftTypesMap
}()

var structMetadatas = func() []*metadata.ThriftStruct {
    fbthriftResults := make([]*metadata.ThriftStruct, 0)
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Name",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "name",
                        IsOptional: false,
                        Type:       premadeThriftType_string,
                    },
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Copy",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.RequestContext",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Arc",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Box",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Exhaustive",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Ord",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.NewType",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Type",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "name",
                        IsOptional: false,
                        Type:       premadeThriftType_string,
                    },
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Serde",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "enabled",
                        IsOptional: false,
                        Type:       premadeThriftType_bool,
                    },
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Mod",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "name",
                        IsOptional: false,
                        Type:       premadeThriftType_string,
                    },
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Adapter",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "name",
                        IsOptional: false,
                        Type:       premadeThriftType_string,
                    },
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.Derive",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "derives",
                        IsOptional: false,
                        Type:       premadeThriftType_list_string,
                    },
                },
            },
        )
    }()
    func() {
        fbthriftResults = append(fbthriftResults,
            &metadata.ThriftStruct{
                Name:    "rust.ServiceExn",
                IsUnion: false,
                Fields:  []*metadata.ThriftField{
                    &metadata.ThriftField{
                        Id:         1,
                        Name:       "anyhow_to_application_exn",
                        IsOptional: false,
                        Type:       premadeThriftType_bool,
                    },
                },
            },
        )
    }()
    return fbthriftResults
}()

var exceptionMetadatas = func() []*metadata.ThriftException {
    fbthriftResults := make([]*metadata.ThriftException, 0)
    return fbthriftResults
}()

var enumMetadatas = func() []*metadata.ThriftEnum {
    fbthriftResults := make([]*metadata.ThriftEnum, 0)
    return fbthriftResults
}()

var serviceMetadatas = func() []*metadata.ThriftService {
    fbthriftResults := make([]*metadata.ThriftService, 0)
    return fbthriftResults
}()

// Thrift metadata for this package, as well as all of its recursive imports.
var packageThriftMetadata = func() *metadata.ThriftMetadata {
    allEnumsMap := make(map[string]*metadata.ThriftEnum)
    allStructsMap := make(map[string]*metadata.ThriftStruct)
    allExceptionsMap := make(map[string]*metadata.ThriftException)
    allServicesMap := make(map[string]*metadata.ThriftService)

    // Add enum metadatas from the current program...
    for _, enumMetadata := range enumMetadatas {
        allEnumsMap[enumMetadata.GetName()] = enumMetadata
    }
    // Add struct metadatas from the current program...
    for _, structMetadata := range structMetadatas {
        allStructsMap[structMetadata.GetName()] = structMetadata
    }
    // Add exception metadatas from the current program...
    for _, exceptionMetadata := range exceptionMetadatas {
        allExceptionsMap[exceptionMetadata.GetName()] = exceptionMetadata
    }
    // Add service metadatas from the current program...
    for _, serviceMetadata := range serviceMetadatas {
        allServicesMap[serviceMetadata.GetName()] = serviceMetadata
    }

    // Obtain Thrift metadatas from recursively included programs...
    var recursiveThriftMetadatas []*metadata.ThriftMetadata

    // ...now merge metadatas from recursively included programs.
    for _, thriftMetadata := range recursiveThriftMetadatas {
        maps.Copy(allEnumsMap, thriftMetadata.GetEnums())
        maps.Copy(allStructsMap, thriftMetadata.GetStructs())
        maps.Copy(allExceptionsMap, thriftMetadata.GetExceptions())
        maps.Copy(allServicesMap, thriftMetadata.GetServices())
    }

    return metadata.NewThriftMetadata().
        SetEnums(allEnumsMap).
        SetStructs(allStructsMap).
        SetExceptions(allExceptionsMap).
        SetServices(allServicesMap)
}()

// GetMetadataThriftType (INTERNAL USE ONLY).
// Returns metadata ThriftType for a given full type name.
func GetMetadataThriftType(fullName string) *metadata.ThriftType {
    return premadeThriftTypesMap[fullName]
}

// GetThriftMetadata returns complete Thrift metadata for current and imported packages.
func GetThriftMetadata() *metadata.ThriftMetadata {
    return packageThriftMetadata
}

// GetThriftMetadataForService returns Thrift metadata for the given service.
func GetThriftMetadataForService(scopedServiceName string) *metadata.ThriftMetadata {
    allServicesMap := packageThriftMetadata.GetServices()
    relevantServicesMap := make(map[string]*metadata.ThriftService)

    serviceMetadata := allServicesMap[scopedServiceName]
    // Visit and record all recursive parents of the target service.
    for serviceMetadata != nil {
        relevantServicesMap[serviceMetadata.GetName()] = serviceMetadata
        if serviceMetadata.IsSetParent() {
            serviceMetadata = allServicesMap[serviceMetadata.GetParent()]
        } else {
            serviceMetadata = nil
        }
    }

    return metadata.NewThriftMetadata().
        SetEnums(packageThriftMetadata.GetEnums()).
        SetStructs(packageThriftMetadata.GetStructs()).
        SetExceptions(packageThriftMetadata.GetExceptions()).
        SetServices(relevantServicesMap)
}
