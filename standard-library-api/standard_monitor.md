# Include library: monitors/standard_monitor.iol

Inclusion code: <code>include "monitors/standard_monitor.iol"</code>

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

### Operation Description



#### monitorAlert


Invocation template: <code>monitorAlert( request )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 






<hr>





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

### Operation Description



#### pushEvent


Invocation template: <code>pushEvent@Monitor( request )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 






<hr>




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

### Operation Description



#### flush


Invocation template: <code>flush@Monitor( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4 id="FlushResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type FlushResponse: void {
	.events*: MonitorEvent
}</pre>




<hr>


#### setMonitor


Invocation template: <code>setMonitor@Monitor( request )( response )</code>

<h4 id="SetStandardMonitorRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SetStandardMonitorRequest: void {
	.queueMax?: int
	.triggeredEnabled?: bool
	.triggerThreshold?: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>





