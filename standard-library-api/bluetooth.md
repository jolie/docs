# Bluetooth

## From file `bluetooth.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| Bluetooth |  |  |

## List of the available interfaces

* [BluetoothInterface](bluetooth.md#BluetoothInterface)

## Interface BluetoothInterface {#BluetoothInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [inquire](bluetooth.md#inquire) | void  | [BluetoothInquiryResponse](bluetooth.md#BluetoothInquiryResponse)  |  |
| [setDiscoverable](bluetooth.md#setDiscoverable) | int  | int  |  |

## Operation list

### inquire {#inquire}

```text
inquire( void )( BluetoothInquiryResponse )
```

### setDiscoverable {#setDiscoverable}

```text
setDiscoverable( int )( int )
```

Sets the current Bluetooth device as discoverable or not discoverable  
 @request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.

## Message type list

### BluetoothInquiryResponse {#BluetoothInquiryResponse}

```text
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

## Type list

