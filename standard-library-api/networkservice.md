# NetworkService

## From file `network_service.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| NetworkService |  |  |

## List of the available interfaces

* [NetworkServiceInterface](networkservice.md#NetworkServiceInterface)

## Interface NetworkServiceInterface {#NetworkServiceInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [getIPAddresses](networkservice.md#getIPAddresses) | [GetIPAddressesRequest](networkservice.md#GetIPAddressesRequest)  | [GetIPAddressesResponse](networkservice.md#GetIPAddressesResponse)  |  InterfaceNotFound,   |
| [getNetworkInterfaceNames](networkservice.md#getNetworkInterfaceNames) | GetNetworkInterfaceNamesRequest  | [GetNetworkInterfaceNamesResponse](networkservice.md#GetNetworkInterfaceNamesResponse)  |  |

## Operation list

### getNetworkInterfaceNames {#getNetworkInterfaceNames}

```text
getNetworkInterfaceNames( GetNetworkInterfaceNamesRequest )( GetNetworkInterfaceNamesResponse )
```

### getIPAddresses {#getIPAddresses}

```text
getIPAddresses( GetIPAddressesRequest )( GetIPAddressesResponse )
 throws


InterfaceNotFound
```

## Message type list

### GetNetworkInterfaceNamesRequest {#GetNetworkInterfaceNamesRequest}

```text
type GetNetworkInterfaceNamesRequest: void
```

### GetNetworkInterfaceNamesResponse {#GetNetworkInterfaceNamesResponse}

```text
type GetNetworkInterfaceNamesResponse: void { 
    .interfaceName*: string { 
        .displayName: string
    }
}
```

### GetIPAddressesRequest {#GetIPAddressesRequest}

```text
type GetIPAddressesRequest: void { 
    .interfaceName: string
}
```

### GetIPAddressesResponse {#GetIPAddressesResponse}

```text
type GetIPAddressesResponse: void { 
    .ip4?: string
    .ip6?: string
}
```

## Type list

