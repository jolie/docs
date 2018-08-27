# Parser

## From file `metaparser.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| Parser |  |  |

## List of the available interfaces

* [ParserInterface](parser.md#ParserInterface)

## Interface ParserInterface {#ParserInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [getCardinality](parser.md#getCardinality) | [Cardinality](parser.md#Cardinality)  | string  |  |
| [getInterface](parser.md#getInterface) | [Interface](parser.md#Interface)  | string  |  |
| [getNativeType](parser.md#getNativeType) | [NativeType](parser.md#NativeType)  | string  |  |
| [getParticipantInput](parser.md#getParticipantInput) | [Participant](parser.md#Participant)  | string  |  |
| [getParticipantOutput](parser.md#getParticipantOutput) | [Participant](parser.md#Participant)  | string  |  |
| [getSubType](parser.md#getSubType) | [SubType](parser.md#SubType)  | string  |  |
| [getSurface](parser.md#getSurface) | [Participant](parser.md#Participant)  | string  |  |
| [getSurfaceWithoutOutputPort](parser.md#getSurfaceWithoutOutputPort) | [Participant](parser.md#Participant)  | string  |  |
| [getType](parser.md#getType) | [Type](parser.md#Type)  | string  |  |
| [getTypeInLine](parser.md#getTypeInLine) | [Type](parser.md#Type)  | string  |  |

## Operation list

### getSurface {#getSurface}

```text
getSurface( Participant )( string )
```

### getNativeType {#getNativeType}

```text
getNativeType( NativeType )( string )
```

### getInterface {#getInterface}

```text
getInterface( Interface )( string )
```

### getTypeInLine {#getTypeInLine}

```text
getTypeInLine( Type )( string )
```

### getSurfaceWithoutOutputPort {#getSurfaceWithoutOutputPort}

```text
getSurfaceWithoutOutputPort( Participant )( string )
```

### getType {#getType}

```text
getType( Type )( string )
```

### getParticipantOutput {#getParticipantOutput}

```text
getParticipantOutput( Participant )( string )
```

### getSubType {#getSubType}

```text
getSubType( SubType )( string )
```

### getParticipantInput {#getParticipantInput}

```text
getParticipantInput( Participant )( string )
```

### getCardinality {#getCardinality}

```text
getCardinality( Cardinality )( string )
```

## Message type list

### Participant {#Participant}

```text
type Participant: void { 
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}
```

## Type list

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

### Name {#Name}

```text
type Name: void { 
    .registry?: string
    .domain?: string
    .name: string
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

