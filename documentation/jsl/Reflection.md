# JolieDoc for Port Reflection #

## From file `reflection.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Reflection</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ReflectionIface 

--------------------

## Interface ReflectionIface ##

WARNING: the API of this service is experimental. Use it at your own risk.

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">invoke</a></td>
   <td><a rel="nofollow">InvokeRequest</a><br></td>
   <td>undefined<br></td>
   <td>OperationNotFound( <a rel="nofollow">string</a> )&nbsp;&nbsp;<br>InvocationFault( <a rel="nofollow">InvocationFaultType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### invoke ###

    invoke( InvokeRequest )( undefined ) throws
    				OperationNotFound( string )
    				InvocationFault( InvocationFaultType )

Invokes the specified .operation at .outputPort.  
If the operation is a OneWay, the invocation returns no value.

--------------------

## Message type list ##

### InvokeRequest ###

    type InvokeRequest: void { 
        .outputPort: string
        .data?: undefined
        .resourcePath?: string
        .operation: string
    }

### InvocationFaultType ###

    type InvocationFaultType: void { 
        .data: string
        .name: string
    }

--------------------

## Type list ##