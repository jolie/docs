# Include library: console.iol

Inclusion code: <pre>include "console.iol"</pre>

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
      <td>ConsoleInputPort</td>
      <td>local</td>
      <td>-</td>
      <td><a href="#ConsoleInputInterface">ConsoleInputInterface</a></td>
    </tr>
    <tr>
      <td>Console</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#ConsoleInterface">ConsoleInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="ConsoleInputInterface">ConsoleInputInterface</h3>

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
      <td><a href="#in">in</a></td>
      <td><a href="#InRequest">InRequest</a></td>
      <td> - </td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="in">in</h4>



Invocation template: <pre>in( request )</pre>

<h4 id="InRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type InRequest: string {
	.token?: string
}</pre>











<h3 id="ConsoleInterface">ConsoleInterface</h3>

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
      <td><a href="#print">print</a></td>
      <td>undefined</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#println">println</a></td>
      <td>undefined</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#registerForInput">registerForInput</a></td>
      <td><a href="#RegisterForInputRequest">RegisterForInputRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#unsubscribeSessionListener">unsubscribeSessionListener</a></td>
      <td><a href="#UnsubscribeSessionListener">UnsubscribeSessionListener</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#subscribeSessionListener">subscribeSessionListener</a></td>
      <td><a href="#SubscribeSessionListener">SubscribeSessionListener</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#enableTimestamp">enableTimestamp</a></td>
      <td><a href="#EnableTimestampRequest">EnableTimestampRequest</a></td>
      <td>void</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="print">print</h4>



Invocation template: <pre>print@Console( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="println">println</h4>



Invocation template: <pre>println@Console( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="registerForInput">registerForInput</h4>
Operation documentation: 
	  it enables the console for input listening
	  parameter enableSessionListener enables console input listening for more than one service session (default=false)
	


Invocation template: <pre>registerForInput@Console( request )( response )</pre>

<h4 id="RegisterForInputRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type RegisterForInputRequest: void {
	.enableSessionListener?: bool
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="unsubscribeSessionListener">unsubscribeSessionListener</h4>
Operation documentation: 
	 it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation
	


Invocation template: <pre>unsubscribeSessionListener@Console( request )( response )</pre>

<h4 id="UnsubscribeSessionListener">Request type</h4>

Type documentation: no documentation provided 
<pre>type UnsubscribeSessionListener: void {
	.token: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="subscribeSessionListener">subscribeSessionListener</h4>
Operation documentation: 
	 it receives a token string which identifies a service session.
	 it enables the session to receive inputs from the console
	


Invocation template: <pre>subscribeSessionListener@Console( request )( response )</pre>

<h4 id="SubscribeSessionListener">Request type</h4>

Type documentation: no documentation provided 
<pre>type SubscribeSessionListener: void {
	.token: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="enableTimestamp">enableTimestamp</h4>
Operation documentation: 
		It enables timestamp inline printing for each console output operation call: print, println
		Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.
	


Invocation template: <pre>enableTimestamp@Console( request )( response )</pre>

<h4 id="EnableTimestampRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type EnableTimestampRequest: bool {
	.format?: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 











