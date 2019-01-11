# Include library: scheduler.iol

Inclusion code: <code>include "scheduler.iol"</code>

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
      <td>Scheduler</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#SchedulerInterface">SchedulerInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="SchedulerInterface">SchedulerInterface</h3>

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
      <td><a href="#setCronJob">setCronJob</a></td>
      <td><a href="#SetCronJobRequest">SetCronJobRequest</a></td>
      <td>void</td>
      <td>
        JobAlreadyExists( void )
      </td>
    </tr>
    <tr>
      <td><a href="#deleteCronJob">deleteCronJob</a></td>
      <td><a href="#DeleteCronJobRequest">DeleteCronJobRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setCallbackOperation">setCallbackOperation</a></td>
      <td><a href="#SetCallBackOperationRequest">SetCallBackOperationRequest</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="setCronJob"></a>
#### setCronJob


Invocation template: <code>setCronJob@Scheduler( request )( response )</code>

**Request type**
<a id="SetCronJobRequest"></a>
Type documentation: no documentation provided 
<pre>type SetCronJobRequest: void {
	.jobName: string
	.cronSpecs: void {
		.dayOfWeek: string
		.hour: string
		.month: string
		.dayOfMonth: string
		.year?: string
		.second: string
		.minute: string
	}
	.groupName: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>JobAlreadyExists</code> with type <code>void</code>

Fault-handling install template: <code>install ( JobAlreadyExists => /* error-handling code */ )</code>


---

<a id="deleteCronJob"></a>
#### deleteCronJob


Invocation template: <code>deleteCronJob@Scheduler( request )( response )</code>

**Request type**
<a id="DeleteCronJobRequest"></a>
Type documentation: no documentation provided 
<pre>type DeleteCronJobRequest: void {
	.jobName: string
	.groupName: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="setCallbackOperation"></a>
#### setCallbackOperation


Invocation template: <code>setCallbackOperation@Scheduler( request )</code>

**Request type**
<a id="SetCallBackOperationRequest"></a>
Type documentation: no documentation provided 
<pre>type SetCallBackOperationRequest: void {
	.operationName: string
}</pre>





---





