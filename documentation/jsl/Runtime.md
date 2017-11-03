# JolieDoc for Port Runtime #

## From file `runtime.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Runtime</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  RuntimeInterface 

--------------------

## Interface RuntimeInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">callExit</a></td>
   <td>any<br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">dumpState</a></td>
   <td>void<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getIncludePaths</a></td>
   <td>void<br></td>
   <td><a rel="nofollow">GetIncludePathResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getLocalLocation</a></td>
   <td>void<br></td>
   <td>any<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getOutputPort</a></td>
   <td><a rel="nofollow">GetOutputPortRequest</a><br></td>
   <td><a rel="nofollow">GetOutputPortResponse</a><br></td>
   <td>OutputPortDoesNotExist,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getOutputPorts</a></td>
   <td>void<br></td>
   <td><a rel="nofollow">GetOutputPortsResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getProcessId</a></td>
   <td>void<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getRedirection</a></td>
   <td><a rel="nofollow">GetRedirectionRequest</a><br></td>
   <td>any<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">halt</a></td>
   <td><a rel="nofollow">HaltRequest</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">loadEmbeddedService</a></td>
   <td><a rel="nofollow">LoadEmbeddedServiceRequest</a><br></td>
   <td>any<br></td>
   <td>RuntimeException( <a rel="nofollow">RuntimeExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">loadLibrary</a></td>
   <td>string<br></td>
   <td>void<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">removeOutputPort</a></td>
   <td>string<br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">removeRedirection</a></td>
   <td><a rel="nofollow">GetRedirectionRequest</a><br></td>
   <td>void<br></td>
   <td>RuntimeException( <a rel="nofollow">RuntimeExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setMonitor</a></td>
   <td><a rel="nofollow">SetMonitorRequest</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setOutputPort</a></td>
   <td><a rel="nofollow">SetOutputPortRequest</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setRedirection</a></td>
   <td><a rel="nofollow">SetRedirectionRequest</a><br></td>
   <td>void<br></td>
   <td>RuntimeException( <a rel="nofollow">RuntimeExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">stats</a></td>
   <td>void<br></td>
   <td><a rel="nofollow">Stats</a><br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### loadLibrary ###

    loadLibrary( string )( void ) throws
    				IOException( IOExceptionType )

### removeOutputPort ###

    removeOutputPort( string )( void )

### setRedirection ###

    setRedirection( SetRedirectionRequest )( void ) throws
    				RuntimeException( RuntimeExceptionType )

### getOutputPorts ###

    getOutputPorts( void )( GetOutputPortsResponse )

it returns the list of definitions of all the available outputPorts of the service

### loadEmbeddedService ###

    loadEmbeddedService( LoadEmbeddedServiceRequest )( any ) throws
    				RuntimeException( RuntimeExceptionType )

### getOutputPort ###

    getOutputPort( GetOutputPortRequest )( GetOutputPortResponse ) throws
    				OutputPortDoesNotExist

it returns a port definition if it exists, OuputPortDoesNotExist fault otherwise

### dumpState ###

    dumpState( void )( string )

### getLocalLocation ###

    getLocalLocation( void )( any )

### getRedirection ###

    getRedirection( GetRedirectionRequest )( any )

### setOutputPort ###

    setOutputPort( SetOutputPortRequest )( void )

### halt ###

    halt( HaltRequest )( void )

### callExit ###

    callExit( any )( void )

### stats ###

    stats( void )( Stats )

Get information about the runtime state of the Jolie interpreter.

### removeRedirection ###

    removeRedirection( GetRedirectionRequest )( void ) throws
    				RuntimeException( RuntimeExceptionType )

### setMonitor ###

    setMonitor( SetMonitorRequest )( void )

### getProcessId ###

    getProcessId( void )( string )

### getIncludePaths ###

    getIncludePaths( void )( GetIncludePathResponse )

--------------------

## Message type list ##

### IOExceptionType ###

    type IOExceptionType: JavaExceptionType SetRedirectionRequest type SetRedirectionRequest: void { 
        .inputPortName: string
        .outputPortName: string
        .resourceName: string
    } RuntimeExceptionType type RuntimeExceptionType: JavaExceptionType GetOutputPortsResponse type GetOutputPortsResponse: void { 
        .port*: void { 
            .protocol: string
            .name: string
            .location: string
        }
    } LoadEmbeddedServiceRequest type LoadEmbeddedServiceRequest: void { 
        .filepath: string
        .type: string
    } GetOutputPortRequest type GetOutputPortRequest: void { 
        .name: string
    } GetOutputPortResponse type GetOutputPortResponse: void { 
        .protocol: string
        .name: string
        .location: string
    } GetRedirectionRequest type GetRedirectionRequest: void { 
        .inputPortName: string
        .resourceName: string
    } SetOutputPortRequest type SetOutputPortRequest: void { 
        .protocol?: undefined
        .name: string
        .location: any
    } HaltRequest type HaltRequest: void { 
        .status?: int
    } Stats type Stats: void { 
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
    } SetMonitorRequest type SetMonitorRequest: void { 
        .protocol?: undefined
        .location: any
    } GetIncludePathResponse type GetIncludePathResponse: void { 
        .path*: string
    } Type list