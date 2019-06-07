# Include library: smtp.iol

Inclusion code: <pre>include "smtp.iol"</pre>

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
  <tbody><tr><td>SMTP documentation: </td></tr>
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

Interface documentation: 

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

<h2>Operation Description</h2>



<h3 id="sendMail">sendMail</h3>

Operation documentation: 


Invocation template: 
<pre>sendMail@SMTP( request )( response )</pre>

<h4 id="SendMailRequest">Request type</h4>

Type: SendMailRequest


<pre>type SendMailRequest: void {
	.cc*: string
	.authenticate?: void {
		.password: string
		.username: string
	}
	.bcc*: string
	.attachment*: void {
		.filename: string
		.contentType: string
		.content: raw
	}
	.subject: string
	.host: string
	.replyTo*: string
	.from: string
	.to[1,2147483647]: string
	.contentType?: string
	.content: string
}</pre>

<code>SendMailRequest : void</code> 

<ul>

  <li><code>cc : string</code> 
</li>

  <li><code>authenticate : void</code> 

<ul>

  <li><code>password : string</code> 
</li>

  <li><code>username : string</code> 
</li>

</ul>
</li>

  <li><code>bcc : string</code> 
</li>

  <li><code>attachment : void</code> 

<ul>

  <li><code>filename : string</code> 
</li>

  <li><code>contentType : string</code> 
</li>

  <li><code>content : raw</code> 
</li>

</ul>
</li>

  <li><code>subject : string</code> 
</li>

  <li><code>host : string</code> 
</li>

  <li><code>replyTo : string</code> 
</li>

  <li><code>from : string</code> 
</li>

  <li><code>to : string</code> 
</li>

  <li><code>contentType : string</code> 
</li>

  <li><code>content : string</code> 
</li>

</ul>



<h4>Response type</h4>

Type: void




<code>void : void</code> 




<h4>Possible faults thrown</h4>


Fault <code>SMTPFault</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( SMTPFault => /* error-handling code */ )</pre>






