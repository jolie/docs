# JolieDoc for Port MessageDigest #

## From file `message_digest.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>MessageDigest</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  MessageDigestInterface 

--------------------

## Interface MessageDigestInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">md5</a></td>
   <td><a rel="nofollow">MD5Request</a><br></td>
   <td>string<br></td>
   <td>UnsupportedOperation( <a rel="nofollow">JavaExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### md5 ###

    md5( MD5Request )( string ) throws
    				UnsupportedOperation( JavaExceptionType )

--------------------

## Message type list ##

### MD5Request ###

    type MD5Request: string { 
        .radix?: int
    }

### JavaExceptionType ###

    type JavaExceptionType: string { 
        .stackTrace: string
    }

--------------------

## Type list ##