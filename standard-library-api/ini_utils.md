# Include library: ini_utils.iol

Inclusion code: <pre>include "ini_utils.iol"</pre>

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

<h2>Operation Description</h2>



<h3 id="parseIniFile">parseIniFile</h3>


Invocation template: 
<pre>parseIniFile@IniUtils( request )( response )</pre>

<h4 id="parseIniFileRequest">Request type</h4>

Type: parseIniFileRequest

Type documentation: no documentation provided 
<pre>type parseIniFileRequest: string {
	.charset?: string
}</pre>


<h4 id="IniData">Response type</h4>

Type: IniData

Type documentation: no documentation provided 
<pre>type IniData: undefined</pre>









