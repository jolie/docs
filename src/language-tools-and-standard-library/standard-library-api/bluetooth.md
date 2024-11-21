<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Bluetooth

> from bluetooth import Bluetooth

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#BluetoothInterface'>BluetoothInterface</a> |

### List of Available Interfaces

### BluetoothInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| inquire | <a href="#void">void</a> | <a href='#BluetoothInquiryResponse'>BluetoothInquiryResponse</a> | - |  |
| setDiscoverable | <a href="#int">int</a> | <a href='#int'>int</a> | - | <br>	  Sets the current Bluetooth device as discoverable or not discoverable<br>	  @request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.<br>	  |


### Types

<details>
<summary><span id="BluetoothInquiryResponse">BluetoothInquiryResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;service[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;location[1,1]: string // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;device[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;address[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
