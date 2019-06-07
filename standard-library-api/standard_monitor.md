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
    </tr><tr><td>Monitor documentation: </td></tr>
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
      <td><a href="#monitorAlert">monitorAlert</a></td>
      <td>void</td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="monitorAlert">monitorAlert</h3>

Operation documentation: 


Invocation template: 
<pre>monitorAlert( request )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 











<h3 id="MonitorInterface">MonitorInterface</h3>

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
      <td><a href="#pushEvent">pushEvent</a></td>
      <td>undefined</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="pushEvent">pushEvent</h3>

Operation documentation: 


Invocation template: 
<pre>pushEvent@Monitor( request )</pre>

<h4>Request type</h4>

Type: undefined




<code>undefined : any</code> 








<h3>Subtypes</h3>


<h4 id="MonitorEvent">MonitorEvent</h4>



<pre>type MonitorEvent: void {
	.memory: long
	.data?: undefined
	.type: string
	.timestamp: long
}</pre>
<code>MonitorEvent : void</code> 




<h3 id="StandardMonitorInterface">StandardMonitorInterface</h3>

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



<h3 id="flush">flush</h3>

Operation documentation: 


Invocation template: 
<pre>flush@Monitor( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4 id="FlushResponse">Response type</h4>

Type: FlushResponse


<pre>type FlushResponse: void {
	.events*: MonitorEvent
}</pre>

<code>FlushResponse : void</code> 

<ul>

  <li><code>events : void</code> 
</li>

</ul>








<h3 id="setMonitor">setMonitor</h3>

Operation documentation: 


Invocation template: 
<pre>setMonitor@Monitor( request )( response )</pre>

<h4 id="SetStandardMonitorRequest">Request type</h4>

Type: SetStandardMonitorRequest


<pre>type SetStandardMonitorRequest: void {
	.queueMax?: int
	.triggeredEnabled?: bool
	.triggerThreshold?: int
}</pre>

<code>SetStandardMonitorRequest : void</code> 

<ul>

  <li><code>queueMax : int</code> 
</li>

  <li><code>triggeredEnabled : bool</code> 
</li>

  <li><code>triggerThreshold : int</code> 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 








<h3>Subtypes</h3>


<h4 id="MonitorEvent">MonitorEvent</h4>



<pre>type MonitorEvent: void {
	.memory: long
	.data?: undefined
	.type: string
	.timestamp: long
}</pre>
<code>MonitorEvent : void</code> 




