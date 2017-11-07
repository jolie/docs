<html>
<head></head><body>
<h1>JolieDoc for Port SMTP</h1>
<h2>From file <code>smtp.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>SMTP</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#SMTPInterface">SMTPInterface </a>
</ul>
<hr>
<h2 id=SMTPInterface>Interface SMTPInterface</h2>
<a name="SMTPInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#sendMail">sendMail</a></td>
<td><a href="#SendMailRequest">SendMailRequest</a><br /></td>
<td>void<br /></td>
<td>
SMTPFault,&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="sendMail"></a><h3 id="sendMail">sendMail</h3></div>
<pre>sendMail( <a href="#SendMailRequest">SendMailRequest</a> )( <a href="#void">void</a> )
 throws

				
SMTPFault
</pre>
<hr>
<h2>Message type list</h2>
<a name="SendMailRequest"></a><h3 id="SendMailRequest">SendMailRequest</h3>
<pre lang="jolie">type SendMailRequest: void { 
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
<hr>
<h2>Type list</h2>
</body>
</html>
