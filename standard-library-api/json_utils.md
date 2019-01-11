# Include library: json_utils.iol

Inclusion code: <code>include "json_utils.iol"</code>

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
      <td>JsonUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#JsonUtilsInterface">JsonUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="JsonUtilsInterface">JsonUtilsInterface</h3>

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
      <td><a href="#getJsonString">getJsonString</a></td>
      <td><a href="#GetJsonStringRequest">GetJsonStringRequest</a></td>
      <td><a href="#GetJsonStringResponse">GetJsonStringResponse</a></td>
      <td>
        JSONCreationError( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#getJsonValue">getJsonValue</a></td>
      <td><a href="#GetJsonValueRequest">GetJsonValueRequest</a></td>
      <td><a href="#GetJsonValueResponse">GetJsonValueResponse</a></td>
      <td>
        JSONCreationError( undefined )
      </td>
    </tr>
  </tbody>
</table>

### Operation Description



#### getJsonString
Operation documentation: 
	  Returns the value converted into a JSON string
	 
	  Each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets converted recursively
	 

Invocation template: <code>getJsonString@JsonUtils( request )( response )</code>

<h4 id="GetJsonStringRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetJsonStringRequest: undefined</pre>


<h4 id="GetJsonStringResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type GetJsonStringResponse: string</pre>


**Possible faults thrown**


Fault <code>JSONCreationError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( JSONCreationError => /* error-handling code */ )</code>




#### getJsonValue
Operation documentation: 
	  Returns the JSON string converted into a value
	 
	  Each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest gets converted recursively
	 

Invocation template: <code>getJsonValue@JsonUtils( request )( response )</code>

<h4 id="GetJsonValueRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetJsonValueRequest: any {
	.strictEncoding?: bool
	.charset?: string
}</pre>


<h4 id="GetJsonValueResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type GetJsonValueResponse: undefined</pre>


**Possible faults thrown**


Fault <code>JSONCreationError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( JSONCreationError => /* error-handling code */ )</code>




<h4>Subtypes</h4>


<a id="GetJsonStringRequest"></a>
GetJsonStringRequest

<pre>type GetJsonStringRequest: undefined</pre>

<a id="GetJsonValueResponse"></a>
GetJsonValueResponse

<pre>type GetJsonValueResponse: undefined</pre>




