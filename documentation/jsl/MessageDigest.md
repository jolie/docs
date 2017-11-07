<html>
<head></head><body>
<h1>JolieDoc for Port MessageDigest</h1>
<h2>From file <code>message_digest.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>MessageDigest</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#MessageDigestInterface">MessageDigestInterface </a>
</ul>
<hr>
<h2 id=MessageDigestInterface>Interface MessageDigestInterface</h2>
<a name="MessageDigestInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#md5">md5</a></td>
<td><a href="#MD5Request">MD5Request</a><br /></td>
<td>string<br /></td>
<td>
UnsupportedOperation( <a href="#JavaExceptionType">JavaExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="md5"></a><h3 id="md5">md5</h3></div>
<pre>md5( <a href="#MD5Request">MD5Request</a> )( <a href="#string">string</a> )
 throws

				
UnsupportedOperation( <a href="#JavaExceptionType">JavaExceptionType</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="MD5Request"></a><h3 id="MD5Request">MD5Request</h3>
<pre lang="jolie">type MD5Request: string { 
    .radix?: int
}</pre>
<a name="JavaExceptionType"></a><h3 id="JavaExceptionType">JavaExceptionType</h3>
<pre lang="jolie">type JavaExceptionType: string { 
    .stackTrace: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
