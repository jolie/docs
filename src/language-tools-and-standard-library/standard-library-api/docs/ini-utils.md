# Service IniUtils

> from ini-utils import IniUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#IniUtilsInterface'>IniUtilsInterface</a> |

### List of Available Interfaces

### IniUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| parseIniFile | <a href="#parseIniFileRequest">parseIniFileRequest</a> | <a href='#IniData'>IniData</a> | - |  |


### Types

<details>
<summary><span id="IniData">IniData: 
</span>
</summary>

##### Type Declaration
<pre>
void
</pre>
</details>
<details>
<summary><span id="parseIniFileRequest">parseIniFileRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;charset[0,1]: string // 
&#125;
</pre>
</details>
