# Include library: network_service.iol

Inclusion code: <pre>include "network_service.iol"</pre>

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
  <tbody><tr><td>NetworkService documentation: </td></tr>
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

Interface documentation: 

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
      <td>GetNetworkInterfaceNamesRequest</td>
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

<h2>Operation Description</h2>



<h3 id="getNetworkInterfaceNames">getNetworkInterfaceNames</h3>

Operation documentation: 


Invocation template: 
<pre>getNetworkInterfaceNames@NetworkService( request )( response )</pre>

<h4>Request type</h4>

Type: GetNetworkInterfaceNamesRequest




<code>GetNetworkInterfaceNamesRequest : void</code> 



<h4 id="GetNetworkInterfaceNamesResponse">Response type</h4>

Type: GetNetworkInterfaceNamesResponse


<pre>type GetNetworkInterfaceNamesResponse: void {
	.interfaceName*: string {
		.displayName: string
	}
}</pre>

<code>GetNetworkInterfaceNamesResponse : void</code> 

<ul>

  <li><code>interfaceName : string</code> 

<ul>

  <li><code>displayName : string</code> 
</li>

</ul>
</li>

</ul>








<h3 id="getIPAddresses">getIPAddresses</h3>

Operation documentation: 


Invocation template: 
<pre>getIPAddresses@NetworkService( request )( response )</pre>

<h4 id="GetIPAddressesRequest">Request type</h4>

Type: GetIPAddressesRequest


<pre>type GetIPAddressesRequest: void {
	.interfaceName: string
}</pre>

<code>GetIPAddressesRequest : void</code> 

<ul>

  <li><code>interfaceName : string</code> 
</li>

</ul>



<h4 id="GetIPAddressesResponse">Response type</h4>

Type: GetIPAddressesResponse


<pre>type GetIPAddressesResponse: void {
	.ip4?: string
	.ip6?: string
}</pre>

<code>GetIPAddressesResponse : void</code> 

<ul>

  <li><code>ip4 : string</code> 
</li>

  <li><code>ip6 : string</code> 
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>InterfaceNotFound</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( InterfaceNotFound => /* error-handling code */ )</pre>






