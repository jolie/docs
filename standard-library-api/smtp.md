# Include library: smtp.iol

Inclusion code: <code>include "smtp.iol"</code>

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
      <td>SMTP</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#SMTPInterface">SMTPInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="SMTPInterface">SMTPInterface</h3>

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
      <td><a href="#sendMail">sendMail</a></td>
      <td><a href="#SendMailRequest">SendMailRequest</a></td>
      <td>void</td>
      <td>
        SMTPFault( undefined )
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


#### sendMail


Invocation template: <code>sendMail@SMTP( request )( response )</code>

<h4 id="SendMailRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SendMailRequest: void {
	.cc*: string
	.authenticate?: void {
		.password: string
		.username: string
	}
	.bcc*: string
	.subject: string
	.host: string
	.replyTo*: string
	.from: string
	.to[1,2147483647]: string
	.contentType?: string
	.content: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>SMTPFault</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( SMTPFault => /* error-handling code */ )</code>


---





