<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service XMPP

> from xmpp import XMPP

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#XMPPInterface'>XMPPInterface</a> |

### List of Available Interfaces

### XMPPInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| connect | <a href="#ConnectionRequest">ConnectionRequest</a> | <a href='#void'>void</a> | <details><summary>XMPPException</summary>undefined</details> |  |
| sendMessage | <a href="#SendMessageRequest">SendMessageRequest</a> | <a href='#void'>void</a> | <details><summary>XMPPException</summary>undefined</details> |  |


### Types

<details>
<summary><span id="ConnectionRequest">ConnectionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;password[1,1]: string // 
&nbsp;&nbsp;port[0,1]: int // 
&nbsp;&nbsp;resource[0,1]: string // 
&nbsp;&nbsp;host[0,1]: string // 
&nbsp;&nbsp;serviceName[1,1]: string // 
&nbsp;&nbsp;username[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="SendMessageRequest">SendMessageRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;to[1,1]: string // 
&#125;
</pre>
</details>
