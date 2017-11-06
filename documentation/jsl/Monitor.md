<html>
<head></head><body>
<h1>JolieDoc for Port Monitor</h1>
<h2>From file <code>standard_monitor.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Monitor</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#MonitorInterface">MonitorInterface </a>
<li><a href="#StandardMonitorInterface">StandardMonitorInterface </a>
</ul>
<hr>
<h2 id=MonitorInterface>Interface MonitorInterface</h2>
<a name="MonitorInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#pushEvent">pushEvent</a></td>
<td><a href="#undefined">undefined</a><br /></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</tr>
</table>
<h2 id=StandardMonitorInterface>Interface StandardMonitorInterface</h2>
<a name="StandardMonitorInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#flush">flush</a></td>
<td>void<br /></td>
<td><a href="#FlushResponse">FlushResponse</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#setMonitor">setMonitor</a></td>
<td><a href="#SetStandardMonitorRequest">SetStandardMonitorRequest</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="pushEvent"></a><h3 id="pushEvent">pushEvent</h3></div>
<p><pre>pushEvent( <a href="#undefined">undefined</a> )</pre></p>
<div class="operation-title"><a name="flush"></a><h3 id="flush">flush</h3></div>
<pre>flush( <a href="#void">void</a> )( <a href="#FlushResponse">FlushResponse</a> )
</pre>
<div class="operation-title"><a name="setMonitor"></a><h3 id="setMonitor">setMonitor</h3></div>
<pre>setMonitor( <a href="#SetStandardMonitorRequest">SetStandardMonitorRequest</a> )( <a href="#void">void</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="FlushResponse"></a><h3 id="FlushResponse">FlushResponse</h3>
<pre lang="jolie">type FlushResponse: void { 
    .events*: MonitorEvent
}</pre>
<a name="SetStandardMonitorRequest"></a><h3 id="SetStandardMonitorRequest">SetStandardMonitorRequest</h3>
<pre lang="jolie">type SetStandardMonitorRequest: void { 
    .queueMax?: int
    .triggeredEnabled?: bool
    .triggerThreshold?: int
}</pre>
<hr>
<h2>Type list</h2>
<h3 id="MonitorEvent">MonitorEvent</h3>
<a name="MonitorEvent"></a>
<pre lang="jolie">type MonitorEvent: void { 
    .memory: long
    .data?: undefined
    .type: string
    .timestamp: long
}</pre>
</body>
</html>
