# JolieDoc for Port Bluetooth #

## From file `bluetooth.iol` ##

<table>
 <tbody>
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
 </tbody>
</table>

## List of the available interfaces ##

 *  BluetoothInterface 

--------------------

## Interface BluetoothInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">inquire</a></td>
   <td>void<br></td>
   <td><a rel="nofollow">BluetoothInquiryResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setDiscoverable</a></td>
   <td>int<br></td>
   <td>int<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### inquire ###

    inquire( void )( BluetoothInquiryResponse )

### setDiscoverable ###

    setDiscoverable( int )( int )

Sets the current Bluetooth device as discoverable or not discoverable  
@request: 0 if the device has to be set not discoverable, 1 if the device has to be set discoverable.

--------------------

## Message type list ##

### BluetoothInquiryResponse ###

    type BluetoothInquiryResponse: void { 
        .service*: void { 
            .location: string
        }
        .device*: void { 
            .address: string
            .name: string
        }
    }

--------------------

## Type list ##