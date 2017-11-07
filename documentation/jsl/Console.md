<html>
<head></head><body>
<h1>JolieDoc for Port Console</h1>
<h2>From file <code>console.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Console</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ConsoleInterface">ConsoleInterface </a>
</ul>
<hr>
<h2 id=ConsoleInterface>Interface ConsoleInterface</h2>
<a name="ConsoleInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#enableTimestamp">enableTimestamp</a></td>
<td><a href="#EnableTimestampRequest">EnableTimestampRequest</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#print">print</a></td>
<td>undefined<br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#println">println</a></td>
<td>undefined<br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#registerForInput">registerForInput</a></td>
<td><a href="#RegisterForInputRequest">RegisterForInputRequest</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#subscribeSessionListener">subscribeSessionListener</a></td>
<td><a href="#SubscribeSessionListener">SubscribeSessionListener</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#unsubscribeSessionListener">unsubscribeSessionListener</a></td>
<td><a href="#UnsubscribeSessionListener">UnsubscribeSessionListener</a><br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="print"></a><h3 id="print">print</h3></div>
<pre>print( <a href="#undefined">undefined</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="println"></a><h3 id="println">println</h3></div>
<pre>println( <a href="#undefined">undefined</a> )( <a href="#void">void</a> )
</pre>
<div class="operation-title"><a name="registerForInput"></a><h3 id="registerForInput">registerForInput</h3></div>
<pre>registerForInput( <a href="#RegisterForInputRequest">RegisterForInputRequest</a> )( <a href="#void">void</a> )
</pre>
<span class="opdoc"><p>it enables the console for input listening<br>	  parameter enableSessionListener enables console input listening for more than one service session (default=false)</p></span>
<div class="operation-title"><a name="unsubscribeSessionListener"></a><h3 id="unsubscribeSessionListener">unsubscribeSessionListener</h3></div>
<pre>unsubscribeSessionListener( <a href="#UnsubscribeSessionListener">UnsubscribeSessionListener</a> )( <a href="#void">void</a> )
</pre>
<span class="opdoc"><p>it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation</p></span>
<div class="operation-title"><a name="subscribeSessionListener"></a><h3 id="subscribeSessionListener">subscribeSessionListener</h3></div>
<pre>subscribeSessionListener( <a href="#SubscribeSessionListener">SubscribeSessionListener</a> )( <a href="#void">void</a> )
</pre>
<span class="opdoc"><p>it receives a token string which identifies a service session.<br>	 it enables the session to receive inputs from the console</p></span>
<div class="operation-title"><a name="enableTimestamp"></a><h3 id="enableTimestamp">enableTimestamp</h3></div>
<pre>enableTimestamp( <a href="#EnableTimestampRequest">EnableTimestampRequest</a> )( <a href="#void">void</a> )
</pre>
<span class="opdoc"><p>It enables timestamp inline printing for each console output operation call: print, println<br>		Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.</p></span>
<hr>
<h2>Message type list</h2>
<a name="RegisterForInputRequest"></a><h3 id="RegisterForInputRequest">RegisterForInputRequest</h3>
<pre lang="jolie">type RegisterForInputRequest: void { 
    .enableSessionListener?: bool
}</pre>
<a name="UnsubscribeSessionListener"></a><h3 id="UnsubscribeSessionListener">UnsubscribeSessionListener</h3>
<pre lang="jolie">type UnsubscribeSessionListener: void { 
    .token: string
}</pre>
<a name="SubscribeSessionListener"></a><h3 id="SubscribeSessionListener">SubscribeSessionListener</h3>
<pre lang="jolie">type SubscribeSessionListener: void { 
    .token: string
}</pre>
<a name="EnableTimestampRequest"></a><h3 id="EnableTimestampRequest">EnableTimestampRequest</h3>
<pre lang="jolie">type EnableTimestampRequest: bool { 
    .format?: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
