<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service SMTP

> from smtp import SMTP

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#SMTPInterface'>SMTPInterface</a> |

### List of Available Interfaces

### SMTPInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| sendMail | <a href="#SendMailRequest">SendMailRequest</a> | <a href='#void'>void</a> | <details><summary>SMTPFault</summary>undefined</details> |  |


### Types

<details>
<summary><span id="SendMailRequest">SendMailRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;cc[0,1]: string // 
&nbsp;&nbsp;authenticate[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;password[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;username[1,1]: string // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;bcc[0,1]: string // 
&nbsp;&nbsp;attachment[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;filename[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;contentType[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;content[1,1]: raw // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;subject[1,1]: string // 
&nbsp;&nbsp;host[1,1]: string // 
&nbsp;&nbsp;replyTo[0,1]: string // 
&nbsp;&nbsp;from[1,1]: string // 
&nbsp;&nbsp;to[1,1]: string // 
&nbsp;&nbsp;contentType[0,1]: string // 
&nbsp;&nbsp;content[1,1]: string // 
&#125;
</pre>
</details>
