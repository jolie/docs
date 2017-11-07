<html>
<head></head><body>
<h1>JolieDoc for Port JsonUtils</h1>
<h2>From file <code>json_utils.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>JsonUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#JsonUtilsInterface">JsonUtilsInterface </a>
</ul>
<hr>
<h2 id=JsonUtilsInterface>Interface JsonUtilsInterface</h2>
<a name="JsonUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#getJsonString">getJsonString</a></td>
<td>GetJsonStringRequest<br /></td>
<td>GetJsonStringResponse<br /></td>
<td>
JSONCreationError,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getJsonValue">getJsonValue</a></td>
<td><a href="#GetJsonValueRequest">GetJsonValueRequest</a><br /></td>
<td>GetJsonValueResponse<br /></td>
<td>
JSONCreationError,&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="getJsonString"></a><h3 id="getJsonString">getJsonString</h3></div>
<pre>getJsonString( <a href="#GetJsonStringRequest">GetJsonStringRequest</a> )( <a href="#GetJsonStringResponse">GetJsonStringResponse</a> )
 throws

				
JSONCreationError
</pre>
<span class="opdoc"><p>Returns the value converted into a JSON string<br>	 <br>	  Each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets converted recursively</p></span>
<div class="operation-title"><a name="getJsonValue"></a><h3 id="getJsonValue">getJsonValue</h3></div>
<pre>getJsonValue( <a href="#GetJsonValueRequest">GetJsonValueRequest</a> )( <a href="#GetJsonValueResponse">GetJsonValueResponse</a> )
 throws

				
JSONCreationError
</pre>
<span class="opdoc"><p>Returns the JSON string converted into a value<br>	 <br>	  Each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest gets converted recursively</p></span>
<hr>
<h2>Message type list</h2>
<a name="GetJsonStringRequest"></a><h3 id="GetJsonStringRequest">GetJsonStringRequest</h3>
<pre lang="jolie">type GetJsonStringRequest: undefined</pre>
<a name="GetJsonStringResponse"></a><h3 id="GetJsonStringResponse">GetJsonStringResponse</h3>
<pre lang="jolie">type GetJsonStringResponse: string</pre>
<a name="GetJsonValueRequest"></a><h3 id="GetJsonValueRequest">GetJsonValueRequest</h3>
<pre lang="jolie">type GetJsonValueRequest: any { 
    .strictEncoding?: bool
    .charset?: string
}</pre>
<a name="GetJsonValueResponse"></a><h3 id="GetJsonValueResponse">GetJsonValueResponse</h3>
<pre lang="jolie">type GetJsonValueResponse: undefined</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
