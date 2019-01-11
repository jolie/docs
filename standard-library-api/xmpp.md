# Include library: xmpp.iol

Inclusion code: <pre>include "xmpp.iol"</pre>

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
      <td>XMPP</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#XMPPInterface">XMPPInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="XMPPInterface">XMPPInterface</h3>

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
      <td><a href="#sendMessage">sendMessage</a></td>
      <td><a href="#SendMessageRequest">SendMessageRequest</a></td>
      <td>void</td>
      <td>
        XMPPException( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#connect">connect</a></td>
      <td><a href="#ConnectionRequest">ConnectionRequest</a></td>
      <td>void</td>
      <td>
        XMPPException( undefined )
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="sendMessage">sendMessage</h3>


Invocation template: 
<pre>sendMessage@XMPP( request )( response )</pre>

<h4 id="SendMessageRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SendMessageRequest: string {
	.to: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>XMPPException</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( XMPPException => /* error-handling code */ )</pre>




<h3 id="connect">connect</h3>


Invocation template: 
<pre>connect@XMPP( request )( response )</pre>

<h4 id="ConnectionRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ConnectionRequest: void {
	.password: string
	.port?: int
	.resource?: string
	.host?: string
	.serviceName: string
	.username: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>XMPPException</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( XMPPException => /* error-handling code */ )</pre>






