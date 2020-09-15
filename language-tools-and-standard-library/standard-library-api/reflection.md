# Reflection

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Reflection documentation: |  |  |  |
| Reflection | - | - | [ReflectionIface](reflection.md#ReflectionIface) |

### List of Available Interfaces

### ReflectionIface <a id="ReflectionIface"></a>

Interface documentation: WARNING: the API of this service is experimental. Use it at your own risk.

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [invoke](reflection.md#invoke) | [InvokeRequest](reflection.md#InvokeRequest) | undefined |  OperationNotFound\( string \)  InvocationFault\( [InvocationFaultType](reflection.md#InvocationFaultType) \) |

## Operation Description

### invoke <a id="invoke"></a>

Operation documentation: Invokes the specified .operation at .outputPort. If the operation is a OneWay, the invocation returns no value.

Invocation template:

```jolie
invoke@Reflection( request )( response )
```

#### Request type <a id="InvokeRequest"></a>

Type: InvokeRequest

```jolie
type InvokeRequest: void {
    .outputPort: string
    .data?: undefined
    .resourcePath?: string
    .operation: string
}
```

`InvokeRequest : void`

* `outputPort : string`
* `data : any`
* `resourcePath : string`
* `operation : string`

#### Response type

Type: undefined

`undefined : any`

#### Possible faults thrown

Fault `OperationNotFound` with type `string`

Fault-handling install template:

```jolie
install ( OperationNotFound => /* error-handling code */ )
```

Fault `InvocationFault` with type `InvocationFaultType`

Fault-handling install template:

```jolie
install ( InvocationFault => /* error-handling code */ )
```

```jolie
type InvocationFaultType: void {
    .data: string
    .name: string
}
```

