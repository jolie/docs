# Include library: network_service.iol

Inclusion code: <code>include "network_service.iol"</code>

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
      <td>NetworkService</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#NetworkServiceInterface">NetworkServiceInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="NetworkServiceInterface">NetworkServiceInterface</h3>

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
      <td><a href="#getNetworkInterfaceNames">getNetworkInterfaceNames</a></td>
      <td><a href="#GetNetworkInterfaceNamesRequest">GetNetworkInterfaceNamesRequest</a></td>
      <td><a href="#GetNetworkInterfaceNamesResponse">GetNetworkInterfaceNamesResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getIPAddresses">getIPAddresses</a></td>
      <td><a href="#GetIPAddressesRequest">GetIPAddressesRequest</a></td>
      <td><a href="#GetIPAddressesResponse">GetIPAddressesResponse</a></td>
      <td>
        InterfaceNotFound( undefined )
      </td>
    </tr>
  </tbody>
</table>

### Operation Description



#### getNetworkInterfaceNames


Invocation template: <code>getNetworkInterfaceNames@NetworkService( request )( response )</code>

<h4 id="GetNetworkInterfaceNamesRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetNetworkInterfaceNamesRequest: void</pre>


<h4 id="GetNetworkInterfaceNamesResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type GetNetworkInterfaceNamesResponse: void {
	.interfaceName*: string {
		.displayName: string
	}
}</pre>






#### getIPAddresses


Invocation template: <code>getIPAddresses@NetworkService( request )( response )</code>

<h4 id="GetIPAddressesRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetIPAddressesRequest: void {
	.interfaceName: string
}</pre>


<h4 id="GetIPAddressesResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type GetIPAddressesResponse: void {
	.ip4?: string
	.ip6?: string
}</pre>


**Possible faults thrown**


Fault <code>InterfaceNotFound</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InterfaceNotFound => /* error-handling code */ )</code>







