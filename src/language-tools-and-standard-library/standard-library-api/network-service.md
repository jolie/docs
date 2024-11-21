<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Network

> from network-service import Network

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#NetworkServiceInterface'>NetworkServiceInterface</a> |

### List of Available Interfaces

### NetworkServiceInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| getIPAddresses | <a href="#GetIPAddressesRequest">GetIPAddressesRequest</a> | <a href='#GetIPAddressesResponse'>GetIPAddressesResponse</a> | <details><summary>InterfaceNotFound</summary>undefined</details> |  |
| getNetworkInterfaceNames | <a href="#GetNetworkInterfaceNamesRequest">GetNetworkInterfaceNamesRequest</a> | <a href='#GetNetworkInterfaceNamesResponse'>GetNetworkInterfaceNamesResponse</a> | - |  |


### Types

<details>
<summary><span id="GetIPAddressesRequest">GetIPAddressesRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;interfaceName[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetIPAddressesResponse">GetIPAddressesResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ip4[0,1]: string // 
&nbsp;&nbsp;ip6[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetNetworkInterfaceNamesRequest">GetNetworkInterfaceNamesRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void
</pre>
</details>
<details>
<summary><span id="GetNetworkInterfaceNamesResponse">GetNetworkInterfaceNamesResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;interfaceName[0,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;displayName[1,1]: string // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
