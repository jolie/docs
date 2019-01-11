# Include library: exec.iol

Inclusion code: <pre>include "exec.iol"</pre>

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

<h2>Operation Description</h2>



<h3 id="exec">exec</h3>


Invocation template: 
<pre>exec@Exec( request )( response )</pre>

<h4 id="CommandExecutionRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type CommandExecutionRequest: string {
	.args*: string
	.workingDirectory?: string
	.stdOutConsoleEnable?: bool
	.waitFor?: int
}</pre>


<h4 id="CommandExecutionResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type CommandExecutionResult: any {
	.exitCode?: int
	.stderr?: string
}</pre>









