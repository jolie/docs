# Service Console

> from console import Console

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ConsoleInput | local | | <a href='#ConsoleIface'>ConsoleIface</a> |

### List of Available Interfaces

### ConsoleIface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| enableTimestamp | <a href="#EnableTimestampRequest">EnableTimestampRequest</a> | <a href='#void'>void</a> | - | <br>		It enables timestamp inline printing for each console output operation call: print, println<br>		Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.<br>	 |
| print | <a href="#undefined">undefined</a> | <a href='#void'>void</a> | - |  |
| println | <a href="#undefined">undefined</a> | <a href='#void'>void</a> | - |  |
| readLine | <a href="#ReadLineRequest">ReadLineRequest</a> | <a href='#string'>string</a> | - | <br>	 Read a line from the console using a synchronous call<br>	 |
| registerForInput | <a href="#RegisterForInputRequest">RegisterForInputRequest</a> | <a href='#void'>void</a> | - | <br>	  it enables the console for input listening<br>	  parameter enableSessionListener enables console input listening for more than one service session (default=false)<br>	 |
| subscribeSessionListener | <a href="#SubscribeSessionListener">SubscribeSessionListener</a> | <a href='#void'>void</a> | - | <br>	 it receives a token string which identifies a service session.<br>	 it enables the session to receive inputs from the console<br>	 |
| unsubscribeSessionListener | <a href="#UnsubscribeSessionListener">UnsubscribeSessionListener</a> | <a href='#void'>void</a> | - | <br>	 it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation<br>	 |


### Types

<details>
<summary><span id="EnableTimestampRequest">EnableTimestampRequest: 
</span>
</summary>

##### Type Declaration
<pre>
bool &#123;
&nbsp;&nbsp;format[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ReadLineRequest">ReadLineRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;secret[0,1]: bool // 
&#125;
</pre>
</details>
<details>
<summary><span id="RegisterForInputRequest">RegisterForInputRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;enableSessionListener[0,1]: bool // 
&#125;
</pre>
</details>
<details>
<summary><span id="SubscribeSessionListener">SubscribeSessionListener: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;token[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="UnsubscribeSessionListener">UnsubscribeSessionListener: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;token[1,1]: string // 
&#125;
</pre>
</details>
