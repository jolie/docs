# Service Time

> from time import Time

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#TimeInterface'>TimeInterface</a> |

### List of Available Interfaces

### TimeInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| cancelTimeout | <a href="#long">long</a> | <a href='#bool'>bool</a> | - | <br>		It Cancels a timeout from a long-value created from #scheduleTimeout<br>		 |
| getCurrentDateTime | <a href="#CurrentDateTimeRequestType">CurrentDateTimeRequestType</a> | <a href='#string'>string</a> | - | <br>		It returns the current date time as a string<br>		 |
| getCurrentDateValues | <a href="#void">void</a> | <a href='#DateValuesType'>DateValuesType</a> | - | <br>		 Returns the current date split in three fields: day, month and year<br>		 |
| getCurrentTimeMillis | <a href="#void">void</a> | <a href='#long'>long</a> | - | <br>		 Warning: this is temporary and subject to future change as soon as long is supported by Jolie.<br>		 |
| getDateDiff | <a href="#DiffDateRequestType">DiffDateRequestType</a> | <a href='#int'>int</a> | - |  |
| getDateTime | <a href="#GetDateTimeRequest">GetDateTimeRequest</a> | <a href='#GetDateTimeResponse'>GetDateTimeResponse</a> | - | <br>		 It returns a date time in a string format starting from a timestamp<br>		 |
| getDateTimeValues | <a href="#GetTimestampFromStringRequest">GetTimestampFromStringRequest</a> | <a href='#DateTimeType'>DateTimeType</a> | <details><summary>InvalidDate</summary>undefined)</details> |  |
| getDateValues | <a href="#DateValuesRequestType">DateValuesRequestType</a> | <a href='#DateValuesType'>DateValuesType</a> | <details><summary>InvalidDate</summary>undefined)</details> | <br>		 Converts an input string into a date expressed by means of<br>		 three elements: day, month and year. The request may specify the<br>		 date parsing format. See #DateValuesRequestType for details.<br>		 |
| getTimeDiff | <a href="#GetTimeDiffRequest">GetTimeDiffRequest</a> | <a href='#int'>int</a> | - |  |
| getTimeFromMilliSeconds | <a href="#int">int</a> | <a href='#TimeValuesType'>TimeValuesType</a> | - |  |
| getTimeValues | <a href="#string">string</a> | <a href='#TimeValuesType'>TimeValuesType</a> | - |  |
| getTimestampFromString | <a href="#GetTimestampFromStringRequest">GetTimestampFromStringRequest</a> | <a href='#long'>long</a> | <details><summary>InvalidTimestamp</summary>undefined)</details> |  |
| scheduleTimeout | <a href="#ScheduleTimeOutRequest">ScheduleTimeOutRequest</a> | <a href='#long'>long</a> | <details><summary>InvalidTimeUnit</summary>undefined)</details> | <br>		 Schedules a timeout, which can be cancelled using #cancelTimeout from the returned string. Default .timeunit value is MILLISECONDS, .operation default is "timeout".<br>		 |
| setNextTimeout | <a href="#SetNextTimeOutRequest">SetNextTimeOutRequest</a> | - | - | <br>		  it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message<br>		  When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation<br>		  ( default: timeout )<br>		 |
| setNextTimeoutByDateTime | <a href="#undefined">undefined</a> | - | - |  |
| setNextTimeoutByTime | <a href="#undefined">undefined</a> | - | - |  |
| sleep | <a href="#int">int</a> | <a href='#void'>void</a> | - | <br>		It waits for a period specified in the request (in milliseconds)<br>		 |
| stopNextTimeout | <a href="#void">void</a> | - | - |  It stops the current timeout previously set with a setNextTimeout  |


### Types

<details>
<summary><span id="CurrentDateTimeRequestType">CurrentDateTimeRequestType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;format[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="DateTimeType">DateTimeType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;month[1,1]: int // 
&nbsp;&nbsp;hour[1,1]: int // 
&nbsp;&nbsp;year[1,1]: int // 
&nbsp;&nbsp;day[1,1]: int // 
&nbsp;&nbsp;minute[1,1]: int // 
&nbsp;&nbsp;second[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="DateValuesRequestType">DateValuesRequestType: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;format[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="DateValuesType">DateValuesType: &#10;WARNING: work in progress, the API is unstable.&#10;
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;month[1,1]: int // 
&nbsp;&nbsp;year[1,1]: int // 
&nbsp;&nbsp;day[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="DiffDateRequestType">DiffDateRequestType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;format[0,1]: string // 
&nbsp;&nbsp;date2[1,1]: string // 
&nbsp;&nbsp;date1[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetDateTimeRequest">GetDateTimeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
long &#123;
&nbsp;&nbsp;format[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetDateTimeResponse">GetDateTimeResponse: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;month[1,1]: int // 
&nbsp;&nbsp;hour[1,1]: int // 
&nbsp;&nbsp;year[1,1]: int // 
&nbsp;&nbsp;day[1,1]: int // 
&nbsp;&nbsp;minute[1,1]: int // 
&nbsp;&nbsp;second[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetTimeDiffRequest">GetTimeDiffRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;time1[1,1]: string // 
&nbsp;&nbsp;time2[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetTimestampFromStringRequest">GetTimestampFromStringRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;format[0,1]: string // 
&nbsp;&nbsp;language[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ScheduleTimeOutRequest">ScheduleTimeOutRequest: 
</span>
</summary>

##### Type Declaration
<pre>
int &#123;
&nbsp;&nbsp;message[0,1]: undefined // 
&nbsp;&nbsp;operation[0,1]: string // 
&nbsp;&nbsp;timeunit[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="SetNextTimeOutRequest">SetNextTimeOutRequest: 
</span>
</summary>

##### Type Declaration
<pre>
int &#123;
&nbsp;&nbsp;message[0,1]: undefined // 
&nbsp;&nbsp;operation[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="TimeValuesType">TimeValuesType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;hour[1,1]: int // 
&nbsp;&nbsp;minute[1,1]: int // 
&nbsp;&nbsp;second[1,1]: int // 
&#125;
</pre>
</details>
