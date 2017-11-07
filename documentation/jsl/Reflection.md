<html>
<head></head><body>
<h1>JolieDoc for Port Reflection</h1>
<h2>From file <code>reflection.iol
</code></h2>
<table>
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
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ReflectionIface">ReflectionIface </a>
</ul>
<hr>
<h2 id=ReflectionIface>Interface ReflectionIface</h2>
<a name="ReflectionIface"></a>
WARNING: the API of this service is experimental. Use it at your own risk.
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#invoke">invoke</a></td>
<td><a href="#InvokeRequest">InvokeRequest</a><br /></td>
<td>undefined<br /></td>
<td>
OperationNotFound( <a href="#string">string</a> )&nbsp;&nbsp;<br>
InvocationFault( <a href="#InvocationFaultType">InvocationFaultType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="invoke"></a><h3 id="invoke">invoke</h3></div>
<pre>invoke( <a href="#InvokeRequest">InvokeRequest</a> )( <a href="#undefined">undefined</a> )
 throws

				
OperationNotFound( <a href="#string">string</a> )

				
InvocationFault( <a href="#InvocationFaultType">InvocationFaultType</a> )
</pre>
<span class="opdoc"><p>Invokes the specified .operation at .outputPort.<br>	If the operation is a OneWay, the invocation returns no value.</p></span>
<hr>
<h2>Message type list</h2>
<a name="InvokeRequest"></a><h3 id="InvokeRequest">InvokeRequest</h3>
<pre lang="jolie">type InvokeRequest: void { 
    .outputPort: string
    .data?: undefined
    .resourcePath?: string
    .operation: string
}</pre>
<a name="InvocationFaultType"></a><h3 id="InvocationFaultType">InvocationFaultType</h3>
<pre lang="jolie">type InvocationFaultType: void { 
    .data: string
    .name: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
