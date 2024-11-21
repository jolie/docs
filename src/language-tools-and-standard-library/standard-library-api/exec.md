<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Exec

> from exec import Exec

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#ExecInterface'>ExecInterface</a> |

### List of Available Interfaces

### ExecInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| exec | <a href="#CommandExecutionRequest">CommandExecutionRequest</a> | <a href='#CommandExecutionResult'>CommandExecutionResult</a> | - |  |


### Types

<details>
<summary><span id="CommandExecutionRequest">CommandExecutionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;args[0,1]: string // 
&nbsp;&nbsp;workingDirectory[0,1]: string // 
&nbsp;&nbsp;stdOutConsoleEnable[0,1]: bool // 
&nbsp;&nbsp;waitFor[0,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="CommandExecutionResult">CommandExecutionResult: 
</span>
</summary>

##### Type Declaration
<pre>
any &#123;
&nbsp;&nbsp;exitCode[0,1]: int // 
&nbsp;&nbsp;stderr[0,1]: string // 
&#125;
</pre>
</details>
