# JolieDoc for Port WebServicesUtils #

## From file `web_services_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>WebServicesUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  WebServicesUtilsInterface 

--------------------

## Interface WebServicesUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">wsdlToJolie</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### wsdlToJolie ###

    wsdlToJolie( string )( string ) throws
    				IOException( IOExceptionType )

--------------------

## Message type list ##

### IOExceptionType ###

    type IOExceptionType: JavaExceptionType Type list