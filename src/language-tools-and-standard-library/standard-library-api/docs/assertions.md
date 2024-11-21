# Service Assertions

> from assertions import Assertions

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| Input | local | | <a href='#AssertionsInterface'>AssertionsInterface</a> |

### List of Available Interfaces

### AssertionsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| equals | <a href="#AssertionRequest">AssertionRequest</a> | <a href='#void'>void</a> | <details><summary>AssertionError</summary>string)</details> |  |


### Types

<details>
<summary><span id="AssertionRequest">AssertionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;actual[1,1]: undefined // 
&nbsp;&nbsp;expected[1,1]: undefined // 
&#125;
</pre>
</details>
