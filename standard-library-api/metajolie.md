# MetaJolie

## From file `metajolie.iol`

| Port Name | Location | Protocol |
| --- | --- |
| MetaJolie |  |  |

## List of the available interfaces

* [MetaJolieInterface](metajolie.md#MetaJolieInterface)

## Interface MetaJolieInterface {#MetaJolieInterface}

 WARNING: the API of this service is experimental. Use it at your own risk.

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- | --- |
| [checkNativeType](metajolie.md#checkNativeType) | [CheckNativeTypeRequest](metajolie.md#CheckNativeTypeRequest)  | [CheckNativeTypeResponse](metajolie.md#CheckNativeTypeResponse)  |  |
| [getInputPortMetaData](metajolie.md#getInputPortMetaData) | [GetInputPortMetaDataRequest](metajolie.md#GetInputPortMetaDataRequest)  | [GetInputPortMetaDataResponse](metajolie.md#GetInputPortMetaDataResponse)  |  ParserException\( [ParserExceptionType](metajolie.md#ParserExceptionType) \)    InputPortMetaDataFault,   SemanticException\( [SemanticExceptionType](metajolie.md#SemanticExceptionType) \)    |
| [getMetaData](metajolie.md#getMetaData) | [GetMetaDataRequest](metajolie.md#GetMetaDataRequest)  | [GetMetaDataResponse](metajolie.md#GetMetaDataResponse)  |  ParserException\( [ParserExceptionType](metajolie.md#ParserExceptionType) \)    SemanticException\( [SemanticExceptionType](metajolie.md#SemanticExceptionType) \)    |
| [messageTypeCast](metajolie.md#messageTypeCast) | [MessageTypeCastRequest](metajolie.md#MessageTypeCastRequest)  | [MessageTypeCastResponse](metajolie.md#MessageTypeCastResponse)  |  TypeMismatch,   |
| [parseRoles](metajolie.md#parseRoles) | [ParseRoleRequest](metajolie.md#ParseRoleRequest)  | [Role](metajolie.md#Role)  |  |

## Operation list

### getInputPortMetaData {#getInputPortMetaData}

```text
getInputPortMetaData( GetInputPortMetaDataRequest )( GetInputPortMetaDataResponse )
 throws


ParserException( ParserExceptionType )


InputPortMetaDataFault


SemanticException( SemanticExceptionType )
```

### parseRoles {#parseRoles}

```text
parseRoles( ParseRoleRequest )( Role )
```

### getMetaData {#getMetaData}

```text
getMetaData( GetMetaDataRequest )( GetMetaDataResponse )
 throws


ParserException( ParserExceptionType )


SemanticException( SemanticExceptionType )
```

### messageTypeCast {#messageTypeCast}

```text
messageTypeCast( MessageTypeCastRequest )( MessageTypeCastResponse )
 throws


TypeMismatch
```

### checkNativeType {#checkNativeType}

```text
checkNativeType( CheckNativeTypeRequest )( CheckNativeTypeResponse )
```

## Message type list

### GetInputPortMetaDataRequest {#GetInputPortMetaDataRequest}

```text
type GetInputPortMetaDataRequest: void { 
    .filename: string
    .name: Name
}
```

### GetInputPortMetaDataResponse {#GetInputPortMetaDataResponse}

```text
type GetInputPortMetaDataResponse: void { 
    .input*: Participant
}
```

### ParserExceptionType {#ParserExceptionType}

```text
type ParserExceptionType: void { 
    .line: int
    .sourceName: string
    .message: string
}
```

### SemanticExceptionType {#SemanticExceptionType}

```text
type SemanticExceptionType: void { 
    .error*: void { 
        .line: int
        .sourceName: string
        .message: string
    }
}
```

### ParseRoleRequest {#ParseRoleRequest}

```text
type ParseRoleRequest: void { 
    .filename: string
    .rolename: Name
}
```

### Role {#Role}

```text
type Role: void { 
    .output?: Participant
    .input: Participant
    .name: Name
    .conversation*: Conversation
}
```

### GetMetaDataRequest {#GetMetaDataRequest}

```text
type GetMetaDataRequest: void { 
    .filename: string
    .name: Name
}
```

### GetMetaDataResponse {#GetMetaDataResponse}

```text
type GetMetaDataResponse: void { 
    .output*: Participant
    .input*: Participant
    .interfaces*: Interface
    .types*: Type
    .service: Service
    .embeddedServices*: void { 
        .servicepath: string
        .type: string
        .portId: string
    }
}
```

### MessageTypeCastRequest {#MessageTypeCastRequest}

```text
type MessageTypeCastRequest: void { 
    .types: void { 
        .types*: Type
        .messageTypeName: Name
    }
    .message: undefined
}
```

### MessageTypeCastResponse {#MessageTypeCastResponse}

```text
type MessageTypeCastResponse: void { 
    .message: undefined
}
```

### CheckNativeTypeRequest {#CheckNativeTypeRequest}

```text
type CheckNativeTypeRequest: void { 
    .type_name: string
}
```

### CheckNativeTypeResponse {#CheckNativeTypeResponse}

```text
type CheckNativeTypeResponse: void { 
    .result: bool
}
```

## Type list

### Name {#Name}

```text
type Name: void { 
    .registry?: string
    .domain?: string
    .name: string
}
```

### Participant {#Participant}

```text
type Participant: void { 
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}
```

### Interface {#Interface}

```text
type Interface: void { 
    .types*: Type
    .operations*: Operation
    .name: Name
}
```

### Type {#Type}

```text
type Type: void { 
    .root_type: NativeType
    .sub_type*: SubType
    .name: Name
}
```

### NativeType {#NativeType}

```text
type NativeType: void { 
    .string_type?: bool
    .void_type?: bool
    .raw_type?: bool
    .int_type?: bool
    .any_type?: bool
    .link?: void { 
        .domain?: string
        .name: string
    }
    .bool_type?: bool
    .double_type?: bool
    .long_type?: bool
}
```

### SubType {#SubType}

```text
type SubType: void { 
    .type_inline?: Type
    .name: string
    .cardinality: Cardinality
    .type_link?: Name
}
```

### Cardinality {#Cardinality}

```text
type Cardinality: void { 
    .min: int
    .max?: int
    .infinite?: int
}
```

### Operation {#Operation}

```text
type Operation: void { 
    .operation_name: string
    .output?: Name
    .input: Name
    .documentation?: any
    .fault*: Fault
}
```

### Fault {#Fault}

```text
type Fault: void { 
    .type_name?: Name
    .name: Name
}
```

### Conversation {#Conversation}

```text
type Conversation: void { 
    .participant_type: void { 
        .is_input?: int
        .is_output?: int
    }
    .operation: string
}
```

### Service {#Service}

```text
type Service: void { 
    .output*: Name
    .input*: void { 
        .domain: string
        .name: string
    }
    .name: Name
}
```

### undefined {#undefined}

```text
type undefined: undefined
```

