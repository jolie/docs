<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Reflection

> from reflection import Reflection

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#ReflectionIface'>ReflectionIface</a> |

### List of Available Interfaces

### ReflectionIface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| invoke | <a href="#InvokeRequest">InvokeRequest</a> | <a href='#undefined'>undefined</a> | <details><summary>OperationNotFound</summary>string</details><details><summary>InvocationFault</summary><a href='#InvocationFaultType'>InvocationFaultType</a></details> | <br>	Invokes the specified operation at outputPort.<br>	If the operation is a OneWay, the invocation returns no value.<br>	 |
| invokeRRUnsafe | <a href="#InvokeRequest">InvokeRequest</a> | <a href='#undefined'>undefined</a> | <details><summary>InvocationFault</summary><a href='#InvocationFaultType'>InvocationFaultType</a></details> |  |


### Types

<details>
<summary><span id="InvocationFaultType">InvocationFaultType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;data[1,1]: undefined // 
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="InvokeRequest">InvokeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;outputPort[1,1]: string // 
&nbsp;&nbsp;data[0,1]: undefined // 
&nbsp;&nbsp;resourcePath[0,1]: string // 
&nbsp;&nbsp;operation[1,1]: string // 
&#125;
</pre>
</details>
