<html>
<head></head><body>
<h1>JolieDoc for Port Converter</h1>
<h2>From file <code>converter.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Converter</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ConverterInterface">ConverterInterface </a>
</ul>
<hr>
<h2 id=ConverterInterface>Interface ConverterInterface</h2>
<a name="ConverterInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#base64ToRaw">base64ToRaw</a></td>
<td>string<br /></td>
<td>raw<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#rawToBase64">rawToBase64</a></td>
<td>raw<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#rawToString">rawToString</a></td>
<td><a href="#RawToStringRequest">RawToStringRequest</a><br /></td>
<td>string<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#stringToRaw">stringToRaw</a></td>
<td><a href="#StringToRawRequest">StringToRawRequest</a><br /></td>
<td>raw<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="stringToRaw"></a><h3 id="stringToRaw">stringToRaw</h3></div>
<pre>stringToRaw( <a href="#StringToRawRequest">StringToRawRequest</a> )( <a href="#raw">raw</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="base64ToRaw"></a><h3 id="base64ToRaw">base64ToRaw</h3></div>
<pre>base64ToRaw( <a href="#string">string</a> )( <a href="#raw">raw</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="rawToBase64"></a><h3 id="rawToBase64">rawToBase64</h3></div>
<pre>rawToBase64( <a href="#raw">raw</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="rawToString"></a><h3 id="rawToString">rawToString</h3></div>
<pre>rawToString( <a href="#RawToStringRequest">RawToStringRequest</a> )( <a href="#string">string</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="StringToRawRequest"></a><h3 id="StringToRawRequest">StringToRawRequest</h3>
<pre lang="jolie">type StringToRawRequest: string { 
    .charset?: string
}</pre>
<a name="IOExceptionType"></a><h3 id="IOExceptionType">IOExceptionType</h3>
<pre lang="jolie">type IOExceptionType: JavaExceptionType</pre>
<a name="RawToStringRequest"></a><h3 id="RawToStringRequest">RawToStringRequest</h3>
<pre lang="jolie">type RawToStringRequest: raw { 
    .charset?: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
