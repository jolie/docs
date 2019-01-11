# Include library: time.iol

Inclusion code: <pre>include "time.iol"</pre>

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

<h2>Operation Description</h2>



<h3 id="scheduleTimeout">scheduleTimeout</h3>

Operation documentation: 
		 Schedules a timeout, which can be cancelled using #cancelTimeout from the returned string. Default .timeunit value is MILLISECONDS, .operation default is "timeout".
		


Invocation template: 
<pre>scheduleTimeout@Time( request )( response )</pre>

<h4 id="ScheduleTimeOutRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ScheduleTimeOutRequest: int {
	.message?: undefined
	.operation?: string
	.timeunit?: string
}</pre>


<h4>Response type</h4>

Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>InvalidTimeUnit</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( InvalidTimeUnit => /* error-handling code */ )</pre>




<h3 id="getDateValues">getDateValues</h3>

Operation documentation: 
		 Converts an input string into a date expressed by means of
		 three elements: day, month and year. The request may specify the
		 date parsing format. See #DateValuesRequestType for details.
		


Invocation template: 
<pre>getDateValues@Time( request )( response )</pre>

<h4 id="DateValuesRequestType">Request type</h4>

Type documentation: no documentation provided 
<pre>type DateValuesRequestType: string {
	.format?: string
}</pre>


<h4 id="DateValuesType">Response type</h4>

Type documentation: no documentation provided 
<pre>type DateValuesType: void {
	.month: int
	.year: int
	.day: int
}</pre>



<h4>Possible faults thrown</h4>



Fault <code>InvalidDate</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( InvalidDate => /* error-handling code */ )</pre>




<h3 id="getDateTime">getDateTime</h3>

Operation documentation: 
		 It returns a date time in a string format starting from a timestamp
		


Invocation template: 
<pre>getDateTime@Time( request )( response )</pre>

<h4 id="GetDateTimeRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetDateTimeRequest: long {
	.format?: string
}</pre>


<h4 id="GetDateTimeResponse">Response type</h4>

Type documentation: no documentation provided 
<pre>type GetDateTimeResponse: string {
	.month: int
	.hour: int
	.year: int
	.day: int
	.minute: int
	.second: int
}</pre>







<h3 id="getCurrentTimeMillis">getCurrentTimeMillis</h3>

Operation documentation: 
		 Warning: this is temporary and subject to future change as soon as long is supported by Jolie.
		


Invocation template: 
<pre>getCurrentTimeMillis@Time( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>

Type documentation: no documentation provided 








<h3 id="getDateDiff">getDateDiff</h3>


Invocation template: 
<pre>getDateDiff@Time( request )( response )</pre>

<h4 id="DiffDateRequestType">Request type</h4>

Type documentation: no documentation provided 
<pre>type DiffDateRequestType: void {
	.format?: string
	.date2: string
	.date1: string
}</pre>


<h4>Response type</h4>

Type documentation: no documentation provided 








<h3 id="getTimeDiff">getTimeDiff</h3>


Invocation template: 
<pre>getTimeDiff@Time( request )( response )</pre>

<h4 id="GetTimeDiffRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetTimeDiffRequest: void {
	.time1: string
	.time2: string
}</pre>


<h4>Response type</h4>

Type documentation: no documentation provided 








<h3 id="getTimestampFromString">getTimestampFromString</h3>


Invocation template: 
<pre>getTimestampFromString@Time( request )( response )</pre>

<h4 id="GetTimestampFromStringRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetTimestampFromStringRequest: string {
	.format?: string
	.language?: string
}</pre>


<h4>Response type</h4>

Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>InvalidTimestamp</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( InvalidTimestamp => /* error-handling code */ )</pre>




<h3 id="cancelTimeout">cancelTimeout</h3>

Operation documentation: 
		 Cancels a timeout from a long-value created from #scheduleTimeout
		


Invocation template: 
<pre>cancelTimeout@Time( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>

Type documentation: no documentation provided 








<h3 id="setNextTimeoutByTime">setNextTimeoutByTime</h3>


Invocation template: 
<pre>setNextTimeoutByTime@Time( request )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 








<h3 id="getCurrentDateTime">getCurrentDateTime</h3>


Invocation template: 
<pre>getCurrentDateTime@Time( request )( response )</pre>

<h4 id="CurrentDateTimeRequestType">Request type</h4>

Type documentation: no documentation provided 
<pre>type CurrentDateTimeRequestType: void {
	.format?: string
}</pre>


<h4>Response type</h4>

Type documentation: no documentation provided 








<h3 id="sleep">sleep</h3>


Invocation template: 
<pre>sleep@Time( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>

Type documentation: no documentation provided 








<h3 id="setNextTimeout">setNextTimeout</h3>

Operation documentation: 
		  it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message
		  When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation
		  ( default: timeout )
		


Invocation template: 
<pre>setNextTimeout@Time( request )</pre>

<h4 id="SetNextTimeOutRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SetNextTimeOutRequest: int {
	.message?: undefined
	.operation?: string
}</pre>







<h3 id="getTimeFromMilliSeconds">getTimeFromMilliSeconds</h3>


Invocation template: 
<pre>getTimeFromMilliSeconds@Time( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4 id="TimeValuesType">Response type</h4>

Type documentation: no documentation provided 
<pre>type TimeValuesType: void {
	.hour: int
	.minute: int
	.second: int
}</pre>







<h3 id="getDateTimeValues">getDateTimeValues</h3>


Invocation template: 
<pre>getDateTimeValues@Time( request )( response )</pre>

<h4 id="GetTimestampFromStringRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetTimestampFromStringRequest: string {
	.format?: string
	.language?: string
}</pre>


<h4 id="DateTimeType">Response type</h4>

Type documentation: no documentation provided 
<pre>type DateTimeType: void {
	.month: int
	.hour: int
	.year: int
	.day: int
	.minute: int
	.second: int
}</pre>



<h4>Possible faults thrown</h4>



Fault <code>InvalidDate</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( InvalidDate => /* error-handling code */ )</pre>




<h3 id="setNextTimeoutByDateTime">setNextTimeoutByDateTime</h3>


Invocation template: 
<pre>setNextTimeoutByDateTime@Time( request )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 








<h3 id="getCurrentDateValues">getCurrentDateValues</h3>

Operation documentation: 
		 Returns the current date split in three fields: day, month and year
		


Invocation template: 
<pre>getCurrentDateValues@Time( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4 id="DateValuesType">Response type</h4>

Type documentation: no documentation provided 
<pre>type DateValuesType: void {
	.month: int
	.year: int
	.day: int
}</pre>







<h3 id="getTimeValues">getTimeValues</h3>


Invocation template: 
<pre>getTimeValues@Time( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4 id="TimeValuesType">Response type</h4>

Type documentation: no documentation provided 
<pre>type TimeValuesType: void {
	.hour: int
	.minute: int
	.second: int
}</pre>









