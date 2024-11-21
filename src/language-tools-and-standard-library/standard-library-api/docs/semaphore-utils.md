# Service SemaphoreUtils

> from semaphore-utils import SemaphoreUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#SemaphoreUtilsInterface'>SemaphoreUtilsInterface</a> |

### List of Available Interfaces

### SemaphoreUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| acquire | <a href="#SemaphoreRequest">SemaphoreRequest</a> | <a href='#bool'>bool</a> | - | <br>	  Acquires permits from a semaphore.<br>	  If there exists no semaphore with the given ".name", "acquire" creates a <br>	  new semaphore with 0 permits with that name.<br>	  The operation returns a response when a new permit is released (see operation "release").<br>	  The default behaviour when value ".permits" is absent is to acquire one permit.<br>	  |
| release | <a href="#SemaphoreRequest">SemaphoreRequest</a> | <a href='#bool'>bool</a> | - | <br>	 Releases permits to a semaphore.<br>	 If there exists no semaphore with the given ".name", "release" creates a<br>	 new semaphore with that name and as many permits as indicated in ".permits".<br>	 The default behaviour when value ".permits" is absent is to release one permit.<br>	 |


### Types

<details>
<summary><span id="SemaphoreRequest">SemaphoreRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;permits[0,1]: int //  the optional number of permits to release/acquire
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
