# Include library: runtime.iol

Inclusion code: <code>include "runtime.iol"</code>

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
      <td>Runtime</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#RuntimeInterface">RuntimeInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="RuntimeInterface">RuntimeInterface</h3>

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
      <td><a href="#loadLibrary">loadLibrary</a></td>
      <td>string</td>
      <td>void</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#removeOutputPort">removeOutputPort</a></td>
      <td>string</td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setRedirection">setRedirection</a></td>
      <td><a href="#SetRedirectionRequest">SetRedirectionRequest</a></td>
      <td>void</td>
      <td>
        RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#getOutputPorts">getOutputPorts</a></td>
      <td>void</td>
      <td><a href="#GetOutputPortsResponse">GetOutputPortsResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#loadEmbeddedService">loadEmbeddedService</a></td>
      <td><a href="#LoadEmbeddedServiceRequest">LoadEmbeddedServiceRequest</a></td>
      <td>any</td>
      <td>
        RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#getOutputPort">getOutputPort</a></td>
      <td><a href="#GetOutputPortRequest">GetOutputPortRequest</a></td>
      <td><a href="#GetOutputPortResponse">GetOutputPortResponse</a></td>
      <td>
        OutputPortDoesNotExist( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#dumpState">dumpState</a></td>
      <td>void</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getLocalLocation">getLocalLocation</a></td>
      <td>void</td>
      <td>any</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getRedirection">getRedirection</a></td>
      <td><a href="#GetRedirectionRequest">GetRedirectionRequest</a></td>
      <td>any</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setOutputPort">setOutputPort</a></td>
      <td><a href="#SetOutputPortRequest">SetOutputPortRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#halt">halt</a></td>
      <td><a href="#HaltRequest">HaltRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#callExit">callExit</a></td>
      <td>any</td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#stats">stats</a></td>
      <td>void</td>
      <td><a href="#Stats">Stats</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#removeRedirection">removeRedirection</a></td>
      <td><a href="#GetRedirectionRequest">GetRedirectionRequest</a></td>
      <td>void</td>
      <td>
        RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#setMonitor">setMonitor</a></td>
      <td><a href="#SetMonitorRequest">SetMonitorRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getProcessId">getProcessId</a></td>
      <td>void</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getIncludePaths">getIncludePaths</a></td>
      <td>void</td>
      <td><a href="#GetIncludePathResponse">GetIncludePathResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getenv">getenv</a></td>
      <td>string</td>
      <td><a href="#MaybeString">MaybeString</a></td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="loadLibrary"></a>
#### loadLibrary


Invocation template: <code>loadLibrary@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: <code>install ( IOException => /* error-handling code */ )</code>
<pre>type IOExceptionType: JavaExceptionType</pre>

---

<a id="removeOutputPort"></a>
#### removeOutputPort


Invocation template: <code>removeOutputPort@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="setRedirection"></a>
#### setRedirection


Invocation template: <code>setRedirection@Runtime( request )( response )</code>

**Request type**
<a id="SetRedirectionRequest"></a>
Type documentation: no documentation provided 
<pre>type SetRedirectionRequest: void {
	.inputPortName: string
	.outputPortName: string
	.resourceName: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>RuntimeException</code> with type <code>RuntimeExceptionType</code>

Fault-handling install template: <code>install ( RuntimeException => /* error-handling code */ )</code>
<pre>type RuntimeExceptionType: JavaExceptionType</pre>

---

<a id="getOutputPorts"></a>
#### getOutputPorts
Operation documentation: 
		it returns the list of definitions of all the available outputPorts of the service
	

Invocation template: <code>getOutputPorts@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="GetOutputPortsResponse"></a>
Type documentation: no documentation provided 
<pre>type GetOutputPortsResponse: void {
	.port*: void {
		.protocol: string
		.name: string
		.location: string
	}
}</pre>




---

<a id="loadEmbeddedService"></a>
#### loadEmbeddedService


Invocation template: <code>loadEmbeddedService@Runtime( request )( response )</code>

**Request type**
<a id="LoadEmbeddedServiceRequest"></a>
Type documentation: no documentation provided 
<pre>type LoadEmbeddedServiceRequest: void {
	.filepath: string
	.type: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>RuntimeException</code> with type <code>RuntimeExceptionType</code>

Fault-handling install template: <code>install ( RuntimeException => /* error-handling code */ )</code>
<pre>type RuntimeExceptionType: JavaExceptionType</pre>

---

<a id="getOutputPort"></a>
#### getOutputPort
Operation documentation: 
		it returns a port definition if it exists, OuputPortDoesNotExist fault otherwise
	

Invocation template: <code>getOutputPort@Runtime( request )( response )</code>

**Request type**
<a id="GetOutputPortRequest"></a>
Type documentation: no documentation provided 
<pre>type GetOutputPortRequest: void {
	.name: string
}</pre>


**Response type**
<a id="GetOutputPortResponse"></a>
Type documentation: no documentation provided 
<pre>type GetOutputPortResponse: void {
	.protocol: string
	.name: string
	.location: string
}</pre>


**Possible faults thrown**


Fault <code>OutputPortDoesNotExist</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( OutputPortDoesNotExist => /* error-handling code */ )</code>


---

<a id="dumpState"></a>
#### dumpState


Invocation template: <code>dumpState@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="getLocalLocation"></a>
#### getLocalLocation


Invocation template: <code>getLocalLocation@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="getRedirection"></a>
#### getRedirection


Invocation template: <code>getRedirection@Runtime( request )( response )</code>

**Request type**
<a id="GetRedirectionRequest"></a>
Type documentation: no documentation provided 
<pre>type GetRedirectionRequest: void {
	.inputPortName: string
	.resourceName: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="setOutputPort"></a>
#### setOutputPort


Invocation template: <code>setOutputPort@Runtime( request )( response )</code>

**Request type**
<a id="SetOutputPortRequest"></a>
Type documentation: no documentation provided 
<pre>type SetOutputPortRequest: void {
	.protocol?: undefined
	.name: string
	.location: any
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="halt"></a>
#### halt


Invocation template: <code>halt@Runtime( request )( response )</code>

**Request type**
<a id="HaltRequest"></a>
Type documentation: no documentation provided 
<pre>type HaltRequest: void {
	.status?: int
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="callExit"></a>
#### callExit


Invocation template: <code>callExit@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="stats"></a>
#### stats
Operation documentation: 
	  Get information about the runtime state of the Jolie interpreter.
	 

Invocation template: <code>stats@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="Stats"></a>
Type documentation: no documentation provided 
<pre>type Stats: void {
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
}</pre>




---

<a id="removeRedirection"></a>
#### removeRedirection


Invocation template: <code>removeRedirection@Runtime( request )( response )</code>

**Request type**
<a id="GetRedirectionRequest"></a>
Type documentation: no documentation provided 
<pre>type GetRedirectionRequest: void {
	.inputPortName: string
	.resourceName: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>RuntimeException</code> with type <code>RuntimeExceptionType</code>

Fault-handling install template: <code>install ( RuntimeException => /* error-handling code */ )</code>
<pre>type RuntimeExceptionType: JavaExceptionType</pre>

---

<a id="setMonitor"></a>
#### setMonitor


Invocation template: <code>setMonitor@Runtime( request )( response )</code>

**Request type**
<a id="SetMonitorRequest"></a>
Type documentation: no documentation provided 
<pre>type SetMonitorRequest: void {
	.protocol?: undefined
	.location: any
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getProcessId"></a>
#### getProcessId


Invocation template: <code>getProcessId@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="getIncludePaths"></a>
#### getIncludePaths


Invocation template: <code>getIncludePaths@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="GetIncludePathResponse"></a>
Type documentation: no documentation provided 
<pre>type GetIncludePathResponse: void {
	.path*: string
}</pre>




---

<a id="getenv"></a>
#### getenv
Operation documentation:  Get the value of an environment variable 

Invocation template: <code>getenv@Runtime( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="MaybeString"></a>
Type documentation: no documentation provided 
<pre>type MaybeString: type MaybeString: void|type MaybeString: string</pre>




---


<h4>Subtypes</h4>


<a id="IOExceptionType"></a>
IOExceptionType

<pre>type IOExceptionType: JavaExceptionType</pre>

<a id="RuntimeExceptionType"></a>
RuntimeExceptionType

<pre>type RuntimeExceptionType: JavaExceptionType</pre>




