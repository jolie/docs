# Include library: ini_utils.iol

Inclusion code: <code>include "ini_utils.iol"</code>

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
      <td>IniUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#IniUtilsInterface">IniUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="IniUtilsInterface">IniUtilsInterface</h3>

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
      <td><a href="#parseIniFile">parseIniFile</a></td>
      <td><a href="#parseIniFileRequest">parseIniFileRequest</a></td>
      <td><a href="#IniData">IniData</a></td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="parseIniFile"></a>
#### parseIniFile


Invocation template: <code>parseIniFile@IniUtils( request )( response )</code>

**Request type**
<a id="parseIniFileRequest"></a>
Type documentation: no documentation provided 
<pre>type parseIniFileRequest: string {
	.charset?: string
}</pre>


**Response type**
<a id="IniData"></a>
Type documentation: no documentation provided 
<pre>type IniData: undefined</pre>




---





