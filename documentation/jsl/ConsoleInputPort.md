# JolieDoc for Port ConsoleInputPort #

## From file `console.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>ConsoleInputPort</td>
   <td>local</td>
   <td>null</td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ConsoleInputInterface 

--------------------

## Interface ConsoleInputInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">in</a></td>
   <td><a rel="nofollow">InRequest</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### in ###

    in( InRequest )

--------------------

## Message type list ##

### InRequest ###

    type InRequest: string { 
        .token?: string
    }

--------------------

## Type list ##