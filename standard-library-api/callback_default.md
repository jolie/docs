# Include library: scheduler/callback_default.iol

Inclusion code: <code>include "scheduler/callback_default.iol"</code>

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
      <td>SchedulerCallBack</td>
      <td>local</td>
      <td>-</td>
      <td><a href="#SchedulerCallBackInterface">SchedulerCallBackInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="SchedulerCallBackInterface">SchedulerCallBackInterface</h3>

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
      <td><a href="#schedulerCallback">schedulerCallback</a></td>
      <td><a href="#SchedulerCallBackRequest">SchedulerCallBackRequest</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description



<h4 id="schedulerCallback">schedulerCallback</h4>


Invocation template: <code>schedulerCallback( request )</code>

<h4 id="SchedulerCallBackRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SchedulerCallBackRequest: void {
	.jobName: string
	.groupName: string
}</pre>










