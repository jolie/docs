# JolieDoc for Port Time #

## From file `time.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Time</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  TimeInterface 

--------------------

## Interface TimeInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">cancelTimeout</a></td>
   <td>long<br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getCurrentDateTime</a></td>
   <td><a rel="nofollow">CurrentDateTimeRequestType</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getCurrentDateValues</a></td>
   <td>void<br></td>
   <td><a rel="nofollow">DateValuesType</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getCurrentTimeMillis</a></td>
   <td>void<br></td>
   <td>long<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getDateDiff</a></td>
   <td><a rel="nofollow">DiffDateRequestType</a><br></td>
   <td>int<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getDateTime</a></td>
   <td><a rel="nofollow">GetDateTimeRequest</a><br></td>
   <td><a rel="nofollow">GetDateTimeResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getDateTimeValues</a></td>
   <td><a rel="nofollow">GetTimestampFromStringRequest</a><br></td>
   <td><a rel="nofollow">DateTimeType</a><br></td>
   <td>InvalidDate,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getDateValues</a></td>
   <td><a rel="nofollow">DateValuesRequestType</a><br></td>
   <td><a rel="nofollow">DateValuesType</a><br></td>
   <td>InvalidDate,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getTimeDiff</a></td>
   <td><a rel="nofollow">GetTimeDiffRequest</a><br></td>
   <td>int<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getTimeFromMilliSeconds</a></td>
   <td>int<br></td>
   <td><a rel="nofollow">TimeValuesType</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getTimeValues</a></td>
   <td>string<br></td>
   <td><a rel="nofollow">TimeValuesType</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getTimestampFromString</a></td>
   <td><a rel="nofollow">GetTimestampFromStringRequest</a><br></td>
   <td>long<br></td>
   <td>InvalidTimestamp,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">scheduleTimeout</a></td>
   <td><a rel="nofollow">ScheduleTimeOutRequest</a><br></td>
   <td>long<br></td>
   <td>InvalidTimeUnit,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setNextTimeout</a></td>
   <td><a rel="nofollow">SetNextTimeOutRequest</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
   <td><a rel="nofollow">setNextTimeoutByDateTime</a></td>
   <td><a rel="nofollow">undefined</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
   <td><a rel="nofollow">setNextTimeoutByTime</a></td>
   <td><a rel="nofollow">undefined</a><br></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
   <td><a rel="nofollow">sleep</a></td>
   <td>undefined<br></td>
   <td>undefined<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### scheduleTimeout ###

    scheduleTimeout( ScheduleTimeOutRequest )( long ) throws
    				InvalidTimeUnit

Schedules a timeout, which can be cancelled using \#cancelTimeout from the returned string. Default .timeunit value is MILLISECONDS, .operation default is "timeout".

### getDateValues ###

    getDateValues( DateValuesRequestType )( DateValuesType ) throws
    				InvalidDate

Converts an input string into a date expressed by means of  
three elements: day, month and year. The request may specify the  
date parsing format. See \#DateValuesRequestType for details.

### getDateTime ###

    getDateTime( GetDateTimeRequest )( GetDateTimeResponse )

It returns a date time in a string format starting from a timestamp

### getCurrentTimeMillis ###

    getCurrentTimeMillis( void )( long )

Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

### getDateDiff ###

    getDateDiff( DiffDateRequestType )( int )

### getTimeDiff ###

    getTimeDiff( GetTimeDiffRequest )( int )

### getTimestampFromString ###

    getTimestampFromString( GetTimestampFromStringRequest )( long ) throws
    				InvalidTimestamp

### cancelTimeout ###

    cancelTimeout( long )( bool )

Cancels a timeout from a long-value created from \#scheduleTimeout

### setNextTimeoutByTime ###

    setNextTimeoutByTime( undefined )

### getCurrentDateTime ###

    getCurrentDateTime( CurrentDateTimeRequestType )( string )

### sleep ###

    sleep( undefined )( undefined )

### setNextTimeout ###

    setNextTimeout( SetNextTimeOutRequest )

it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message  
When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation  
( default: timeout )

### getTimeFromMilliSeconds ###

    getTimeFromMilliSeconds( int )( TimeValuesType )

### getDateTimeValues ###

    getDateTimeValues( GetTimestampFromStringRequest )( DateTimeType ) throws
    				InvalidDate

### setNextTimeoutByDateTime ###

    setNextTimeoutByDateTime( undefined )

### getCurrentDateValues ###

    getCurrentDateValues( void )( DateValuesType )

Returns the current date split in three fields: day, month and year

### getTimeValues ###

    getTimeValues( string )( TimeValuesType )

--------------------

## Message type list ##

### ScheduleTimeOutRequest ###

    type ScheduleTimeOutRequest: int { 
        .message?: undefined
        .operation?: string
        .timeunit?: string
    }

### DateValuesRequestType ###

    type DateValuesRequestType: string { 
        .format?: string
    }

### DateValuesType ###

    type DateValuesType: void { 
        .month: int
        .year: int
        .day: int
    }

### GetDateTimeRequest ###

    type GetDateTimeRequest: long { 
        .format?: string
    }

### GetDateTimeResponse ###

    type GetDateTimeResponse: string { 
        .month: int
        .hour: int
        .year: int
        .day: int
        .minute: int
        .second: int
    }

### DiffDateRequestType ###

    type DiffDateRequestType: void { 
        .format?: string
        .date2: string
        .date1: string
    }

### GetTimeDiffRequest ###

    type GetTimeDiffRequest: void { 
        .time1: string
        .time2: string
    }

### GetTimestampFromStringRequest ###

    type GetTimestampFromStringRequest: string { 
        .format?: string
        .language?: string
    }

### CurrentDateTimeRequestType ###

    type CurrentDateTimeRequestType: void { 
        .format?: string
    }

### SetNextTimeOutRequest ###

    type SetNextTimeOutRequest: int { 
        .message?: undefined
        .operation?: string
    }

### TimeValuesType ###

    type TimeValuesType: void { 
        .hour: int
        .minute: int
        .second: int
    }

### DateTimeType ###

    type DateTimeType: void { 
        .month: int
        .hour: int
        .year: int
        .day: int
        .minute: int
        .second: int
    }

--------------------

## Type list ##

### undefined ###

    type undefined: undefined