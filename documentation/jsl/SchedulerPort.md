<html>
<head></head><body>
<h1>JolieDoc for Port SchedulerPort</h1>
<h2>From file <code>scheduler.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>SchedulerPort</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#SchedulerInterface">SchedulerInterface </a>
</ul>
<hr>
<h2 id=SchedulerInterface>Interface SchedulerInterface</h2>
<a name="SchedulerInterface"></a>
Configure the schedule in chron style string
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#setDailySchedule">setDailySchedule</a></td>
<td><a href="#DailyScheduleReq">DailyScheduleReq</a><br /></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</tr>
<tr>
<td><a href="#setSchedule">setSchedule</a></td>
<td><a href="#ScheduleReq">ScheduleReq</a><br /></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="setSchedule"></a><h3 id="setSchedule">setSchedule</h3></div>
<p><pre>setSchedule( <a href="#ScheduleReq">ScheduleReq</a> )</pre></p>
<div class="operation-title"><a name="setDailySchedule"></a><h3 id="setDailySchedule">setDailySchedule</h3></div>
<p><pre>setDailySchedule( <a href="#DailyScheduleReq">DailyScheduleReq</a> )</pre></p>
<hr>
<h2>Message type list</h2>
<a name="ScheduleReq"></a><h3 id="ScheduleReq">ScheduleReq</h3>
<pre lang="jolie">type ScheduleReq: void { 
    .period: int
    .format?: string
    .operation?: string
    .start_date: FullDate
}</pre>
<a name="DailyScheduleReq"></a><h3 id="DailyScheduleReq">DailyScheduleReq</h3>
<pre lang="jolie">type DailyScheduleReq: void { 
    .start_hour: int
    .operation?: string
    .start_min?: int
}</pre>
<hr>
<h2>Type list</h2>
<h3 id="FullDate">FullDate</h3>
<a name="FullDate"></a>
<pre lang="jolie">type FullDate: void { 
    .sec: int
    .min: int
    .hour: int
    .month: int
    .year: int
    .msec: int
    .day: int
}</pre>
</body>
</html>
