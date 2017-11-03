# JolieDoc for Port SchedulerPort #

## From file `scheduler.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>SchedulerPort</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  SchedulerInterface 

--------------------

## Interface SchedulerInterface ##

Configure the schedule in chron style string

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">setDailySchedule</a></td>
   <td><a rel="nofollow">DailyScheduleReq</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
   <td><a rel="nofollow">setSchedule</a></td>
   <td><a rel="nofollow">ScheduleReq</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### setSchedule ###

    setSchedule( ScheduleReq )

### setDailySchedule ###

    setDailySchedule( DailyScheduleReq )

--------------------

## Message type list ##

### ScheduleReq ###

    type ScheduleReq: void { 
        .period: int
        .format?: string
        .operation?: string
        .start_date: FullDate
    }

### DailyScheduleReq ###

    type DailyScheduleReq: void { 
        .start_hour: int
        .operation?: string
        .start_min?: int
    }

--------------------

## Type list ##

### FullDate ###

    type FullDate: void { 
        .sec: int
        .min: int
        .hour: int
        .month: int
        .year: int
        .msec: int
        .day: int
    }