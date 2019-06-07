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
  <tbody><tr><td>Exec documentation: </td></tr>
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

Interface documentation: 

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

Operation documentation: 


Invocation template: 
<pre>exec@Exec( request )( response )</pre>

<h4 id="CommandExecutionRequest">Request type</h4>

Type: CommandExecutionRequest


<pre>type CommandExecutionRequest: string {
	.args*: string
	.workingDirectory?: string
	.stdOutConsoleEnable?: bool
	.waitFor?: int
}</pre>

<code>CommandExecutionRequest : string</code> 

<ul>

  <li><code>args : string</code> 
</li>

  <li><code>workingDirectory : string</code> 
</li>

  <li><code>stdOutConsoleEnable : bool</code> 
</li>

  <li><code>waitFor : int</code> 
</li>

</ul>



<h4 id="CommandExecutionResult">Response type</h4>

Type: CommandExecutionResult


<pre>type CommandExecutionResult: any {
	.exitCode?: int
	.stderr?: string
}</pre>

<code>CommandExecutionResult : any</code> 

<ul>

  <li><code>exitCode : int</code> 
</li>

  <li><code>stderr : string</code> 
</li>

</ul>










