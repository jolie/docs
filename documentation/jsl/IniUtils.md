<html>
<head></head><body>
<h1>JolieDoc for Port IniUtils</h1>
<h2>From file <code>ini_utils.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>IniUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#IniUtilsInterface">IniUtilsInterface </a>
</ul>
<hr>
<h2 id=IniUtilsInterface>Interface IniUtilsInterface</h2>
<a name="IniUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#parseIniFile">parseIniFile</a></td>
<td><a href="#parseIniFileRequest">parseIniFileRequest</a><br /></td>
<td>IniData<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="parseIniFile"></a><h3 id="parseIniFile">parseIniFile</h3></div>
<pre>parseIniFile( <a href="#parseIniFileRequest">parseIniFileRequest</a> )( <a href="#IniData">IniData</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="parseIniFileRequest"></a><h3 id="parseIniFileRequest">parseIniFileRequest</h3>
<pre lang="jolie">type parseIniFileRequest: string { 
    .charset?: string
}</pre>
<a name="IniData"></a><h3 id="IniData">IniData</h3>
<pre lang="jolie">type IniData: undefined</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
