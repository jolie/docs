<html>
<head></head><body>
<h1>JolieDoc for Port XMPP</h1>
<h2>From file <code>xmpp.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>XMPP</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#XMPPInterface">XMPPInterface </a>
</ul>
<hr>
<h2 id=XMPPInterface>Interface XMPPInterface</h2>
<a name="XMPPInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#connect">connect</a></td>
<td><a href="#ConnectionRequest">ConnectionRequest</a><br /></td>
<td>void<br /></td>
<td>
XMPPException,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#sendMessage">sendMessage</a></td>
<td><a href="#SendMessageRequest">SendMessageRequest</a><br /></td>
<td>void<br /></td>
<td>
XMPPException,&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="sendMessage"></a><h3 id="sendMessage">sendMessage</h3></div>
<pre>sendMessage( <a href="#SendMessageRequest">SendMessageRequest</a> )( <a href="#void">void</a> )
 throws

				
XMPPException
</pre>
<div class="operation-title"><a name="connect"></a><h3 id="connect">connect</h3></div>
<pre>connect( <a href="#ConnectionRequest">ConnectionRequest</a> )( <a href="#void">void</a> )
 throws

				
XMPPException
</pre>
<hr>
<h2>Message type list</h2>
<a name="SendMessageRequest"></a><h3 id="SendMessageRequest">SendMessageRequest</h3>
<pre lang="jolie">type SendMessageRequest: string { 
    .to: string
}</pre>
<a name="ConnectionRequest"></a><h3 id="ConnectionRequest">ConnectionRequest</h3>
<pre lang="jolie">type ConnectionRequest: void { 
    .password: string
    .port?: int
    .resource?: string
    .host?: string
    .serviceName: string
    .username: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
