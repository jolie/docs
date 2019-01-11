# Include library: console.iol

Inclusion code: <code>include "console.iol"</code>

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

### Operation Description



#### in


Invocation template: <code>in( request )</code>

<h4 id="InRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type InRequest: string {
	.token?: string
}</pre>





<hr>





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

### Operation Description



#### print


Invocation template: <code>print@Console( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>


#### println


Invocation template: <code>println@Console( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>


#### registerForInput
Operation documentation: 
	  it enables the console for input listening
	  parameter enableSessionListener enables console input listening for more than one service session (default=false)
	

Invocation template: <code>registerForInput@Console( request )( response )</code>

<h4 id="RegisterForInputRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type RegisterForInputRequest: void {
	.enableSessionListener?: bool
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>


#### unsubscribeSessionListener
Operation documentation: 
	 it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation
	

Invocation template: <code>unsubscribeSessionListener@Console( request )( response )</code>

<h4 id="UnsubscribeSessionListener">Request type</h4>

Type documentation: no documentation provided 
<pre>type UnsubscribeSessionListener: void {
	.token: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>


#### subscribeSessionListener
Operation documentation: 
	 it receives a token string which identifies a service session.
	 it enables the session to receive inputs from the console
	

Invocation template: <code>subscribeSessionListener@Console( request )( response )</code>

<h4 id="SubscribeSessionListener">Request type</h4>

Type documentation: no documentation provided 
<pre>type SubscribeSessionListener: void {
	.token: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>


#### enableTimestamp
Operation documentation: 
		It enables timestamp inline printing for each console output operation call: print, println
		Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.
	

Invocation template: <code>enableTimestamp@Console( request )( response )</code>

<h4 id="EnableTimestampRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type EnableTimestampRequest: bool {
	.format?: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





<hr>





