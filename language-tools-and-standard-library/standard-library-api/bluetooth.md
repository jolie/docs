# Bluetooth

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Bluetooth documentation: |  |  |  |
| Bluetooth | - | - | [BluetoothInterface](bluetooth.md#BluetoothInterface) |

### List of Available Interfaces

### BluetoothInterface <a id="BluetoothInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [inquire](bluetooth.md#inquire) | void | [BluetoothInquiryResponse](bluetooth.md#BluetoothInquiryResponse) |  |
| [setDiscoverable](bluetooth.md#setDiscoverable) | int | int |  |

## Operation Description

### inquire <a id="inquire"></a>

Operation documentation: Sets the current Bluetooth device as discoverable or not discoverable @request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.

Invocation template:

```jolie
inquire@Bluetooth( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type <a id="BluetoothInquiryResponse"></a>

Type: BluetoothInquiryResponse

```jolie
type BluetoothInquiryResponse: void {
    .service*: void {
        .location: string
    }
    .device*: void {
        .address: string
        .name: string
    }
}
```

`BluetoothInquiryResponse : void`

* `service : void`
  * `location : string`
* `device : void`
  * `address : string`
  * `name : string`

### setDiscoverable <a id="setDiscoverable"></a>

Operation documentation: Sets the current Bluetooth device as discoverable or not discoverable @request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.

Invocation template:

```jolie
setDiscoverable@Bluetooth( request )( response )
```

#### Request type

Type: int

`int : int`

#### Response type

Type: int

`int : int`

