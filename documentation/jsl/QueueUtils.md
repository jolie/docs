# JolieDoc for Port QueueUtils #

## From file `queue_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>QueueUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  QueueUtilsInterface 

--------------------

## Interface QueueUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">delete_queue</a></td>
   <td>string<br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">new_queue</a></td>
   <td>string<br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">peek</a></td>
   <td>string<br></td>
   <td>undefined<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">poll</a></td>
   <td>string<br></td>
   <td>undefined<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">push</a></td>
   <td><a rel="nofollow">QueueRequest</a><br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">size</a></td>
   <td>string<br></td>
   <td>int<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### size ###

    size( string )( int )

### poll ###

    poll( string )( undefined )

### new\_queue ###

    new_queue( string )( bool )

### delete\_queue ###

    delete_queue( string )( bool )

### push ###

    push( QueueRequest )( bool )

### peek ###

    peek( string )( undefined )

--------------------

## Message type list ##

### QueueRequest ###

    type QueueRequest: void { 
        .queue_name: string
        .element: undefined
    }

--------------------

## Type list ##