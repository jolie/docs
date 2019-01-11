# Include library: xmpp.iol

Inclusion code: <code>include "xmpp.iol"</code>

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

### Operation Description


#### sendMessage


Invocation template: <code>sendMessage@XMPP( request )( response )</code>

<h4 id="SendMessageRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SendMessageRequest: string {
	.to: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>XMPPException</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( XMPPException => /* error-handling code */ )</code>


---

#### connect


Invocation template: <code>connect@XMPP( request )( response )</code>

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



**Possible faults thrown**


Fault <code>XMPPException</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( XMPPException => /* error-handling code */ )</code>


---





