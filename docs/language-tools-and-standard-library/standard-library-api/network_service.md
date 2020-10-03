# NetworkService

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| NetworkService documentation: |  |  |  |
| NetworkService | - | - | [NetworkServiceInterface](network_service.md#NetworkServiceInterface) |

### List of Available Interfaces

### NetworkServiceInterface <a id="NetworkServiceInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [getNetworkInterfaceNames](network_service.md#getNetworkInterfaceNames) | GetNetworkInterfaceNamesRequest | [GetNetworkInterfaceNamesResponse](network_service.md#GetNetworkInterfaceNamesResponse) |  |
| [getIPAddresses](network_service.md#getIPAddresses) | [GetIPAddressesRequest](network_service.md#GetIPAddressesRequest) | [GetIPAddressesResponse](network_service.md#GetIPAddressesResponse) |  InterfaceNotFound\( undefined \) |

## Operation Description

### getNetworkInterfaceNames <a id="getNetworkInterfaceNames"></a>

Operation documentation:

Invocation template:

```jolie
getNetworkInterfaceNames@NetworkService( request )( response )
```

#### Request type

Type: GetNetworkInterfaceNamesRequest

`GetNetworkInterfaceNamesRequest : void`

#### Response type <a id="GetNetworkInterfaceNamesResponse"></a>

Type: GetNetworkInterfaceNamesResponse

```jolie
type GetNetworkInterfaceNamesResponse: void {
    .interfaceName*: string {
        .displayName: string
    }
}
```

`GetNetworkInterfaceNamesResponse : void`

* `interfaceName : string`
  * `displayName : string`

### getIPAddresses <a id="getIPAddresses"></a>

Operation documentation:

Invocation template:

```jolie
getIPAddresses@NetworkService( request )( response )
```

#### Request type <a id="GetIPAddressesRequest"></a>

Type: GetIPAddressesRequest

```jolie
type GetIPAddressesRequest: void {
    .interfaceName: string
}
```

`GetIPAddressesRequest : void`

* `interfaceName : string`

#### Response type <a id="GetIPAddressesResponse"></a>

Type: GetIPAddressesResponse

```jolie
type GetIPAddressesResponse: void {
    .ip4?: string
    .ip6?: string
}
```

`GetIPAddressesResponse : void`

* `ip4 : string`
* `ip6 : string`

#### Possible faults thrown

Fault `InterfaceNotFound` with type `undefined`

Fault-handling install template:

```jolie
install ( InterfaceNotFound => /* error-handling code */ )
```

