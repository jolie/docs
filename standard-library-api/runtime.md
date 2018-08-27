# Runtime

## From file `runtime.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| Runtime |  |  |

## List of the available interfaces

* [RuntimeInterface](runtime.md#RuntimeInterface)

## Interface RuntimeInterface {#RuntimeInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [callExit](runtime.md#callExit) | any  | void  |  |
| [dumpState](runtime.md#dumpState) | void  | string  |  |
| [getIncludePaths](runtime.md#getIncludePaths) | void  | [GetIncludePathResponse](runtime.md#GetIncludePathResponse)  |  |
| [getLocalLocation](runtime.md#getLocalLocation) | void  | any  |  |
| [getOutputPort](runtime.md#getOutputPort) | [GetOutputPortRequest](runtime.md#GetOutputPortRequest)  | [GetOutputPortResponse](runtime.md#GetOutputPortResponse)  |  OutputPortDoesNotExist,   |
| [getOutputPorts](runtime.md#getOutputPorts) | void  | [GetOutputPortsResponse](runtime.md#GetOutputPortsResponse)  |  |
| [getProcessId](runtime.md#getProcessId) | void  | string  |  |
| [getRedirection](runtime.md#getRedirection) | [GetRedirectionRequest](runtime.md#GetRedirectionRequest)  | any  |  |
| [halt](runtime.md#halt) | [HaltRequest](runtime.md#HaltRequest)  | void  |  |
| [loadEmbeddedService](runtime.md#loadEmbeddedService) | [LoadEmbeddedServiceRequest](runtime.md#LoadEmbeddedServiceRequest)  | any  |  RuntimeException\( [RuntimeExceptionType](runtime.md#RuntimeExceptionType) \)    |
| [loadLibrary](runtime.md#loadLibrary) | string  | void  |  IOException\( [IOExceptionType](runtime.md#IOExceptionType) \)    |
| [removeOutputPort](runtime.md#removeOutputPort) | string  | void  |  |
| [removeRedirection](runtime.md#removeRedirection) | [GetRedirectionRequest](runtime.md#GetRedirectionRequest)  | void  |  RuntimeException\( [RuntimeExceptionType](runtime.md#RuntimeExceptionType) \)    |
| [setMonitor](runtime.md#setMonitor) | [SetMonitorRequest](runtime.md#SetMonitorRequest)  | void  |  |
| [setOutputPort](runtime.md#setOutputPort) | [SetOutputPortRequest](runtime.md#SetOutputPortRequest)  | void  |  |
| [setRedirection](runtime.md#setRedirection) | [SetRedirectionRequest](runtime.md#SetRedirectionRequest)  | void  |  RuntimeException\( [RuntimeExceptionType](runtime.md#RuntimeExceptionType) \)    |
| [stats](runtime.md#stats) | void  | [Stats](runtime.md#Stats)  |  |

## Operation list

### loadLibrary {#loadLibrary}

```text
loadLibrary( string )( void )
 throws


IOException( IOExceptionType )
```

### removeOutputPort {#removeOutputPort}

```text
removeOutputPort( string )( void )
```

### setRedirection {#setRedirection}

```text
setRedirection( SetRedirectionRequest )( void )
 throws


RuntimeException( RuntimeExceptionType )
```

### getOutputPorts {#getOutputPorts}

```text
getOutputPorts( void )( GetOutputPortsResponse )
```

it returns the list of definitions of all the available outputPorts of the service

### loadEmbeddedService {#loadEmbeddedService}

```text
loadEmbeddedService( LoadEmbeddedServiceRequest )( any )
 throws


RuntimeException( RuntimeExceptionType )
```

### getOutputPort {#getOutputPort}

```text
getOutputPort( GetOutputPortRequest )( GetOutputPortResponse )
 throws


OutputPortDoesNotExist
```

it returns a port definition if it exists, OuputPortDoesNotExist fault otherwise

### dumpState {#dumpState}

```text
dumpState( void )( string )
```

### getLocalLocation {#getLocalLocation}

```text
getLocalLocation( void )( any )
```

### getRedirection {#getRedirection}

```text
getRedirection( GetRedirectionRequest )( any )
```

### setOutputPort {#setOutputPort}

```text
setOutputPort( SetOutputPortRequest )( void )
```

### halt {#halt}

```text
halt( HaltRequest )( void )
```

### callExit {#callExit}

```text
callExit( any )( void )
```

### stats {#stats}

```text
stats( void )( Stats )
```

Get information about the runtime state of the Jolie interpreter.

### removeRedirection {#removeRedirection}

```text
removeRedirection( GetRedirectionRequest )( void )
 throws


RuntimeException( RuntimeExceptionType )
```

### setMonitor {#setMonitor}

```text
setMonitor( SetMonitorRequest )( void )
```

### getProcessId {#getProcessId}

```text
getProcessId( void )( string )
```

### getIncludePaths {#getIncludePaths}

```text
getIncludePaths( void )( GetIncludePathResponse )
```

## Message type list

### IOExceptionType {#IOExceptionType}

```text
type IOExceptionType: JavaExceptionType
```

### SetRedirectionRequest {#SetRedirectionRequest}

```text
type SetRedirectionRequest: void { 
    .inputPortName: string
    .outputPortName: string
    .resourceName: string
}
```

### RuntimeExceptionType {#RuntimeExceptionType}

```text
type RuntimeExceptionType: JavaExceptionType
```

### GetOutputPortsResponse {#GetOutputPortsResponse}

```text
type GetOutputPortsResponse: void { 
    .port*: void { 
        .protocol: string
        .name: string
        .location: string
    }
}
```

### LoadEmbeddedServiceRequest {#LoadEmbeddedServiceRequest}

```text
type LoadEmbeddedServiceRequest: void { 
    .filepath: string
    .type: string
}
```

### GetOutputPortRequest {#GetOutputPortRequest}

```text
type GetOutputPortRequest: void { 
    .name: string
}
```

### GetOutputPortResponse {#GetOutputPortResponse}

```text
type GetOutputPortResponse: void { 
    .protocol: string
    .name: string
    .location: string
}
```

### GetRedirectionRequest {#GetRedirectionRequest}

```text
type GetRedirectionRequest: void { 
    .inputPortName: string
    .resourceName: string
}
```

### SetOutputPortRequest {#SetOutputPortRequest}

```text
type SetOutputPortRequest: void { 
    .protocol?: undefined
    .name: string
    .location: any
}
```

### HaltRequest {#HaltRequest}

```text
type HaltRequest: void { 
    .status?: int
}
```

### Stats {#Stats}

```text
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

### SetMonitorRequest {#SetMonitorRequest}

```text
type SetMonitorRequest: void { 
    .protocol?: undefined
    .location: any
}
```

### GetIncludePathResponse {#GetIncludePathResponse}

```text
type GetIncludePathResponse: void { 
    .path*: string
}
```

## Type list

