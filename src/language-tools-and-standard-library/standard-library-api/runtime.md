# Runtime

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Runtime documentation: |  |  |  |
| Runtime | - | - | [RuntimeInterface](runtime.md#RuntimeInterface) |

### List of Available Interfaces

### RuntimeInterface <a id="RuntimeInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [getVersion](runtime.md#getVersion) | void | string |  |
| [loadLibrary](runtime.md#loadLibrary) | string | void |  IOException\( [IOExceptionType](runtime.md#IOExceptionType) \) |
| [removeOutputPort](runtime.md#removeOutputPort) | string | void |  |
| [setRedirection](runtime.md#setRedirection) | [SetRedirectionRequest](runtime.md#SetRedirectionRequest) | void |  RuntimeException\( [RuntimeExceptionType](runtime.md#RuntimeExceptionType) \) |
| [getOutputPorts](runtime.md#getOutputPorts) | void | [GetOutputPortsResponse](runtime.md#GetOutputPortsResponse) |  |
| [loadEmbeddedService](runtime.md#loadEmbeddedService) | [LoadEmbeddedServiceRequest](runtime.md#LoadEmbeddedServiceRequest) | any |  RuntimeException\( [RuntimeExceptionType](runtime.md#RuntimeExceptionType) \) |
| [getOutputPort](runtime.md#getOutputPort) | [GetOutputPortRequest](runtime.md#GetOutputPortRequest) | [GetOutputPortResponse](runtime.md#GetOutputPortResponse) |  OutputPortDoesNotExist\( undefined \) |
| [dumpState](runtime.md#dumpState) | void | string |  |
| [getLocalLocation](runtime.md#getLocalLocation) | void | any |  |
| [getRedirection](runtime.md#getRedirection) | [GetRedirectionRequest](runtime.md#GetRedirectionRequest) | [MaybeString](runtime.md#MaybeString) |  |
| [setOutputPort](runtime.md#setOutputPort) | [SetOutputPortRequest](runtime.md#SetOutputPortRequest) | void |  |
| [halt](runtime.md#halt) | [HaltRequest](runtime.md#HaltRequest) | void |  |
| [callExit](runtime.md#callExit) | any | void |  |
| [stats](runtime.md#stats) | void | [Stats](runtime.md#Stats) |  |
| [removeRedirection](runtime.md#removeRedirection) | [GetRedirectionRequest](runtime.md#GetRedirectionRequest) | void |  RuntimeException\( [RuntimeExceptionType](runtime.md#RuntimeExceptionType) \) |
| [setMonitor](runtime.md#setMonitor) | [SetMonitorRequest](runtime.md#SetMonitorRequest) | void |  |
| [getProcessId](runtime.md#getProcessId) | void | string |  |
| [getIncludePaths](runtime.md#getIncludePaths) | void | [GetIncludePathResponse](runtime.md#GetIncludePathResponse) |  |
| [getenv](runtime.md#getenv) | string | [MaybeString](runtime.md#MaybeString) |  |

## Operation Description

### getVersion <a id="getVersion"></a>

Operation documentation: Returns the version of the Jolie interpreter running this service.

Invocation template:

```jolie
getVersion@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: string

`string : string`

### loadLibrary <a id="loadLibrary"></a>

Operation documentation: Dynamically loads an external \(jar\) library.

Invocation template:

```jolie
loadLibrary@Runtime( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### removeOutputPort <a id="removeOutputPort"></a>

Operation documentation: Removes the output port with the requested name.

Invocation template:

```jolie
removeOutputPort@Runtime( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: void

`void : void`

### setRedirection <a id="setRedirection"></a>

Operation documentation: Set a redirection at an input port. If the redirection with this name does not exist already, this operation creates it. Otherwise, the redirection is replaced with this one.

Invocation template:

```jolie
setRedirection@Runtime( request )( response )
```

#### Request type <a id="SetRedirectionRequest"></a>

Type: SetRedirectionRequest

```jolie
type SetRedirectionRequest: void {
    .inputPortName: string
    .outputPortName: string
    .resourceName: string
}
```

`SetRedirectionRequest : void`

* `inputPortName : string` : The target input port
* `outputPortName : string` : The target output port
* `resourceName : string` : The target resource name

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `RuntimeException` with type `RuntimeExceptionType`

Fault-handling install template:

```jolie
install ( RuntimeException => /* error-handling code */ )
```

```jolie
type RuntimeExceptionType: JavaExceptionType
```

### getOutputPorts <a id="getOutputPorts"></a>

Operation documentation: Returns all the output ports used by this service.

Invocation template:

```jolie
getOutputPorts@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type <a id="GetOutputPortsResponse"></a>

Type: GetOutputPortsResponse

```jolie
type GetOutputPortsResponse: void {
    .port*: void {
        .protocol: string
        .name: string
        .location: string
    }
}
```

`GetOutputPortsResponse : void`

* `port : void` : The output ports used by this interpreter
  * `protocol : string` : The protocol name of the output port
  * `name : string` : The name of the output port
  * `location : string` : The location of the output port

### loadEmbeddedService <a id="loadEmbeddedService"></a>

Operation documentation: Load an embedded service.

Invocation template:

```jolie
loadEmbeddedService@Runtime( request )( response )
```

#### Request type <a id="LoadEmbeddedServiceRequest"></a>

Type: LoadEmbeddedServiceRequest

```jolie
type LoadEmbeddedServiceRequest: void {
    .filepath: string
    .type: string
}
```

`LoadEmbeddedServiceRequest : void`

* `filepath : string` : The path to the service to load
* `type : string` : The type of the service, e.g., Jolie, Java, or JavaScript

#### Response type

Type: any

`any : any`

#### Possible faults thrown

Fault `RuntimeException` with type `RuntimeExceptionType`

Fault-handling install template:

```jolie
install ( RuntimeException => /* error-handling code */ )
```

```jolie
type RuntimeExceptionType: JavaExceptionType
```

### getOutputPort <a id="getOutputPort"></a>

Operation documentation: Returns the definition of output port definition. @throws OutputPortDoesNotExist if the requested output port does not exist.

Invocation template:

```jolie
getOutputPort@Runtime( request )( response )
```

#### Request type <a id="GetOutputPortRequest"></a>

Type: GetOutputPortRequest

```jolie
type GetOutputPortRequest: void {
    .name: string
}
```

`GetOutputPortRequest : void`

* `name : string` : The name of the output port

#### Response type <a id="GetOutputPortResponse"></a>

Type: GetOutputPortResponse

```jolie
type GetOutputPortResponse: void {
    .protocol: string
    .name: string
    .location: string
}
```

`GetOutputPortResponse : void`

* `protocol : string` : The protocol name of the output port
* `name : string` : The name of the output port
* `location : string` : The location of the output port

#### Possible faults thrown

Fault `OutputPortDoesNotExist` with type `undefined`

Fault-handling install template:

```jolie
install ( OutputPortDoesNotExist => /* error-handling code */ )
```

### dumpState <a id="dumpState"></a>

Operation documentation: Returns a pretty-printed string representation of the local state of the invoking Jolie process and the global state of this service.

Invocation template:

```jolie
dumpState@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: string

`string : string`

### getLocalLocation <a id="getLocalLocation"></a>

Operation documentation: Get the local in-memory location of this service.

Invocation template:

```jolie
getLocalLocation@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: any

`any : any`

### getRedirection <a id="getRedirection"></a>

Operation documentation: Get the output port name that a redirection points to.

Invocation template:

```jolie
getRedirection@Runtime( request )( response )
```

#### Request type <a id="GetRedirectionRequest"></a>

Type: GetRedirectionRequest

```jolie
type GetRedirectionRequest: void {
    .inputPortName: string
    .resourceName: string
}
```

`GetRedirectionRequest : void`

* `inputPortName : string` : The target input port
* `resourceName : string` : The resource name of the redirection to get

#### Response type <a id="MaybeString"></a>

Type: MaybeString

```jolie
type MaybeString: void | string
```

`MaybeString :`

*  `: void`
*  `: string`

### setOutputPort <a id="setOutputPort"></a>

Operation documentation: Set an output port. If an output port with this name does not exist already, this operation creates it. Otherwise, the output port is replaced with this one.

Invocation template:

```jolie
setOutputPort@Runtime( request )( response )
```

#### Request type <a id="SetOutputPortRequest"></a>

Type: SetOutputPortRequest

```jolie
type SetOutputPortRequest: void {
    .protocol?: undefined
    .name: string
    .location: any
}
```

`SetOutputPortRequest : void`

* `protocol : string` : The name of the protocol \(e.g., sodep, http\)
* `name : string` : The name of the output port
* `location : any` : The location of the output port

#### Response type

Type: void

`void : void`

### halt <a id="halt"></a>

Operation documentation: Halts non-gracefully the execution of this service.

Invocation template:

```jolie
halt@Runtime( request )( response )
```

#### Request type <a id="HaltRequest"></a>

Type: HaltRequest

```jolie
type HaltRequest: void {
    .status?: int
}
```

`HaltRequest : void`

* `status : int` : The status code to return to the execution environment

#### Response type

Type: void

`void : void`

### callExit <a id="callExit"></a>

Operation documentation: Stops gracefully the execution of this service. Calling this operation is equivalent to invoking the exit statement.

Invocation template:

```jolie
callExit@Runtime( request )( response )
```

#### Request type

Type: any

`any : any`

#### Response type

Type: void

`void : void`

### stats <a id="stats"></a>

Operation documentation: Returns information on the runtime state of the VM.

Invocation template:

```jolie
stats@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type <a id="Stats"></a>

Type: Stats

```jolie
type Stats: void {
    .os: void {
        .availableProcessors: int
        .systemLoadAverage: double
        .name: string
        .arch: string
        .version: string
    }
    .files: void {
        .openCount?: long
        .maxCount?: long
    }
}
```

`Stats : void` : Information on the interpreter execution so far

* `os : void` : OS-related information
  * `availableProcessors : int` : Number of available processors
  * `systemLoadAverage : double` : System load average
  * `name : string` : Name of the OS
  * `arch : string` : Architecture
  * `version : string` : OS version
* `files : void` : Information on file descriptors
  * `openCount : long` : Number of open files
  * `maxCount : long` : Maximum number of open files allowed for this VM

### removeRedirection <a id="removeRedirection"></a>

Operation documentation: Remove a redirection at an input port

Invocation template:

```jolie
removeRedirection@Runtime( request )( response )
```

#### Request type <a id="GetRedirectionRequest"></a>

Type: GetRedirectionRequest

```jolie
type GetRedirectionRequest: void {
    .inputPortName: string
    .resourceName: string
}
```

`GetRedirectionRequest : void`

* `inputPortName : string` : The target input port
* `resourceName : string` : The resource name of the redirection to get

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `RuntimeException` with type `RuntimeExceptionType`

Fault-handling install template:

```jolie
install ( RuntimeException => /* error-handling code */ )
```

```jolie
type RuntimeExceptionType: JavaExceptionType
```

### setMonitor <a id="setMonitor"></a>

Operation documentation: Set the monitor for this service.

Invocation template:

```jolie
setMonitor@Runtime( request )( response )
```

#### Request type <a id="SetMonitorRequest"></a>

Type: SetMonitorRequest

```jolie
type SetMonitorRequest: void {
    .protocol?: undefined
    .location: any
}
```

`SetMonitorRequest : void`

* `protocol : string` : The protocol configuration for the monitor
* `location : any` : The location of the monitor

#### Response type

Type: void

`void : void`

### getProcessId <a id="getProcessId"></a>

Operation documentation: Returns the internal identifier of the executing Jolie process.

Invocation template:

```jolie
getProcessId@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: string

`string : string`

### getIncludePaths <a id="getIncludePaths"></a>

Operation documentation: Get the include paths used by this interpreter

Invocation template:

```jolie
getIncludePaths@Runtime( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type <a id="GetIncludePathResponse"></a>

Type: GetIncludePathResponse

```jolie
type GetIncludePathResponse: void {
    .path*: string
}
```

`GetIncludePathResponse : void`

* `path : string` : The include paths of the interpreter

### getenv <a id="getenv"></a>

Operation documentation: Returns the value of an environment variable.

Invocation template:

```jolie
getenv@Runtime( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type <a id="MaybeString"></a>

Type: MaybeString

```jolie
type MaybeString: void | string
```

`MaybeString :`

*  `: void`
*  `: string`

### Subtypes

#### JavaExceptionType <a id="JavaExceptionType"></a>

```jolie
type JavaExceptionType: string { .stackTrace: string }
```

