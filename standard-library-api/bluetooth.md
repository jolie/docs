# Include library: bluetooth.iol

Inclusion code: <code>include "bluetooth.iol"</code>

<table>
  <caption>Service Deployment</caption>
  <thead>
    <tr>
      <th>Port Name</th>
      <th>Location</th>
      <th>Protocol</th>
      <th>Interfaces</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Bluetooth</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#BluetoothInterface">BluetoothInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="BluetoothInterface">BluetoothInterface</h3>

<table>
  <thead>
    <tr>
      <th>Operation Name</th>
      <th>Input Type</th>
      <th>Output Type</th>
      <th>Faults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#inquire">inquire</a></td>
      <td>void</td>
      <td><a href="#BluetoothInquiryResponse">BluetoothInquiryResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#setDiscoverable">setDiscoverable</a></td>
      <td>int</td>
      <td>int</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="inquire"></a>
#### inquire


Invocation template: <code>inquire@Bluetooth( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**
<a id="BluetoothInquiryResponse"></a>
Type documentation: no documentation provided 
<pre>type BluetoothInquiryResponse: void {
	.service*: void {
		.location: string
	}
	.device*: void {
		.address: string
		.name: string
	}
}</pre>




---

<a id="setDiscoverable"></a>
#### setDiscoverable
Operation documentation: 
	  Sets the current Bluetooth device as discoverable or not discoverable
	  @request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.
	 

Invocation template: <code>setDiscoverable@Bluetooth( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---





