# Include library: time.iol

Inclusion code: <code>include "time.iol"</code>

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
      <td>Time</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#TimeInterface">TimeInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="TimeInterface">TimeInterface</h3>

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
      <td><a href="#scheduleTimeout">scheduleTimeout</a></td>
      <td><a href="#ScheduleTimeOutRequest">ScheduleTimeOutRequest</a></td>
      <td>long</td>
      <td>
        InvalidTimeUnit( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#getDateValues">getDateValues</a></td>
      <td><a href="#DateValuesRequestType">DateValuesRequestType</a></td>
      <td><a href="#DateValuesType">DateValuesType</a></td>
      <td>
        InvalidDate( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#getDateTime">getDateTime</a></td>
      <td><a href="#GetDateTimeRequest">GetDateTimeRequest</a></td>
      <td><a href="#GetDateTimeResponse">GetDateTimeResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getCurrentTimeMillis">getCurrentTimeMillis</a></td>
      <td>void</td>
      <td>long</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getDateDiff">getDateDiff</a></td>
      <td><a href="#DiffDateRequestType">DiffDateRequestType</a></td>
      <td>int</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getTimeDiff">getTimeDiff</a></td>
      <td><a href="#GetTimeDiffRequest">GetTimeDiffRequest</a></td>
      <td>int</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getTimestampFromString">getTimestampFromString</a></td>
      <td><a href="#GetTimestampFromStringRequest">GetTimestampFromStringRequest</a></td>
      <td>long</td>
      <td>
        InvalidTimestamp( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#cancelTimeout">cancelTimeout</a></td>
      <td>long</td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setNextTimeoutByTime">setNextTimeoutByTime</a></td>
      <td>undefined</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getCurrentDateTime">getCurrentDateTime</a></td>
      <td><a href="#CurrentDateTimeRequestType">CurrentDateTimeRequestType</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#sleep">sleep</a></td>
      <td>undefined</a></td>
      <td>undefined</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setNextTimeout">setNextTimeout</a></td>
      <td><a href="#SetNextTimeOutRequest">SetNextTimeOutRequest</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getTimeFromMilliSeconds">getTimeFromMilliSeconds</a></td>
      <td>int</td>
      <td><a href="#TimeValuesType">TimeValuesType</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getDateTimeValues">getDateTimeValues</a></td>
      <td><a href="#GetTimestampFromStringRequest">GetTimestampFromStringRequest</a></td>
      <td><a href="#DateTimeType">DateTimeType</a></td>
      <td>
        InvalidDate( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#setNextTimeoutByDateTime">setNextTimeoutByDateTime</a></td>
      <td>undefined</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getCurrentDateValues">getCurrentDateValues</a></td>
      <td>void</td>
      <td><a href="#DateValuesType">DateValuesType</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getTimeValues">getTimeValues</a></td>
      <td>string</td>
      <td><a href="#TimeValuesType">TimeValuesType</a></td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="scheduleTimeout"></a>
#### scheduleTimeout
Operation documentation: 
		 Schedules a timeout, which can be cancelled using #cancelTimeout from the returned string. Default .timeunit value is MILLISECONDS, .operation default is "timeout".
		

Invocation template: <code>scheduleTimeout@Time( request )( response )</code>

**Request type**
<a id="ScheduleTimeOutRequest"></a>
Type documentation: no documentation provided 
<pre>type ScheduleTimeOutRequest: int {
	.message?: undefined
	.operation?: string
	.timeunit?: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>InvalidTimeUnit</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InvalidTimeUnit => /* error-handling code */ )</code>


---

<a id="getDateValues"></a>
#### getDateValues
Operation documentation: 
		 Converts an input string into a date expressed by means of
		 three elements: day, month and year. The request may specify the
		 date parsing format. See #DateValuesRequestType for details.
		

Invocation template: <code>getDateValues@Time( request )( response )</code>

**Request type**
<a id="DateValuesRequestType"></a>
Type documentation: no documentation provided 
<pre>type DateValuesRequestType: string {
	.format?: string
}</pre>


**Response type**
<a id="DateValuesType"></a>
Type documentation: no documentation provided 
<pre>type DateValuesType: void {
	.month: int
	.year: int
	.day: int
}</pre>


**Possible faults thrown**


Fault <code>InvalidDate</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InvalidDate => /* error-handling code */ )</code>


---

<a id="getDateTime"></a>
#### getDateTime
Operation documentation: 
		 It returns a date time in a string format starting from a timestamp
		

Invocation template: <code>getDateTime@Time( request )( response )</code>

**Request type**
<a id="GetDateTimeRequest"></a>
Type documentation: no documentation provided 
<pre>type GetDateTimeRequest: long {
	.format?: string
}</pre>


**Response type**
<a id="GetDateTimeResponse"></a>
Type documentation: no documentation provided 
<pre>type GetDateTimeResponse: string {
	.month: int
	.hour: int
	.year: int
	.day: int
	.minute: int
	.second: int
}</pre>




---

<a id="getCurrentTimeMillis"></a>
#### getCurrentTimeMillis
Operation documentation: 
		 Warning: this is temporary and subject to future change as soon as long is supported by Jolie.
		

Invocation template: <code>getCurrentTimeMillis@Time( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="getDateDiff"></a>
#### getDateDiff


Invocation template: <code>getDateDiff@Time( request )( response )</code>

**Request type**
<a id="DiffDateRequestType"></a>
Type documentation: no documentation provided 
<pre>type DiffDateRequestType: void {
	.format?: string
	.date2: string
	.date1: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getTimeDiff"></a>
#### getTimeDiff


Invocation template: <code>getTimeDiff@Time( request )( response )</code>

**Request type**
<a id="GetTimeDiffRequest"></a>
Type documentation: no documentation provided 
<pre>type GetTimeDiffRequest: void {
	.time1: string
	.time2: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getTimestampFromString"></a>
#### getTimestampFromString


Invocation template: <code>getTimestampFromString@Time( request )( response )</code>

**Request type**
<a id="GetTimestampFromStringRequest"></a>
Type documentation: no documentation provided 
<pre>type GetTimestampFromStringRequest: string {
	.format?: string
	.language?: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>InvalidTimestamp</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InvalidTimestamp => /* error-handling code */ )</code>


---

<a id="cancelTimeout"></a>
#### cancelTimeout
Operation documentation: 
		 Cancels a timeout from a long-value created from #scheduleTimeout
		

Invocation template: <code>cancelTimeout@Time( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="setNextTimeoutByTime"></a>
#### setNextTimeoutByTime


Invocation template: <code>setNextTimeoutByTime@Time( request )</code>

**Request type**

Type documentation: no documentation provided 






---

<a id="getCurrentDateTime"></a>
#### getCurrentDateTime


Invocation template: <code>getCurrentDateTime@Time( request )( response )</code>

**Request type**
<a id="CurrentDateTimeRequestType"></a>
Type documentation: no documentation provided 
<pre>type CurrentDateTimeRequestType: void {
	.format?: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="sleep"></a>
#### sleep


Invocation template: <code>sleep@Time( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="setNextTimeout"></a>
#### setNextTimeout
Operation documentation: 
		  it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message
		  When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation
		  ( default: timeout )
		

Invocation template: <code>setNextTimeout@Time( request )</code>

**Request type**
<a id="SetNextTimeOutRequest"></a>
Type documentation: no documentation provided 
<pre>type SetNextTimeOutRequest: int {
	.message?: undefined
	.operation?: string
}</pre>





---

<a id="getTimeFromMilliSeconds"></a>
#### getTimeFromMilliSeconds


Invocation template: <code>getTimeFromMilliSeconds@Time( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="TimeValuesType"></a>
Type documentation: no documentation provided 
<pre>type TimeValuesType: void {
	.hour: int
	.minute: int
	.second: int
}</pre>




---

<a id="getDateTimeValues"></a>
#### getDateTimeValues


Invocation template: <code>getDateTimeValues@Time( request )( response )</code>

**Request type**
<a id="GetTimestampFromStringRequest"></a>
Type documentation: no documentation provided 
<pre>type GetTimestampFromStringRequest: string {
	.format?: string
	.language?: string
}</pre>


**Response type**
<a id="DateTimeType"></a>
Type documentation: no documentation provided 
<pre>type DateTimeType: void {
	.month: int
	.hour: int
	.year: int
	.day: int
	.minute: int
	.second: int
}</pre>


**Possible faults thrown**


Fault <code>InvalidDate</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InvalidDate => /* error-handling code */ )</code>


---

<a id="setNextTimeoutByDateTime"></a>
#### setNextTimeoutByDateTime


Invocation template: <code>setNextTimeoutByDateTime@Time( request )</code>

**Request type**

Type documentation: no documentation provided 






---

<a id="getCurrentDateValues"></a>
#### getCurrentDateValues
Operation documentation: 
		 Returns the current date split in three fields: day, month and year
		

Invocation template: <code>getCurrentDateValues@Time( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="DateValuesType"></a>
Type documentation: no documentation provided 
<pre>type DateValuesType: void {
	.month: int
	.year: int
	.day: int
}</pre>




---

<a id="getTimeValues"></a>
#### getTimeValues


Invocation template: <code>getTimeValues@Time( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="TimeValuesType"></a>
Type documentation: no documentation provided 
<pre>type TimeValuesType: void {
	.hour: int
	.minute: int
	.second: int
}</pre>




---





