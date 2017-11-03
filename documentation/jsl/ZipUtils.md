# JolieDoc for Port ZipUtils #

## From file `zip_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>ZipUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ZipUtilsInterface 

--------------------

## Interface ZipUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">IOException</a></td>
   <td>undefined<br></td>
   <td>undefined<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">readEntry</a></td>
   <td><a rel="nofollow">ReadEntryRequest</a><br></td>
   <td>any<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">unzip</a></td>
   <td><a rel="nofollow">UnzipRequest</a><br></td>
   <td><a rel="nofollow">UnzipResponse</a><br></td>
   <td>FileNotFound,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">zip</a></td>
   <td>ZipRequest<br></td>
   <td>raw<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### zip ###

    zip( ZipRequest )( raw ) throws
    				IOException( IOExceptionType )

### IOException ###

    IOException( undefined )( undefined )

### unzip ###

    unzip( UnzipRequest )( UnzipResponse ) throws
    				FileNotFound

### readEntry ###

    readEntry( ReadEntryRequest )( any ) throws
    				IOException( IOExceptionType )

--------------------

## Message type list ##

### ZipRequest ###

    type ZipRequest: undefined IOExceptionType type IOExceptionType: JavaExceptionType UnzipRequest type UnzipRequest: void { 
        .filename: string
        .targetPath: string
    } UnzipResponse type UnzipResponse: void { 
        .entry*: string
    } ReadEntryRequest type ReadEntryRequest: void { 
        .entry: string
        .filename: string
    } Type list