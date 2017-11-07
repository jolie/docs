<html>
<head></head><body>
<h1>JolieDoc for Port Exec</h1>
<h2>From file <code>exec.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Exec</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ExecInterface">ExecInterface </a>
</ul>
<hr>
<h2 id=ExecInterface>Interface ExecInterface</h2>
<a name="ExecInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#exec">exec</a></td>
<td><a href="#CommandExecutionRequest">CommandExecutionRequest</a><br /></td>
<td><a href="#CommandExecutionResult">CommandExecutionResult</a><br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="exec"></a><h3 id="exec">exec</h3></div>
<pre>exec( <a href="#CommandExecutionRequest">CommandExecutionRequest</a> )( <a href="#CommandExecutionResult">CommandExecutionResult</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="CommandExecutionRequest"></a><h3 id="CommandExecutionRequest">CommandExecutionRequest</h3>
<pre lang="jolie">type CommandExecutionRequest: string { 
    .args*: string
    .workingDirectory?: string
    .stdOutConsoleEnable?: bool
    .waitFor?: int
}</pre>
<a name="CommandExecutionResult"></a><h3 id="CommandExecutionResult">CommandExecutionResult</h3>
<pre lang="jolie">type CommandExecutionResult: any { 
    .exitCode?: int
    .stderr?: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
