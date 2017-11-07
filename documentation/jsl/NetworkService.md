<html>
<head></head><body>
<h1>JolieDoc for Port NetworkService</h1>
<h2>From file <code>network_service.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>NetworkService</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#NetworkServiceInterface">NetworkServiceInterface </a>
</ul>
<hr>
<h2 id=NetworkServiceInterface>Interface NetworkServiceInterface</h2>
<a name="NetworkServiceInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#getIPAddresses">getIPAddresses</a></td>
<td><a href="#GetIPAddressesRequest">GetIPAddressesRequest</a><br /></td>
<td><a href="#GetIPAddressesResponse">GetIPAddressesResponse</a><br /></td>
<td>
InterfaceNotFound,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getNetworkInterfaceNames">getNetworkInterfaceNames</a></td>
<td>GetNetworkInterfaceNamesRequest<br /></td>
<td><a href="#GetNetworkInterfaceNamesResponse">GetNetworkInterfaceNamesResponse</a><br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="getNetworkInterfaceNames"></a><h3 id="getNetworkInterfaceNames">getNetworkInterfaceNames</h3></div>
<pre>getNetworkInterfaceNames( <a href="#GetNetworkInterfaceNamesRequest">GetNetworkInterfaceNamesRequest</a> )( <a href="#GetNetworkInterfaceNamesResponse">GetNetworkInterfaceNamesResponse</a> )
</pre>
<div class="operation-title"><a name="getIPAddresses"></a><h3 id="getIPAddresses">getIPAddresses</h3></div>
<pre>getIPAddresses( <a href="#GetIPAddressesRequest">GetIPAddressesRequest</a> )( <a href="#GetIPAddressesResponse">GetIPAddressesResponse</a> )
 throws

				
InterfaceNotFound
</pre>
<hr>
<h2>Message type list</h2>
<a name="GetNetworkInterfaceNamesRequest"></a><h3 id="GetNetworkInterfaceNamesRequest">GetNetworkInterfaceNamesRequest</h3>
<pre lang="jolie">type GetNetworkInterfaceNamesRequest: void</pre>
<a name="GetNetworkInterfaceNamesResponse"></a><h3 id="GetNetworkInterfaceNamesResponse">GetNetworkInterfaceNamesResponse</h3>
<pre lang="jolie">type GetNetworkInterfaceNamesResponse: void { 
    .interfaceName*: string { 
        .displayName: string
    }
}</pre>
<a name="GetIPAddressesRequest"></a><h3 id="GetIPAddressesRequest">GetIPAddressesRequest</h3>
<pre lang="jolie">type GetIPAddressesRequest: void { 
    .interfaceName: string
}</pre>
<a name="GetIPAddressesResponse"></a><h3 id="GetIPAddressesResponse">GetIPAddressesResponse</h3>
<pre lang="jolie">type GetIPAddressesResponse: void { 
    .ip4?: string
    .ip6?: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
