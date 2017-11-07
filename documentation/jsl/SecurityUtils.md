<html>
<head></head><body>
<h1>JolieDoc for Port SecurityUtils</h1>
<h2>From file <code>security_utils.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>SecurityUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#SecurityUtilsInterface">SecurityUtilsInterface </a>
</ul>
<hr>
<h2 id=SecurityUtilsInterface>Interface SecurityUtilsInterface</h2>
<a name="SecurityUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#createSecureToken">createSecureToken</a></td>
<td>void<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#secureRandom">secureRandom</a></td>
<td><a href="#SecureRandomRequest">SecureRandomRequest</a><br /></td>
<td>raw<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="secureRandom"></a><h3 id="secureRandom">secureRandom</h3></div>
<pre>secureRandom( <a href="#SecureRandomRequest">SecureRandomRequest</a> )( <a href="#raw">raw</a> )
</pre>
<div class="operation-title"><a name="createSecureToken"></a><h3 id="createSecureToken">createSecureToken</h3></div>
<pre>createSecureToken( <a href="#void">void</a> )( <a href="#string">string</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="SecureRandomRequest"></a><h3 id="SecureRandomRequest">SecureRandomRequest</h3>
<pre lang="jolie">type SecureRandomRequest: void { 
    .size: int
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
