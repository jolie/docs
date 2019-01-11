# Include library: exec.iol

Inclusion code: <code>include "exec.iol"</code>

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
      <td>Exec</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#ExecInterface">ExecInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="ExecInterface">ExecInterface</h3>

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
      <td><a href="#exec">exec</a></td>
      <td><a href="#CommandExecutionRequest">CommandExecutionRequest</a></td>
      <td><a href="#CommandExecutionResult">CommandExecutionResult</a></td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="exec"></a>
#### exec


Invocation template: <code>exec@Exec( request )( response )</code>

**Request type**
<a id="CommandExecutionRequest"></a>
Type documentation: no documentation provided 
<pre>type CommandExecutionRequest: string {
	.args*: string
	.workingDirectory?: string
	.stdOutConsoleEnable?: bool
	.waitFor?: int
}</pre>


**Response type**
<a id="CommandExecutionResult"></a>
Type documentation: no documentation provided 
<pre>type CommandExecutionResult: any {
	.exitCode?: int
	.stderr?: string
}</pre>




---





