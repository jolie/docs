# JolieDoc for Port Console #

## From file `console.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Console</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ConsoleInterface 

--------------------

## Interface ConsoleInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">enableTimestamp</a></td>
   <td><a rel="nofollow">EnableTimestampRequest</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">print</a></td>
   <td>undefined<br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">println</a></td>
   <td>undefined<br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">registerForInput</a></td>
   <td><a rel="nofollow">RegisterForInputRequest</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">subscribeSessionListener</a></td>
   <td><a rel="nofollow">SubscribeSessionListener</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">unsubscribeSessionListener</a></td>
   <td><a rel="nofollow">UnsubscribeSessionListener</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### print ###

    print( undefined )( void )

### println ###

    println( undefined )( void )

### registerForInput ###

    registerForInput( RegisterForInputRequest )( void )

it enables the console for input listening  
parameter enableSessionListener enables console input listening for more than one service session (default=false)

### unsubscribeSessionListener ###

    unsubscribeSessionListener( UnsubscribeSessionListener )( void )

it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation

### subscribeSessionListener ###

    subscribeSessionListener( SubscribeSessionListener )( void )

it receives a token string which identifies a service session.  
it enables the session to receive inputs from the console

### enableTimestamp ###

    enableTimestamp( EnableTimestampRequest )( void )

It enables timestamp inline printing for each console output operation call: print, println  
Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.

--------------------

## Message type list ##

### RegisterForInputRequest ###

    type RegisterForInputRequest: void { 
        .enableSessionListener?: bool
    }

### UnsubscribeSessionListener ###

    type UnsubscribeSessionListener: void { 
        .token: string
    }

### SubscribeSessionListener ###

    type SubscribeSessionListener: void { 
        .token: string
    }

### EnableTimestampRequest ###

    type EnableTimestampRequest: bool { 
        .format?: string
    }

--------------------

## Type list ##