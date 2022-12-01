# MetaJolie

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| MetaJolie documentation: |  |  |  |
| MetaJolie | - | - | [MetaJolieInterface](metajolie.md#MetaJolieInterface) |

### List of Available Interfaces

### MetaJolieInterface <a id="MetaJolieInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [getInputPortMetaData](metajolie.md#getInputPortMetaData) | [GetInputPortMetaDataRequest](metajolie.md#GetInputPortMetaDataRequest) | [GetInputPortMetaDataResponse](metajolie.md#GetInputPortMetaDataResponse) |  ParserException\( [ParserExceptionType](metajolie.md#ParserExceptionType) \)  InputPortMetaDataFault\( undefined \)  SemanticException\( [SemanticExceptionType](metajolie.md#SemanticExceptionType) \) |
| [getMetaData](metajolie.md#getMetaData) | [GetMetaDataRequest](metajolie.md#GetMetaDataRequest) | [GetMetaDataResponse](metajolie.md#GetMetaDataResponse) |  ParserException\( [ParserExceptionType](metajolie.md#ParserExceptionType) \)  SemanticException\( [SemanticExceptionType](metajolie.md#SemanticExceptionType) \) |
| [messageTypeCast](metajolie.md#messageTypeCast) | [MessageTypeCastRequest](metajolie.md#MessageTypeCastRequest) | [MessageTypeCastResponse](metajolie.md#MessageTypeCastResponse) |  TypeMismatch\( undefined \) |
| [checkNativeType](metajolie.md#checkNativeType) | [CheckNativeTypeRequest](metajolie.md#CheckNativeTypeRequest) | [CheckNativeTypeResponse](metajolie.md#CheckNativeTypeResponse) |  |

## Operation Description

### getInputPortMetaData <a id="getInputPortMetaData"></a>

Operation documentation:

Invocation template:

```jolie
getInputPortMetaData@MetaJolie( request )( response )
```

#### Request type <a id="GetInputPortMetaDataRequest"></a>

Type: GetInputPortMetaDataRequest

```jolie
type GetInputPortMetaDataRequest: void {
    .filename: string
    .name?: Name
}
```

`GetInputPortMetaDataRequest : void`

* `filename : string` : the filename where the service definition is
* `name : void` : the absolute name to give to the resource. in this operation only .domain will be used. default .domain = "".

#### Response type <a id="GetInputPortMetaDataResponse"></a>

Type: GetInputPortMetaDataResponse

```jolie
type GetInputPortMetaDataResponse: void {
    .input*: Port
}
```

`GetInputPortMetaDataResponse : void`

* `input : void` : the full description of each input port of the service definition

#### Possible faults thrown

Fault `ParserException` with type `ParserExceptionType`

Fault-handling install template:

```jolie
install ( ParserException => /* error-handling code */ )
```

```jolie
type ParserExceptionType: void {
    .line: int
    .sourceName: string
    .message: string
}
```

Fault `InputPortMetaDataFault` with type `undefined`

Fault-handling install template:

```jolie
install ( InputPortMetaDataFault => /* error-handling code */ )
```

Fault `SemanticException` with type `SemanticExceptionType`

Fault-handling install template:

```jolie
install ( SemanticException => /* error-handling code */ )
```

```jolie
type SemanticExceptionType: void {
    .error*: void {
        .line: int
        .sourceName: string
        .message: string
    }
}
```

### getMetaData <a id="getMetaData"></a>

Operation documentation:

Invocation template:

```jolie
getMetaData@MetaJolie( request )( response )
```

#### Request type <a id="GetMetaDataRequest"></a>

Type: GetMetaDataRequest

```jolie
type GetMetaDataRequest: void {
    .filename: string
    .name: Name
}
```

`GetMetaDataRequest : void`

* `filename : string` : the filename where the service definition is
* `name : void` : the name and the domain name to give to the service

#### Response type <a id="GetMetaDataResponse"></a>

Type: GetMetaDataResponse

```jolie
type GetMetaDataResponse: void {
    .output*: Port
    .input*: Port
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

`GetMetaDataResponse : void`

* `output : void` : the definitions of all the output ports
* `input : void` : the definitions of all the input ports
* `interfaces : void` : the definitions of all the interfaces
* `types : void` : the definitions of all the types
* `service : void` : the definition of the service
* `embeddedServices : void` : the definitions of all the embedded services
  * `servicepath : string` : path where the service can be found
  * `type : string` : type of the embedded service
  * `portId : string` : target output port where the embedded service is bound

#### Possible faults thrown

Fault `ParserException` with type `ParserExceptionType`

Fault-handling install template:

```jolie
install ( ParserException => /* error-handling code */ )
```

```jolie
type ParserExceptionType: void {
    .line: int
    .sourceName: string
    .message: string
}
```

Fault `SemanticException` with type `SemanticExceptionType`

Fault-handling install template:

```jolie
install ( SemanticException => /* error-handling code */ )
```

```jolie
type SemanticExceptionType: void {
    .error*: void {
        .line: int
        .sourceName: string
        .message: string
    }
}
```

### messageTypeCast <a id="messageTypeCast"></a>

Operation documentation:

Invocation template:

```jolie
messageTypeCast@MetaJolie( request )( response )
```

#### Request type <a id="MessageTypeCastRequest"></a>

Type: MessageTypeCastRequest

```jolie
type MessageTypeCastRequest: void {
    .types: void {
        .types*: Type
        .messageTypeName: Name
    }
    .message: undefined
}
```

`MessageTypeCastRequest : void`

* `types : void` : the types to use for casting the message
  * `types : void` : list of all the required types
  * `messageTypeName : void` : starting type to user for casting
* `message : any` : the message to be cast

#### Response type <a id="MessageTypeCastResponse"></a>

Type: MessageTypeCastResponse

```jolie
type MessageTypeCastResponse: void {
    .message: undefined
}
```

`MessageTypeCastResponse : void`

* `message : any` : casted message

#### Possible faults thrown

Fault `TypeMismatch` with type `undefined`

Fault-handling install template:

```jolie
install ( TypeMismatch => /* error-handling code */ )
```

### checkNativeType <a id="checkNativeType"></a>

Operation documentation:

Invocation template:

```jolie
checkNativeType@MetaJolie( request )( response )
```

#### Request type <a id="CheckNativeTypeRequest"></a>

Type: CheckNativeTypeRequest

```jolie
type CheckNativeTypeRequest: void {
    .type_name: string
}
```

`CheckNativeTypeRequest : void`

* `type_name : string` : the type name to check it is native

#### Response type <a id="CheckNativeTypeResponse"></a>

Type: CheckNativeTypeResponse

```jolie
type CheckNativeTypeResponse: void {
    .result: bool
}
```

`CheckNativeTypeResponse : void`

* `result : bool`

### Subtypes

#### Name <a id="Name"></a>

```jolie
type Name: void { .registry?: string .domain?: string .name: string }
```

#### Port <a id="Port"></a>

```jolie
type Port: void { .protocol: string .interfaces*: Interface .name: Name .location: any }
```

#### Interface <a id="Interface"></a>

```jolie
type Interface: void { .types*: Type .operations*: Operation .name: Name }
```

#### Type <a id="Type"></a>

```jolie
type Type: void { .root_type: NativeType .sub_type*: SubType .name: Name }
```

#### NativeType <a id="NativeType"></a>

```jolie
type NativeType: void { .string_type?: bool .void_type?: bool .raw_type?: bool .int_type?: bool .any_type?: bool .link?: void { .domain?: string .name: string } .bool_type?: bool .double_type?: bool .long_type?: bool }
```

#### SubType <a id="SubType"></a>

```jolie
type SubType: void { .type_inline?: Type .name: string .cardinality: Cardinality .type_link?: Name }
```

#### Cardinality <a id="Cardinality"></a>

```jolie
type Cardinality: void { .min: int .max?: int .infinite?: int }
```

#### Operation <a id="Operation"></a>

```jolie
type Operation: void { .operation_name: string .output?: Name .input: Name .documentation?: any .fault*: Fault }
```

#### Fault <a id="Fault"></a>

```jolie
type Fault: void { .type_name?: Name .name: Name }
```

#### Service <a id="Service"></a>

```jolie
type Service: void { .output*: Name .input*: void { .domain: string .name: string } .name: Name }
```

