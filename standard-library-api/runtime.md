# Include library: runtime.iol

Inclusion code: <pre>include "runtime.iol"</pre>

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
  <tbody><tr><td>Runtime documentation: </td></tr>
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

Interface documentation: 

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
      <td><a href="#getVersion">getVersion</a></td>
      <td>void</td>
      <td>string</td>
      <td>
      </td>
    </tr>
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
      <td><a href="#MaybeString">MaybeString</a></td>
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

<h2>Operation Description</h2>



<h3 id="getVersion">getVersion</h3>

Operation documentation:  Returns the version of the Jolie interpreter running this service.


Invocation template: 
<pre>getVersion@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="loadLibrary">loadLibrary</h3>

Operation documentation:  Dynamically loads an external (jar) library.


Invocation template: 
<pre>loadLibrary@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: void




<code>void : void</code> 




<h4>Possible faults thrown</h4>


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3 id="removeOutputPort">removeOutputPort</h3>

Operation documentation:  Removes the output port with the requested name.


Invocation template: 
<pre>removeOutputPort@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: void




<code>void : void</code> 








<h3 id="setRedirection">setRedirection</h3>

Operation documentation:  Set a redirection at an input port.
	  If the redirection with this name does not exist already,
	  this operation creates it.
	  Otherwise, the redirection is replaced with this one.
	 


Invocation template: 
<pre>setRedirection@Runtime( request )( response )</pre>

<h4 id="SetRedirectionRequest">Request type</h4>

Type: SetRedirectionRequest


<pre>type SetRedirectionRequest: void {
	.inputPortName: string
	.outputPortName: string
	.resourceName: string
}</pre>

<code>SetRedirectionRequest : void</code> 

<ul>

  <li><code>inputPortName : string</code> :  The target input port 
</li>

  <li><code>outputPortName : string</code> :  The target output port 
</li>

  <li><code>resourceName : string</code> :  The target resource name 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 




<h4>Possible faults thrown</h4>


Fault <code>RuntimeException</code> with type <code>RuntimeExceptionType</code>

Fault-handling install template: 
<pre>install ( RuntimeException => /* error-handling code */ )</pre>
<pre>type RuntimeExceptionType: JavaExceptionType</pre>



<h3 id="getOutputPorts">getOutputPorts</h3>

Operation documentation:  Returns all the output ports used by this service.


Invocation template: 
<pre>getOutputPorts@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4 id="GetOutputPortsResponse">Response type</h4>

Type: GetOutputPortsResponse


<pre>type GetOutputPortsResponse: void {
	.port*: void {
		.protocol: string
		.name: string
		.location: string
	}
}</pre>

<code>GetOutputPortsResponse : void</code> 

<ul>

  <li><code>port : void</code> :  The output ports used by this interpreter 

<ul>

  <li><code>protocol : string</code> :  The protocol name of the output port 
</li>

  <li><code>name : string</code> :  The name of the output port 
</li>

  <li><code>location : string</code> :  The location of the output port 
</li>

</ul>
</li>

</ul>








<h3 id="loadEmbeddedService">loadEmbeddedService</h3>

Operation documentation:  Load an embedded service.


Invocation template: 
<pre>loadEmbeddedService@Runtime( request )( response )</pre>

<h4 id="LoadEmbeddedServiceRequest">Request type</h4>

Type: LoadEmbeddedServiceRequest


<pre>type LoadEmbeddedServiceRequest: void {
	.filepath: string
	.type: string
}</pre>

<code>LoadEmbeddedServiceRequest : void</code> 

<ul>

  <li><code>filepath : string</code> :  The path to the service to load 
</li>

  <li><code>type : string</code> :  The type of the service, e.g., Jolie, Java, or JavaScript 
</li>

</ul>



<h4>Response type</h4>

Type: any




<code>any : any</code> 




<h4>Possible faults thrown</h4>


Fault <code>RuntimeException</code> with type <code>RuntimeExceptionType</code>

Fault-handling install template: 
<pre>install ( RuntimeException => /* error-handling code */ )</pre>
<pre>type RuntimeExceptionType: JavaExceptionType</pre>



<h3 id="getOutputPort">getOutputPort</h3>

Operation documentation:  Returns the definition of output port definition.
	  @throws OutputPortDoesNotExist if the requested output port does not exist.
	 


Invocation template: 
<pre>getOutputPort@Runtime( request )( response )</pre>

<h4 id="GetOutputPortRequest">Request type</h4>

Type: GetOutputPortRequest


<pre>type GetOutputPortRequest: void {
	.name: string
}</pre>

<code>GetOutputPortRequest : void</code> 

<ul>

  <li><code>name : string</code> :  The name of the output port 
</li>

</ul>



<h4 id="GetOutputPortResponse">Response type</h4>

Type: GetOutputPortResponse


<pre>type GetOutputPortResponse: void {
	.protocol: string
	.name: string
	.location: string
}</pre>

<code>GetOutputPortResponse : void</code> 

<ul>

  <li><code>protocol : string</code> :  The protocol name of the output port 
</li>

  <li><code>name : string</code> :  The name of the output port 
</li>

  <li><code>location : string</code> :  The location of the output port 
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>OutputPortDoesNotExist</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( OutputPortDoesNotExist => /* error-handling code */ )</pre>




<h3 id="dumpState">dumpState</h3>

Operation documentation:  Returns a pretty-printed string representation of
	  the local state of the invoking Jolie process and
	  the global state of this service.
	 


Invocation template: 
<pre>dumpState@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getLocalLocation">getLocalLocation</h3>

Operation documentation:  Get the local in-memory location of this service.


Invocation template: 
<pre>getLocalLocation@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4>Response type</h4>

Type: any




<code>any : any</code> 








<h3 id="getRedirection">getRedirection</h3>

Operation documentation:  Get the output port name that a redirection points to.


Invocation template: 
<pre>getRedirection@Runtime( request )( response )</pre>

<h4 id="GetRedirectionRequest">Request type</h4>

Type: GetRedirectionRequest


<pre>type GetRedirectionRequest: void {
	.inputPortName: string
	.resourceName: string
}</pre>

<code>GetRedirectionRequest : void</code> 

<ul>

  <li><code>inputPortName : string</code> :  The target input port 
</li>

  <li><code>resourceName : string</code> :  The resource name of the redirection to get 
</li>

</ul>



<h4 id="MaybeString">Response type</h4>

Type: MaybeString


<pre>type MaybeString: void | string</pre>

<code>MaybeString : </code> 

<ul>

  <li><code> : void</code> 
</li>

  <li><code> : string</code> 
</li>

</ul>








<h3 id="setOutputPort">setOutputPort</h3>

Operation documentation:  Set an output port.
	  If an output port with this name does not exist already,
	  this operation creates it.
	  Otherwise, the output port is replaced with this one.
	 


Invocation template: 
<pre>setOutputPort@Runtime( request )( response )</pre>

<h4 id="SetOutputPortRequest">Request type</h4>

Type: SetOutputPortRequest


<pre>type SetOutputPortRequest: void {
	.protocol?: undefined
	.name: string
	.location: any
}</pre>

<code>SetOutputPortRequest : void</code> 

<ul>

  <li><code>protocol : string</code> :  The name of the protocol (e.g., sodep, http) 
</li>

  <li><code>name : string</code> :  The name of the output port 
</li>

  <li><code>location : any</code> :  The location of the output port 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 








<h3 id="halt">halt</h3>

Operation documentation:  Halts non-gracefully the execution of this service.


Invocation template: 
<pre>halt@Runtime( request )( response )</pre>

<h4 id="HaltRequest">Request type</h4>

Type: HaltRequest


<pre>type HaltRequest: void {
	.status?: int
}</pre>

<code>HaltRequest : void</code> 

<ul>

  <li><code>status : int</code> :  The status code to return to the execution environment 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 








<h3 id="callExit">callExit</h3>

Operation documentation:  Stops gracefully the execution of this service.
	  Calling this operation is equivalent to invoking the exit statement.
	 


Invocation template: 
<pre>callExit@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: any




<code>any : any</code> 



<h4>Response type</h4>

Type: void




<code>void : void</code> 








<h3 id="stats">stats</h3>

Operation documentation:  Returns information on the runtime state of the VM.


Invocation template: 
<pre>stats@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4 id="Stats">Response type</h4>

Type: Stats


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

<code>Stats : void</code> :  Information on the interpreter execution so far 

<ul>

  <li><code>os : void</code> :  OS-related information 

<ul>

  <li><code>availableProcessors : int</code> :  Number of available processors 
</li>

  <li><code>systemLoadAverage : double</code> :  System load average 
</li>

  <li><code>name : string</code> :  Name of the OS 
</li>

  <li><code>arch : string</code> :  Architecture 
</li>

  <li><code>version : string</code> :  OS version 
</li>

</ul>
</li>

  <li><code>files : void</code> :  Information on file descriptors 

<ul>

  <li><code>openCount : long</code> :  Number of open files 
</li>

  <li><code>maxCount : long</code> :  Maximum number of open files allowed for this VM 
</li>

</ul>
</li>

</ul>








<h3 id="removeRedirection">removeRedirection</h3>

Operation documentation:  Remove a redirection at an input port


Invocation template: 
<pre>removeRedirection@Runtime( request )( response )</pre>

<h4 id="GetRedirectionRequest">Request type</h4>

Type: GetRedirectionRequest


<pre>type GetRedirectionRequest: void {
	.inputPortName: string
	.resourceName: string
}</pre>

<code>GetRedirectionRequest : void</code> 

<ul>

  <li><code>inputPortName : string</code> :  The target input port 
</li>

  <li><code>resourceName : string</code> :  The resource name of the redirection to get 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 




<h4>Possible faults thrown</h4>


Fault <code>RuntimeException</code> with type <code>RuntimeExceptionType</code>

Fault-handling install template: 
<pre>install ( RuntimeException => /* error-handling code */ )</pre>
<pre>type RuntimeExceptionType: JavaExceptionType</pre>



<h3 id="setMonitor">setMonitor</h3>

Operation documentation:  Set the monitor for this service.


Invocation template: 
<pre>setMonitor@Runtime( request )( response )</pre>

<h4 id="SetMonitorRequest">Request type</h4>

Type: SetMonitorRequest


<pre>type SetMonitorRequest: void {
	.protocol?: undefined
	.location: any
}</pre>

<code>SetMonitorRequest : void</code> 

<ul>

  <li><code>protocol : string</code> :  The protocol configuration for the monitor 
</li>

  <li><code>location : any</code> :  The location of the monitor 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 








<h3 id="getProcessId">getProcessId</h3>

Operation documentation:  Returns the internal identifier of the executing Jolie process.


Invocation template: 
<pre>getProcessId@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getIncludePaths">getIncludePaths</h3>

Operation documentation:  Get the include paths used by this interpreter


Invocation template: 
<pre>getIncludePaths@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4 id="GetIncludePathResponse">Response type</h4>

Type: GetIncludePathResponse


<pre>type GetIncludePathResponse: void {
	.path*: string
}</pre>

<code>GetIncludePathResponse : void</code> 

<ul>

  <li><code>path : string</code> :  The include paths of the interpreter 
</li>

</ul>








<h3 id="getenv">getenv</h3>

Operation documentation:  Returns the value of an environment variable.


Invocation template: 
<pre>getenv@Runtime( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4 id="MaybeString">Response type</h4>

Type: MaybeString


<pre>type MaybeString: void | string</pre>

<code>MaybeString : </code> 

<ul>

  <li><code> : void</code> 
</li>

  <li><code> : string</code> 
</li>

</ul>








<h3>Subtypes</h3>


<h4 id="JavaExceptionType">JavaExceptionType</h4>



<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>
<code>JavaExceptionType : string</code> 




