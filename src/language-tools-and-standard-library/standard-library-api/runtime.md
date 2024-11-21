<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Runtime

> from runtime import Runtime

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#RuntimeInterface'>RuntimeInterface</a> |

### List of Available Interfaces

### RuntimeInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| callExit | <a href="#any">any</a> | <a href='#void'>void</a> | - |  Stops gracefully the execution of this service.<br>	  Calling this operation is equivalent to invoking the exit statement.<br>	  |
| dumpState | <a href="#void">void</a> | <a href='#string'>string</a> | - |  Returns a pretty-printed string representation of<br>	  the local state of the invoking Jolie process and<br>	  the global state of this service.<br>	  |
| getIncludePaths | <a href="#void">void</a> | <a href='#GetIncludePathResponse'>GetIncludePathResponse</a> | - |  Get the include paths used by this interpreter |
| getLocalLocation | <a href="#void">void</a> | <a href='#any'>any</a> | - |  Get the local in-memory location of this service. |
| getOutputPort | <a href="#GetOutputPortRequest">GetOutputPortRequest</a> | <a href='#GetOutputPortResponse'>GetOutputPortResponse</a> | <details><summary>OutputPortDoesNotExist</summary>undefined</details> |  Returns the definition of output port definition.<br>	  @throws OutputPortDoesNotExist if the requested output port does not exist.<br>	  |
| getOutputPorts | <a href="#void">void</a> | <a href='#GetOutputPortsResponse'>GetOutputPortsResponse</a> | - |  Returns all the output ports used by this service. |
| getProcessId | <a href="#void">void</a> | <a href='#string'>string</a> | - |  Returns the internal identifier of the executing Jolie process. |
| getRedirection | <a href="#GetRedirectionRequest">GetRedirectionRequest</a> | <a href='#MaybeString'>MaybeString</a> | - |  Get the output port name that a redirection points to. |
| getVersion | <a href="#void">void</a> | <a href='#string'>string</a> | - |  Returns the version of the Jolie interpreter running this service. |
| getenv | <a href="#string">string</a> | <a href='#MaybeString'>MaybeString</a> | - |  Returns the value of an environment variable. |
| halt | <a href="#HaltRequest">HaltRequest</a> | <a href='#void'>void</a> | - |  Halts non-gracefully the execution of this service. |
| loadEmbeddedService | <a href="#LoadEmbeddedServiceRequest">LoadEmbeddedServiceRequest</a> | <a href='#any'>any</a> | <details><summary>RuntimeException</summary><a href='#RuntimeExceptionType'>RuntimeExceptionType</a></details> |  Load an embedded service. |
| loadLibrary | <a href="#string">string</a> | <a href='#void'>void</a> | <details><summary>IOException</summary><a href='#4#IOExceptionType'>4#IOExceptionType</a></details> |  Dynamically loads an external (jar) library. |
| removeOutputPort | <a href="#string">string</a> | <a href='#void'>void</a> | - |  Removes the output port with the requested name. |
| removeRedirection | <a href="#GetRedirectionRequest">GetRedirectionRequest</a> | <a href='#void'>void</a> | <details><summary>RuntimeException</summary><a href='#RuntimeExceptionType'>RuntimeExceptionType</a></details> |  Remove a redirection at an input port |
| setMonitor | <a href="#SetMonitorRequest">SetMonitorRequest</a> | <a href='#void'>void</a> | - |  Set the monitor for this service. |
| setOutputPort | <a href="#SetOutputPortRequest">SetOutputPortRequest</a> | <a href='#void'>void</a> | - |  Set an output port.<br>	  If an output port with this name does not exist already,<br>	  this operation creates it.<br>	  Otherwise, the output port is replaced with this one.<br>	  |
| setRedirection | <a href="#SetRedirectionRequest">SetRedirectionRequest</a> | <a href='#void'>void</a> | <details><summary>RuntimeException</summary><a href='#RuntimeExceptionType'>RuntimeExceptionType</a></details> |  Set a redirection at an input port.<br>	  If the redirection with this name does not exist already,<br>	  this operation creates it.<br>	  Otherwise, the redirection is replaced with this one.<br>	  |
| stats | <a href="#void">void</a> | <a href='#Stats'>Stats</a> | - |  Returns information on the runtime state of the VM. |


### Types

<details>
<summary><span id="GetIncludePathResponse">GetIncludePathResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;path[0,1]: string //  The include paths of the interpreter
&#125;
</pre>
</details>
<details>
<summary><span id="GetOutputPortRequest">GetOutputPortRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;name[1,1]: string //  The name of the output port
&#125;
</pre>
</details>
<details>
<summary><span id="GetOutputPortResponse">GetOutputPortResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;protocol[1,1]: string //  The protocol name of the output port
&nbsp;&nbsp;name[1,1]: string //  The name of the output port
&nbsp;&nbsp;location[1,1]: string //  The location of the output port
&#125;
</pre>
</details>
<details>
<summary><span id="GetOutputPortsResponse">GetOutputPortsResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;port[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;protocol[1,1]: string //  The protocol name of the output port
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string //  The name of the output port
&nbsp;&nbsp;&nbsp;&nbsp;location[1,1]: string //  The location of the output port
&nbsp;&nbsp;&#125; //  The output ports used by this interpreter
&#125;
</pre>
</details>
<details>
<summary><span id="GetRedirectionRequest">GetRedirectionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;inputPortName[1,1]: string //  The target input port
&nbsp;&nbsp;resourceName[1,1]: string //  The resource name of the redirection to get
&#125;
</pre>
</details>
<details>
<summary><span id="HaltRequest">HaltRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;status[0,1]: int //  The status code to return to the execution environment
&#125;
</pre>
</details>
<details>
<summary><span id="IOExceptionType">IOExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#JavaExceptionType'>JavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="IOExceptionType">IOExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#IOExceptionType'>IOExceptionType</a>
</pre>
</details>
<details>
<summary><span id="JavaExceptionType">JavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;stackTrace[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="LoadEmbeddedServiceRequest">LoadEmbeddedServiceRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filepath[1,1]: string //  The path to the service to load
&nbsp;&nbsp;service[0,1]: string //  The name of the service to load, if relevant
&nbsp;&nbsp;type[0,1]: string //  The type of the service, e.g., Jolie, Java, or JavaScript. Default: Jolie
&nbsp;&nbsp;params[0,1]: undefined //  The actual parameters (arguments) that should be passed to the service
&#125;
|void &#123;
&nbsp;&nbsp;code[1,1]: string // 
&#125;

</pre>
</details>
<details>
<summary><span id="MaybeString">MaybeString: 
</span>
</summary>

##### Type Declaration
<pre>
void
|string

</pre>
</details>
<details>
<summary><span id="RuntimeExceptionType">RuntimeExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#JavaExceptionType'>JavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="SetMonitorRequest">SetMonitorRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;protocol[0,1]: string //  The protocol configuration for the monitor
&nbsp;&nbsp;location[1,1]: any //  The location of the monitor
&#125;
</pre>
</details>
<details>
<summary><span id="SetOutputPortRequest">SetOutputPortRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;protocol[0,1]: string //  The name of the protocol (e.g., sodep, http)
&nbsp;&nbsp;name[1,1]: string //  The name of the output port
&nbsp;&nbsp;location[1,1]: any //  The location of the output port
&#125;
</pre>
</details>
<details>
<summary><span id="SetRedirectionRequest">SetRedirectionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;inputPortName[1,1]: string //  The target input port
&nbsp;&nbsp;outputPortName[1,1]: string //  The target output port
&nbsp;&nbsp;resourceName[1,1]: string //  The target resource name
&#125;
</pre>
</details>
<details>
<summary><span id="Stats">Stats:  Information on the interpreter execution so far
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;memory[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;total[1,1]: long // 
&nbsp;&nbsp;&nbsp;&nbsp;used[1,1]: long // 
&nbsp;&nbsp;&nbsp;&nbsp;free[1,1]: long // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;os[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;availableProcessors[1,1]: int //  Number of available processors
&nbsp;&nbsp;&nbsp;&nbsp;systemLoadAverage[1,1]: double //  System load average
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string //  Name of the OS
&nbsp;&nbsp;&nbsp;&nbsp;arch[1,1]: string //  Architecture
&nbsp;&nbsp;&nbsp;&nbsp;version[1,1]: string //  OS version
&nbsp;&nbsp;&#125; //  OS-related information
&nbsp;&nbsp;files[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;openCount[0,1]: long //  Number of open files
&nbsp;&nbsp;&nbsp;&nbsp;maxCount[0,1]: long //  Maximum number of open files allowed for this VM
&nbsp;&nbsp;&#125; //  Information on file descriptors
&#125;
</pre>
</details>
