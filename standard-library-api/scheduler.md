# Include library: scheduler.iol

Inclusion code: <pre>include "scheduler.iol"</pre>

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

<h2>Operation Description</h2>



<h3 id="setCronJob">setCronJob</h3>


Invocation template: 
<pre>setCronJob@Scheduler( request )( response )</pre>

<h4 id="SetCronJobRequest">Request type</h4>

Type: SetCronJobRequest

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


<h4>Response type</h4>

Type: void

Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>JobAlreadyExists</code> with type <code>void</code>

Fault-handling install template: 
<pre>install ( JobAlreadyExists => /* error-handling code */ )</pre>




<h3 id="deleteCronJob">deleteCronJob</h3>


Invocation template: 
<pre>deleteCronJob@Scheduler( request )( response )</pre>

<h4 id="DeleteCronJobRequest">Request type</h4>

Type: DeleteCronJobRequest

Type documentation: no documentation provided 
<pre>type DeleteCronJobRequest: void {
	.jobName: string
	.groupName: string
}</pre>


<h4>Response type</h4>

Type: void

Type documentation: no documentation provided 








<h3 id="setCallbackOperation">setCallbackOperation</h3>


Invocation template: 
<pre>setCallbackOperation@Scheduler( request )</pre>

<h4 id="SetCallBackOperationRequest">Request type</h4>

Type: SetCallBackOperationRequest

Type documentation: no documentation provided 
<pre>type SetCallBackOperationRequest: void {
	.operationName: string
}</pre>









