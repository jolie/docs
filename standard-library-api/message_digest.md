# Include library: message_digest.iol

Inclusion code: <pre>include "message_digest.iol"</pre>

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
      <td>MessageDigest</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#MessageDigestInterface">MessageDigestInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="MessageDigestInterface">MessageDigestInterface</h3>

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
      <td><a href="#md5">md5</a></td>
      <td><a href="#MD5Request">MD5Request</a></td>
      <td>string</td>
      <td>
        UnsupportedOperation( <a href="#JavaExceptionType">JavaExceptionType</a> )
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="md5">md5</h3>



Invocation template: <pre>md5@MessageDigest( request )( response )</pre>

<h4 id="MD5Request">Request type</h4>

Type documentation: no documentation provided 
<pre>type MD5Request: string {
	.radix?: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 




**Possible faults thrown**



Fault <code>UnsupportedOperation</code> with type <code>JavaExceptionType</code>

Fault-handling install template: <code>install ( UnsupportedOperation => /* error-handling code */ )</code>
<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>






