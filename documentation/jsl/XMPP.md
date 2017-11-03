# JolieDoc for Port XMPP #

## From file `xmpp.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>XMPP</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  XMPPInterface 

--------------------

## Interface XMPPInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">connect</a></td>
   <td><a rel="nofollow">ConnectionRequest</a><br></td>
   <td>void<br></td>
   <td>XMPPException,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">sendMessage</a></td>
   <td><a rel="nofollow">SendMessageRequest</a><br></td>
   <td>void<br></td>
   <td>XMPPException,&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### sendMessage ###

    sendMessage( SendMessageRequest )( void ) throws
    				XMPPException

### connect ###

    connect( ConnectionRequest )( void ) throws
    				XMPPException

--------------------

## Message type list ##

### SendMessageRequest ###

    type SendMessageRequest: string { 
        .to: string
    }

### ConnectionRequest ###

    type ConnectionRequest: void { 
        .password: string
        .port?: int
        .resource?: string
        .host?: string
        .serviceName: string
        .username: string
    }

--------------------

## Type list ##