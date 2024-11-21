# Service SecurityUtils

> from security-utils import SecurityUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#SecurityUtilsInterface'>SecurityUtilsInterface</a> |

### List of Available Interfaces

### SecurityUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| createSecureToken | <a href="#void">void</a> | <a href='#string'>string</a> | - |  |
| secureRandom | <a href="#SecureRandomRequest">SecureRandomRequest</a> | <a href='#raw'>raw</a> | - |  |


### Types

<details>
<summary><span id="SecureRandomRequest">SecureRandomRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;size[1,1]: int // 
&#125;
</pre>
</details>
