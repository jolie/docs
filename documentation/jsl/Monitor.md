# JolieDoc for Port Monitor #

## From file `standard_monitor.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Monitor</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  MonitorInterface 
 *  StandardMonitorInterface 

--------------------

## Interface MonitorInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">pushEvent</a></td>
   <td><a rel="nofollow">undefined</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
 </tbody>
</table>

## Interface StandardMonitorInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">flush</a></td>
   <td>void<br></td>
   <td><a rel="nofollow">FlushResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setMonitor</a></td>
   <td><a rel="nofollow">SetStandardMonitorRequest</a><br></td>
   <td>void<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### pushEvent ###

    pushEvent( undefined )

### flush ###

    flush( void )( FlushResponse )

### setMonitor ###

    setMonitor( SetStandardMonitorRequest )( void )

--------------------

## Message type list ##

### FlushResponse ###

    type FlushResponse: void { 
        .events*: MonitorEvent
    }

### SetStandardMonitorRequest ###

    type SetStandardMonitorRequest: void { 
        .queueMax?: int
        .triggeredEnabled?: bool
        .triggerThreshold?: int
    }

--------------------

## Type list ##

### MonitorEvent ###

    type MonitorEvent: void { 
        .memory: long
        .data?: undefined
        .type: string
        .timestamp: long
    }