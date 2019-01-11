# Include library: reflection.iol

Inclusion code: <pre>include "reflection.iol"</pre>

<table>
  <caption>Service Deployment</caption>
  <thead>
    <tr>
      <th>Port Name</th>
      <th>Location</th>
      <th>Protocol</th>
      <th>Interfaces</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Reflection</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#ReflectionIface">ReflectionIface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="ReflectionIface">ReflectionIface</h3>

Interface documentation: 
WARNING: the API of this service is experimental. Use it at your own risk.


<table>
  <thead>
    <tr>
      <th>Operation Name</th>
      <th>Input Type</th>
      <th>Output Type</th>
      <th>Faults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#invoke">invoke</a></td>
      <td><a href="#InvokeRequest">InvokeRequest</a></td>
      <td>undefined</td>
      <td>
        OperationNotFound( string ) <br> 
        InvocationFault( <a href="#InvocationFaultType">InvocationFaultType</a> )
      </td>
    </tr>
  </tbody>
</table>

### Operation Description



<h4 id="invoke">invoke</h4>
Operation documentation: 
	Invokes the specified .operation at .outputPort.
	If the operation is a OneWay, the invocation returns no value.
	


Invocation template: <pre>invoke@Reflection( request )( response )</pre>

<h4 id="InvokeRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type InvokeRequest: void {
	.outputPort: string
	.data?: undefined
	.resourcePath?: string
	.operation: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>OperationNotFound</code> with type <code>string</code>

Fault-handling install template: <code>install ( OperationNotFound => /* error-handling code */ )</code>



Fault <code>InvocationFault</code> with type <code>InvocationFaultType</code>

Fault-handling install template: <code>install ( InvocationFault => /* error-handling code */ )</code>
<pre>type InvocationFaultType: void {
	.data: string
	.name: string
}</pre>






