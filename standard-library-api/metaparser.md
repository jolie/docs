# MetaParser

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Parser documentation: |  |  |  |
| Parser | - | - | [ParserInterface](metaparser.md#ParserInterface) |

### List of Available Interfaces

### ParserInterface <a id="ParserInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [getSurface](metaparser.md#getSurface) | [Port](metaparser.md#Port) | string |  |
| [getNativeType](metaparser.md#getNativeType) | [NativeType](metaparser.md#NativeType) | string |  |
| [getInterface](metaparser.md#getInterface) | [Interface](metaparser.md#Interface) | string |  |
| [getTypeInLine](metaparser.md#getTypeInLine) | [Type](metaparser.md#Type) | string |  |
| [getSurfaceWithoutOutputPort](metaparser.md#getSurfaceWithoutOutputPort) | [Port](metaparser.md#Port) | string |  |
| [getType](metaparser.md#getType) | [Type](metaparser.md#Type) | string |  |
| [getOutputPort](metaparser.md#getOutputPort) | [Port](metaparser.md#Port) | string |  |
| [getSubType](metaparser.md#getSubType) | [SubType](metaparser.md#SubType) | string |  |
| [getInputPort](metaparser.md#getInputPort) | [Port](metaparser.md#Port) | string |  |
| [getCardinality](metaparser.md#getCardinality) | [Cardinality](metaparser.md#Cardinality) | string |  |

## Operation Description

### getSurface <a id="getSurface"></a>

Operation documentation:

Invocation template:

```text
getSurface@Parser( request )( response )
```

#### Request type <a id="Port"></a>

Type: Port

```text
type Port: void {
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}
```

`Port : void`

* `protocol : string`
* `interfaces : void`
* `name : void`
* `location : any`

#### Response type

Type: string

`string : string`

### getNativeType <a id="getNativeType"></a>

Operation documentation:

Invocation template:

```text
getNativeType@Parser( request )( response )
```

#### Request type <a id="NativeType"></a>

Type: NativeType

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

`NativeType : void`

* `string_type : bool`
* `void_type : bool`
* `raw_type : bool`
* `int_type : bool`
* `any_type : bool`
* `link : void`
  * `domain : string`
  * `name : string`
* `bool_type : bool`
* `double_type : bool`
* `long_type : bool`

#### Response type

Type: string

`string : string`

### getInterface <a id="getInterface"></a>

Operation documentation:

Invocation template:

```text
getInterface@Parser( request )( response )
```

#### Request type <a id="Interface"></a>

Type: Interface

```text
type Interface: void {
    .types*: Type
    .operations*: Operation
    .name: Name
}
```

`Interface : void`

* `types : void`
* `operations : void`
* `name : void`

#### Response type

Type: string

`string : string`

### getTypeInLine <a id="getTypeInLine"></a>

Operation documentation:

Invocation template:

```text
getTypeInLine@Parser( request )( response )
```

#### Request type <a id="Type"></a>

Type: Type

```text
type Type: void {
    .root_type: NativeType
    .sub_type*: SubType
    .name: Name
}
```

`Type : void`

* `root_type : void`
* `sub_type : void`
* `name : void`

#### Response type

Type: string

`string : string`

### getSurfaceWithoutOutputPort <a id="getSurfaceWithoutOutputPort"></a>

Operation documentation:

Invocation template:

```text
getSurfaceWithoutOutputPort@Parser( request )( response )
```

#### Request type <a id="Port"></a>

Type: Port

```text
type Port: void {
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}
```

`Port : void`

* `protocol : string`
* `interfaces : void`
* `name : void`
* `location : any`

#### Response type

Type: string

`string : string`

### getType <a id="getType"></a>

Operation documentation:

Invocation template:

```text
getType@Parser( request )( response )
```

#### Request type <a id="Type"></a>

Type: Type

```text
type Type: void {
    .root_type: NativeType
    .sub_type*: SubType
    .name: Name
}
```

`Type : void`

* `root_type : void`
* `sub_type : void`
* `name : void`

#### Response type

Type: string

`string : string`

### getOutputPort <a id="getOutputPort"></a>

Operation documentation:

Invocation template:

```text
getOutputPort@Parser( request )( response )
```

#### Request type <a id="Port"></a>

Type: Port

```text
type Port: void {
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}
```

`Port : void`

* `protocol : string`
* `interfaces : void`
* `name : void`
* `location : any`

#### Response type

Type: string

`string : string`

### getSubType <a id="getSubType"></a>

Operation documentation:

Invocation template:

```text
getSubType@Parser( request )( response )
```

#### Request type <a id="SubType"></a>

Type: SubType

```text
type SubType: void {
    .type_inline?: Type
    .name: string
    .cardinality: Cardinality
    .type_link?: Name
}
```

`SubType : void`

* `type_inline : void`
* `name : string`
* `cardinality : void`
* `type_link : void`

#### Response type

Type: string

`string : string`

### getInputPort <a id="getInputPort"></a>

Operation documentation:

Invocation template:

```text
getInputPort@Parser( request )( response )
```

#### Request type <a id="Port"></a>

Type: Port

```text
type Port: void {
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}
```

`Port : void`

* `protocol : string`
* `interfaces : void`
* `name : void`
* `location : any`

#### Response type

Type: string

`string : string`

### getCardinality <a id="getCardinality"></a>

Operation documentation:

Invocation template:

```text
getCardinality@Parser( request )( response )
```

#### Request type <a id="Cardinality"></a>

Type: Cardinality

```text
type Cardinality: void {
    .min: int
    .max?: int
    .infinite?: int
}
```

`Cardinality : void`

* `min : int`
* `max : int`
* `infinite : int`

#### Response type

Type: string

`string : string`

### Subtypes

#### Interface <a id="Interface"></a>

```
type Interface: void { .types*: Type .operations*: Operation .name: Name }
```

#### Type <a id="Type"></a>

```
type Type: void { .root_type: NativeType .sub_type*: SubType .name: Name }
```

#### NativeType <a id="NativeType"></a>

```
type NativeType: void { .string_type?: bool .void_type?: bool .raw_type?: bool .int_type?: bool .any_type?: bool .link?: void { .domain?: string .name: string } .bool_type?: bool .double_type?: bool .long_type?: bool }
```

#### SubType <a id="SubType"></a>

```
type SubType: void { .type_inline?: Type .name: string .cardinality: Cardinality .type_link?: Name }
```

#### Cardinality <a id="Cardinality"></a>

```
type Cardinality: void { .min: int .max?: int .infinite?: int }
```

#### Name <a id="Name"></a>

```
type Name: void { .registry?: string .domain?: string .name: string }
```

#### Operation <a id="Operation"></a>

```
type Operation: void { .operation_name: string .output?: Name .input: Name .documentation?: any .fault*: Fault }
```

#### Fault <a id="Fault"></a>

```
type Fault: void { .type_name?: Name .name: Name }
```

