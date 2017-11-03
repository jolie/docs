# JolieDoc for Port Converter #

## From file `converter.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Converter</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ConverterInterface 

--------------------

## Interface ConverterInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">base64ToRaw</a></td>
   <td>string<br></td>
   <td>raw<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">rawToBase64</a></td>
   <td>raw<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">rawToString</a></td>
   <td><a rel="nofollow">RawToStringRequest</a><br></td>
   <td>string<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">stringToRaw</a></td>
   <td><a rel="nofollow">StringToRawRequest</a><br></td>
   <td>raw<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### stringToRaw ###

    stringToRaw( StringToRawRequest )( raw ) throws
    				IOException( IOExceptionType )

### base64ToRaw ###

    base64ToRaw( string )( raw ) throws
    				IOException( IOExceptionType )

### rawToBase64 ###

    rawToBase64( raw )( string )

### rawToString ###

    rawToString( RawToStringRequest )( string ) throws
    				IOException( IOExceptionType )

--------------------

## Message type list ##

### StringToRawRequest ###

    type StringToRawRequest: string { 
        .charset?: string
    }

### IOExceptionType ###

    type IOExceptionType: JavaExceptionType RawToStringRequest type RawToStringRequest: raw { 
        .charset?: string
    } Type list