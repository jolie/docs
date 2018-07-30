# Reflection

## From file `reflection.iol`

| Port Name | Location | Protocol |
| --- | --- |
| Reflection |  |  |

## List of the available interfaces

* [ReflectionIface](reflection.md#ReflectionIface)

## Interface ReflectionIface {#ReflectionIface}

 WARNING: the API of this service is experimental. Use it at your own risk.

| Heading | Input type | Output type | Faults |
| --- | --- |
| [invoke](reflection.md#invoke) | [InvokeRequest](reflection.md#InvokeRequest)  | undefined  |  OperationNotFound\( [string](reflection.md#string) \)    InvocationFault\( [InvocationFaultType](reflection.md#InvocationFaultType) \)    |

## Operation list

### invoke {#invoke}

```text
invoke( InvokeRequest )( undefined )
 throws


OperationNotFound( string )


InvocationFault( InvocationFaultType )
```

Invokes the specified .operation at .outputPort.  
 If the operation is a OneWay, the invocation returns no value.

## Message type list

### InvokeRequest {#InvokeRequest}

```text
type InvokeRequest: void { 
    .outputPort: string
    .data?: undefined
    .resourcePath?: string
    .operation: string
}
```

### InvocationFaultType {#InvocationFaultType}

```text
type InvocationFaultType: void { 
    .data: string
    .name: string
}
```

## Type list

