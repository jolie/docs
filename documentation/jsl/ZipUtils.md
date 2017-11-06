<html>
<head></head><body>
<h1>JolieDoc for Port ZipUtils</h1>
<h2>From file <code>zip_utils.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>ZipUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ZipUtilsInterface">ZipUtilsInterface </a>
</ul>
<hr>
<h2 id=ZipUtilsInterface>Interface ZipUtilsInterface</h2>
<a name="ZipUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#IOException">IOException</a></td>
<td>undefined<br /></td>
<td>undefined<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#readEntry">readEntry</a></td>
<td><a href="#ReadEntryRequest">ReadEntryRequest</a><br /></td>
<td>any<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#unzip">unzip</a></td>
<td><a href="#UnzipRequest">UnzipRequest</a><br /></td>
<td><a href="#UnzipResponse">UnzipResponse</a><br /></td>
<td>
FileNotFound,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#zip">zip</a></td>
<td>ZipRequest<br /></td>
<td>raw<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="zip"></a><h3 id="zip">zip</h3></div>
<pre>zip( <a href="#ZipRequest">ZipRequest</a> )( <a href="#raw">raw</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="IOException"></a><h3 id="IOException">IOException</h3></div>
<pre>IOException( <a href="#undefined">undefined</a> )( <a href="#undefined">undefined</a> )
</pre>
<div class="operation-title"><a name="unzip"></a><h3 id="unzip">unzip</h3></div>
<pre>unzip( <a href="#UnzipRequest">UnzipRequest</a> )( <a href="#UnzipResponse">UnzipResponse</a> )
 throws

				
FileNotFound
</pre>
<div class="operation-title"><a name="readEntry"></a><h3 id="readEntry">readEntry</h3></div>
<pre>readEntry( <a href="#ReadEntryRequest">ReadEntryRequest</a> )( <a href="#any">any</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="ZipRequest"></a><h3 id="ZipRequest">ZipRequest</h3>
<pre lang="jolie">type ZipRequest: undefined</pre>
<a name="IOExceptionType"></a><h3 id="IOExceptionType">IOExceptionType</h3>
<pre lang="jolie">type IOExceptionType: JavaExceptionType</pre>
<a name="UnzipRequest"></a><h3 id="UnzipRequest">UnzipRequest</h3>
<pre lang="jolie">type UnzipRequest: void { 
    .filename: string
    .targetPath: string
}</pre>
<a name="UnzipResponse"></a><h3 id="UnzipResponse">UnzipResponse</h3>
<pre lang="jolie">type UnzipResponse: void { 
    .entry*: string
}</pre>
<a name="ReadEntryRequest"></a><h3 id="ReadEntryRequest">ReadEntryRequest</h3>
<pre lang="jolie">type ReadEntryRequest: void { 
    .entry: string
    .filename: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
