<html>
<head></head><body>
<h1>JolieDoc for Port Runtime</h1>
<h2>From file <code>runtime.iol</code></h2>
<table>
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
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#RuntimeInterface">RuntimeInterface </a>
</ul>
<hr>
<h2 id=RuntimeInterface>Interface RuntimeInterface</h2>
<a name="RuntimeInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#callExit">callExit</a></td>
<td>any<br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#dumpState">dumpState</a></td>
<td>void<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getIncludePaths">getIncludePaths</a></td>
<td>void<br /></td>
<td><a href="#GetIncludePathResponse">GetIncludePathResponse</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getLocalLocation">getLocalLocation</a></td>
<td>void<br /></td>
<td>any<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getOutputPort">getOutputPort</a></td>
<td><a href="#GetOutputPortRequest">GetOutputPortRequest</a><br /></td>
<td><a href="#GetOutputPortResponse">GetOutputPortResponse</a><br /></td>
<td>
OutputPortDoesNotExist,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getOutputPorts">getOutputPorts</a></td>
<td>void<br /></td>
<td><a href="#GetOutputPortsResponse">GetOutputPortsResponse</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getProcessId">getProcessId</a></td>
<td>void<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getRedirection">getRedirection</a></td>
<td><a href="#GetRedirectionRequest">GetRedirectionRequest</a><br /></td>
<td>any<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#halt">halt</a></td>
<td><a href="#HaltRequest">HaltRequest</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#loadEmbeddedService">loadEmbeddedService</a></td>
<td><a href="#LoadEmbeddedServiceRequest">LoadEmbeddedServiceRequest</a><br /></td>
<td>any<br /></td>
<td>
RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#loadLibrary">loadLibrary</a></td>
<td>string<br /></td>
<td>void<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#removeOutputPort">removeOutputPort</a></td>
<td>string<br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#removeRedirection">removeRedirection</a></td>
<td><a href="#GetRedirectionRequest">GetRedirectionRequest</a><br /></td>
<td>void<br /></td>
<td>
RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#setMonitor">setMonitor</a></td>
<td><a href="#SetMonitorRequest">SetMonitorRequest</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#setOutputPort">setOutputPort</a></td>
<td><a href="#SetOutputPortRequest">SetOutputPortRequest</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#setRedirection">setRedirection</a></td>
<td><a href="#SetRedirectionRequest">SetRedirectionRequest</a><br /></td>
<td>void<br /></td>
<td>
RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#stats">stats</a></td>
<td>void<br /></td>
<td><a href="#Stats">Stats</a><br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="loadLibrary"></a><h3 id="loadLibrary">loadLibrary</h3></div>
<pre>loadLibrary( <a href="#string">string</a> )( <a href="#void">void</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="removeOutputPort"></a><h3 id="removeOutputPort">removeOutputPort</h3></div>
<pre>removeOutputPort( <a href="#string">string</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="setRedirection"></a><h3 id="setRedirection">setRedirection</h3></div>
<pre>setRedirection( <a href="#SetRedirectionRequest">SetRedirectionRequest</a> )( <a href="#void">void</a> )
 throws

				
RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )
</pre>
<div class="operation-title"><a name="getOutputPorts"></a><h3 id="getOutputPorts">getOutputPorts</h3></div>
<pre>getOutputPorts( <a href="#void">void</a> )( <a href="#GetOutputPortsResponse">GetOutputPortsResponse</a> )
</pre>
<span class="opdoc"><p>it returns the list of definitions of all the available outputPorts of the service</p></span>
<div class="operation-title"><a name="loadEmbeddedService"></a><h3 id="loadEmbeddedService">loadEmbeddedService</h3></div>
<pre>loadEmbeddedService( <a href="#LoadEmbeddedServiceRequest">LoadEmbeddedServiceRequest</a> )( <a href="#any">any</a> )
 throws

				
RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )
</pre>
<div class="operation-title"><a name="getOutputPort"></a><h3 id="getOutputPort">getOutputPort</h3></div>
<pre>getOutputPort( <a href="#GetOutputPortRequest">GetOutputPortRequest</a> )( <a href="#GetOutputPortResponse">GetOutputPortResponse</a> )
 throws

				
OutputPortDoesNotExist
</pre>
<span class="opdoc"><p>it returns a port definition if it exists, OuputPortDoesNotExist fault otherwise</p></span>
<div class="operation-title"><a name="dumpState"></a><h3 id="dumpState">dumpState</h3></div>
<pre>dumpState( <a href="#void">void</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getLocalLocation"></a><h3 id="getLocalLocation">getLocalLocation</h3></div>
<pre>getLocalLocation( <a href="#void">void</a> )( <a href="#any">any</a> )
</pre>
<div class="operation-title"><a name="getRedirection"></a><h3 id="getRedirection">getRedirection</h3></div>
<pre>getRedirection( <a href="#GetRedirectionRequest">GetRedirectionRequest</a> )( <a href="#any">any</a> )
</pre>
<div class="operation-title"><a name="setOutputPort"></a><h3 id="setOutputPort">setOutputPort</h3></div>
<pre>setOutputPort( <a href="#SetOutputPortRequest">SetOutputPortRequest</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="halt"></a><h3 id="halt">halt</h3></div>
<pre>halt( <a href="#HaltRequest">HaltRequest</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="callExit"></a><h3 id="callExit">callExit</h3></div>
<pre>callExit( <a href="#any">any</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="stats"></a><h3 id="stats">stats</h3></div>
<pre>stats( <a href="#void">void</a> )( <a href="#Stats">Stats</a> )
</pre>
<span class="opdoc"><p>Get information about the runtime state of the Jolie interpreter.</p></span>
<div class="operation-title"><a name="removeRedirection"></a><h3 id="removeRedirection">removeRedirection</h3></div>
<pre>removeRedirection( <a href="#GetRedirectionRequest">GetRedirectionRequest</a> )( <a href="#void">void</a> )
 throws

				
RuntimeException( <a href="#RuntimeExceptionType">RuntimeExceptionType</a> )
</pre>
<div class="operation-title"><a name="setMonitor"></a><h3 id="setMonitor">setMonitor</h3></div>
<pre>setMonitor( <a href="#SetMonitorRequest">SetMonitorRequest</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="getProcessId"></a><h3 id="getProcessId">getProcessId</h3></div>
<pre>getProcessId( <a href="#void">void</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getIncludePaths"></a><h3 id="getIncludePaths">getIncludePaths</h3></div>
<pre>getIncludePaths( <a href="#void">void</a> )( <a href="#GetIncludePathResponse">GetIncludePathResponse</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="IOExceptionType"></a><h3 id="IOExceptionType">IOExceptionType</h3>
<pre lang="jolie">type IOExceptionType: JavaExceptionType</pre>
<a name="SetRedirectionRequest"></a><h3 id="SetRedirectionRequest">SetRedirectionRequest</h3>
<pre lang="jolie">type SetRedirectionRequest: void { 
    .inputPortName: string
    .outputPortName: string
    .resourceName: string
}</pre>
<a name="RuntimeExceptionType"></a><h3 id="RuntimeExceptionType">RuntimeExceptionType</h3>
<pre lang="jolie">type RuntimeExceptionType: JavaExceptionType</pre>
<a name="GetOutputPortsResponse"></a><h3 id="GetOutputPortsResponse">GetOutputPortsResponse</h3>
<pre lang="jolie">type GetOutputPortsResponse: void { 
    .port*: void { 
        .protocol: string
        .name: string
        .location: string
    }
}</pre>
<a name="LoadEmbeddedServiceRequest"></a><h3 id="LoadEmbeddedServiceRequest">LoadEmbeddedServiceRequest</h3>
<pre lang="jolie">type LoadEmbeddedServiceRequest: void { 
    .filepath: string
    .type: string
}</pre>
<a name="GetOutputPortRequest"></a><h3 id="GetOutputPortRequest">GetOutputPortRequest</h3>
<pre lang="jolie">type GetOutputPortRequest: void { 
    .name: string
}</pre>
<a name="GetOutputPortResponse"></a><h3 id="GetOutputPortResponse">GetOutputPortResponse</h3>
<pre lang="jolie">type GetOutputPortResponse: void { 
    .protocol: string
    .name: string
    .location: string
}</pre>
<a name="GetRedirectionRequest"></a><h3 id="GetRedirectionRequest">GetRedirectionRequest</h3>
<pre lang="jolie">type GetRedirectionRequest: void { 
    .inputPortName: string
    .resourceName: string
}</pre>
<a name="SetOutputPortRequest"></a><h3 id="SetOutputPortRequest">SetOutputPortRequest</h3>
<pre lang="jolie">type SetOutputPortRequest: void { 
    .protocol?: undefined
    .name: string
    .location: any
}</pre>
<a name="HaltRequest"></a><h3 id="HaltRequest">HaltRequest</h3>
<pre lang="jolie">type HaltRequest: void { 
    .status?: int
}</pre>
<a name="Stats"></a><h3 id="Stats">Stats</h3>
<pre lang="jolie">type Stats: void { 
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
<a name="SetMonitorRequest"></a><h3 id="SetMonitorRequest">SetMonitorRequest</h3>
<pre lang="jolie">type SetMonitorRequest: void { 
    .protocol?: undefined
    .location: any
}</pre>
<a name="GetIncludePathResponse"></a><h3 id="GetIncludePathResponse">GetIncludePathResponse</h3>
<pre lang="jolie">type GetIncludePathResponse: void { 
    .path*: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
