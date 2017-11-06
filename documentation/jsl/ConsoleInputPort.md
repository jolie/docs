<html>
<head></head><body>
<h1>JolieDoc for Port ConsoleInputPort</h1>
<h2>From file <code>console.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>ConsoleInputPort</td>
<td>local</td>
<td>null</td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ConsoleInputInterface">ConsoleInputInterface </a>
</ul>
<hr>
<h2 id=ConsoleInputInterface>Interface ConsoleInputInterface</h2>
<a name="ConsoleInputInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#in">in</a></td>
<td><a href="#InRequest">InRequest</a><br /></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="in"></a><h3 id="in">in</h3></div>
<p><pre>in( <a href="#InRequest">InRequest</a> )</pre></p>
<hr>
<h2>Message type list</h2>
<a name="InRequest"></a><h3 id="InRequest">InRequest</h3>
<pre lang="jolie">type InRequest: string { 
    .token?: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
