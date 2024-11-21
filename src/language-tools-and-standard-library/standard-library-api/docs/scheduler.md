# Service Scheduler

> from scheduler import Scheduler

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#SchedulerInterface'>SchedulerInterface</a> |

### List of Available Interfaces

### SchedulerInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| deleteCronJob | <a href="#DeleteCronJobRequest">DeleteCronJobRequest</a> | <a href='#void'>void</a> | - |  |
| setCallbackOperation | <a href="#SetCallBackOperationRequest">SetCallBackOperationRequest</a> | - | - |  Set the callback operation name |
| setCronJob | <a href="#SetCronJobRequest">SetCronJobRequest</a> | <a href='#void'>void</a> | <details><summary>JobAlreadyExists</summary>void)</details> |  Set a new cron job |


### Types

<details>
<summary><span id="DeleteCronJobRequest">DeleteCronJobRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;jobName[1,1]: string // 
&nbsp;&nbsp;groupName[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="SetCallBackOperationRequest">SetCallBackOperationRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;operationName[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="SetCronJobRequest">SetCronJobRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;jobName[1,1]: string // 
&nbsp;&nbsp;cronSpecs[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;dayOfWeek[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;hour[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;month[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;dayOfMonth[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;year[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;second[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;minute[1,1]: string // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;groupName[1,1]: string // 
&#125;
</pre>
</details>
