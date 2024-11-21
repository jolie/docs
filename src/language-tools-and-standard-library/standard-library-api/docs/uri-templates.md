# Service UriTemplates

> from uri-templates import UriTemplates

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#UriTemplatesIface'>UriTemplatesIface</a> |

### List of Available Interfaces

### UriTemplatesIface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| expand | <a href="#ExpandRequest">ExpandRequest</a> | <a href='#string'>string</a> | - |  |
| match | <a href="#UriMatchRequest">UriMatchRequest</a> | <a href='#MatchResponse'>MatchResponse</a> | - |  |


### Types

<details>
<summary><span id="ExpandRequest">ExpandRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;params[0,1]: undefined // 
&#125;
</pre>
</details>
<details>
<summary><span id="MatchResponse">MatchResponse: 
</span>
</summary>

##### Type Declaration
<pre>
bool
</pre>
</details>
<details>
<summary><span id="UriMatchRequest">UriMatchRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;uri[1,1]: string // 
&#125;
</pre>
</details>
