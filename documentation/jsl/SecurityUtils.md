# JolieDoc for Port SecurityUtils #

## From file `security_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>SecurityUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  SecurityUtilsInterface 

--------------------

## Interface SecurityUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">createSecureToken</a></td>
   <td>void<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">secureRandom</a></td>
   <td><a rel="nofollow">SecureRandomRequest</a><br></td>
   <td>raw<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### secureRandom ###

    secureRandom( SecureRandomRequest )( raw )

### createSecureToken ###

    createSecureToken( void )( string )

--------------------

## Message type list ##

### SecureRandomRequest ###

    type SecureRandomRequest: void { 
        .size: int
    }

--------------------

## Type list ##