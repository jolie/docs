# Service JsonUtils

> from json-utils import JsonUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#JsonUtilsInterface'>JsonUtilsInterface</a> |

### List of Available Interfaces

### JsonUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| getJsonString | <a href="#GetJsonStringRequest">GetJsonStringRequest</a> | <a href='#GetJsonStringResponse'>GetJsonStringResponse</a> | <details><summary>JSONCreationError</summary>undefined)</details> | <br>	  Returns the value converted into a JSON string<br>	 <br>	  Each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets converted recursively<br>	  |
| getJsonValue | <a href="#GetJsonValueRequest">GetJsonValueRequest</a> | <a href='#GetJsonValueResponse'>GetJsonValueResponse</a> | <details><summary>JSONCreationError</summary>undefined)</details> | <br>	  Returns the JSON string converted into a value<br>	 <br>	  Each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest gets converted recursively<br>	  |


### Types

<details>
<summary><span id="GetJsonStringRequest">GetJsonStringRequest: 
</span>
</summary>

##### Type Declaration
<pre>
undefined
</pre>
</details>
<details>
<summary><span id="GetJsonStringResponse">GetJsonStringResponse: 
</span>
</summary>

##### Type Declaration
<pre>
string
</pre>
</details>
<details>
<summary><span id="GetJsonValueRequest">GetJsonValueRequest: 
</span>
</summary>

##### Type Declaration
<pre>
any &#123;
&nbsp;&nbsp;strictEncoding[0,1]: bool // 
&nbsp;&nbsp;charset[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetJsonValueResponse">GetJsonValueResponse: 
</span>
</summary>

##### Type Declaration
<pre>
undefined
</pre>
</details>
