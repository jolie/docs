# JolieDoc for Port NetworkService #

## From file `network_service.iol` ##

<table>
 <tbody>
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
 </tbody>
</table>

## List of the available interfaces ##

 *  NetworkServiceInterface 

--------------------

## Interface NetworkServiceInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">getIPAddresses</a></td>
   <td><a rel="nofollow">GetIPAddressesRequest</a><br></td>
   <td><a rel="nofollow">GetIPAddressesResponse</a><br></td>
   <td>InterfaceNotFound,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getNetworkInterfaceNames</a></td>
   <td>GetNetworkInterfaceNamesRequest<br></td>
   <td><a rel="nofollow">GetNetworkInterfaceNamesResponse</a><br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### getNetworkInterfaceNames ###

    getNetworkInterfaceNames( GetNetworkInterfaceNamesRequest )( GetNetworkInterfaceNamesResponse )

### getIPAddresses ###

    getIPAddresses( GetIPAddressesRequest )( GetIPAddressesResponse ) throws
    				InterfaceNotFound

--------------------

## Message type list ##

### GetNetworkInterfaceNamesRequest ###

    type GetNetworkInterfaceNamesRequest: void GetNetworkInterfaceNamesResponse type GetNetworkInterfaceNamesResponse: void { 
        .interfaceName*: string { 
            .displayName: string
        }
    } GetIPAddressesRequest type GetIPAddressesRequest: void { 
        .interfaceName: string
    } GetIPAddressesResponse type GetIPAddressesResponse: void { 
        .ip4?: string
        .ip6?: string
    } Type list