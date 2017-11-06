<html>
<head></head><body>
<h1>JolieDoc for Port Bluetooth</h1>
<h2>From file <code>bluetooth.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Bluetooth</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#BluetoothInterface">BluetoothInterface </a>
</ul>
<hr>
<h2 id=BluetoothInterface>Interface BluetoothInterface</h2>
<a name="BluetoothInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#inquire">inquire</a></td>
<td>void<br /></td>
<td><a href="#BluetoothInquiryResponse">BluetoothInquiryResponse</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#setDiscoverable">setDiscoverable</a></td>
<td>int<br /></td>
<td>int<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="inquire"></a><h3 id="inquire">inquire</h3></div>
<pre>inquire( <a href="#void">void</a> )( <a href="#BluetoothInquiryResponse">BluetoothInquiryResponse</a> )
</pre>
<div class="operation-title"><a name="setDiscoverable"></a><h3 id="setDiscoverable">setDiscoverable</h3></div>
<pre>setDiscoverable( <a href="#int">int</a> )( <a href="#int">int</a> )
</pre>
<span class="opdoc"><p>Sets the current Bluetooth device as discoverable or not discoverable<br>	  @request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.</p></span>
<hr>
<h2>Message type list</h2>
<a name="BluetoothInquiryResponse"></a><h3 id="BluetoothInquiryResponse">BluetoothInquiryResponse</h3>
<pre lang="jolie">type BluetoothInquiryResponse: void { 
    .service*: void { 
        .location: string
    }
    .device*: void { 
        .address: string
        .name: string
    }
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
