# Include library: monitors/standard_monitor.iol

Inclusion code: <pre>include "monitors/standard_monitor.iol"</pre>

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
      <td>MonitorInput</td>
      <td>local</td>
      <td>-</td>
      <td><a href="#StandardMonitorInputInterface">StandardMonitorInputInterface</a></td>
    </tr>
    <tr>
      <td>Monitor</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#MonitorInterface">MonitorInterface</a><a href="#StandardMonitorInterface">StandardMonitorInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="StandardMonitorInputInterface">StandardMonitorInputInterface</h3>

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
      <td><a href="#monitorAlert">monitorAlert</a></td>
      <td>void</td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="monitorAlert">monitorAlert</h4>



Invocation template: <pre>monitorAlert( request )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 












<h3 id="MonitorInterface">MonitorInterface</h3>

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
      <td><a href="#pushEvent">pushEvent</a></td>
      <td>undefined</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="pushEvent">pushEvent</h4>



Invocation template: <pre>pushEvent@Monitor( request )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 











<h3 id="StandardMonitorInterface">StandardMonitorInterface</h3>

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
      <td><a href="#flush">flush</a></td>
      <td>void</td>
      <td><a href="#FlushResponse">FlushResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setMonitor">setMonitor</a></td>
      <td><a href="#SetStandardMonitorRequest">SetStandardMonitorRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="flush">flush</h4>



Invocation template: <pre>flush@Monitor( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4 id="FlushResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type FlushResponse: void {
	.events*: MonitorEvent
}</pre>







<h3 id="setMonitor">setMonitor</h4>



Invocation template: <pre>setMonitor@Monitor( request )( response )</pre>

<h4 id="SetStandardMonitorRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SetStandardMonitorRequest: void {
	.queueMax?: int
	.triggeredEnabled?: bool
	.triggerThreshold?: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 











