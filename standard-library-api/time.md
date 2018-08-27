# Time

## From file `time.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| Time |  |  |

## List of the available interfaces

* [TimeInterface](time.md#TimeInterface)

## Interface TimeInterface {#TimeInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [cancelTimeout](time.md#cancelTimeout) | long  | bool  |  |
| [getCurrentDateTime](time.md#getCurrentDateTime) | [CurrentDateTimeRequestType](time.md#CurrentDateTimeRequestType)  | string  |  |
| [getCurrentDateValues](time.md#getCurrentDateValues) | void  | [DateValuesType](time.md#DateValuesType)  |  |
| [getCurrentTimeMillis](time.md#getCurrentTimeMillis) | void  | long  |  |
| [getDateDiff](time.md#getDateDiff) | [DiffDateRequestType](time.md#DiffDateRequestType)  | int  |  |
| [getDateTime](time.md#getDateTime) | [GetDateTimeRequest](time.md#GetDateTimeRequest)  | [GetDateTimeResponse](time.md#GetDateTimeResponse)  |  |
| [getDateTimeValues](time.md#getDateTimeValues) | [GetTimestampFromStringRequest](time.md#GetTimestampFromStringRequest)  | [DateTimeType](time.md#DateTimeType)  |  InvalidDate,   |
| [getDateValues](time.md#getDateValues) | [DateValuesRequestType](time.md#DateValuesRequestType)  | [DateValuesType](time.md#DateValuesType)  |  InvalidDate,   |
| [getTimeDiff](time.md#getTimeDiff) | [GetTimeDiffRequest](time.md#GetTimeDiffRequest)  | int  |  |
| [getTimeFromMilliSeconds](time.md#getTimeFromMilliSeconds) | int  | [TimeValuesType](time.md#TimeValuesType)  |  |
| [getTimeValues](time.md#getTimeValues) | string  | [TimeValuesType](time.md#TimeValuesType)  |  |
| [getTimestampFromString](time.md#getTimestampFromString) | [GetTimestampFromStringRequest](time.md#GetTimestampFromStringRequest)  | long  |  InvalidTimestamp,   |
| [scheduleTimeout](time.md#scheduleTimeout) | [ScheduleTimeOutRequest](time.md#ScheduleTimeOutRequest)  | long  |  InvalidTimeUnit,   |
| [setNextTimeout](time.md#setNextTimeout) | [SetNextTimeOutRequest](time.md#SetNextTimeOutRequest)  |   |   |
| [setNextTimeoutByDateTime](time.md#setNextTimeoutByDateTime) | [undefined](time.md#undefined)  |   |   |
| [setNextTimeoutByTime](time.md#setNextTimeoutByTime) | [undefined](time.md#undefined)  |   |   |
| [sleep](time.md#sleep) | undefined  | undefined  |  |

## Operation list

### scheduleTimeout {#scheduleTimeout}

```text
scheduleTimeout( ScheduleTimeOutRequest )( long )
 throws


InvalidTimeUnit
```

Schedules a timeout, which can be cancelled using \#cancelTimeout from the returned string. Default .timeunit value is MILLISECONDS, .operation default is "timeout".

### getDateValues {#getDateValues}

```text
getDateValues( DateValuesRequestType )( DateValuesType )
 throws


InvalidDate
```

Converts an input string into a date expressed by means of  
 three elements: day, month and year. The request may specify the  
 date parsing format. See \#DateValuesRequestType for details.

### getDateTime {#getDateTime}

```text
getDateTime( GetDateTimeRequest )( GetDateTimeResponse )
```

It returns a date time in a string format starting from a timestamp

### getCurrentTimeMillis {#getCurrentTimeMillis}

```text
getCurrentTimeMillis( void )( long )
```

Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

### getDateDiff {#getDateDiff}

```text
getDateDiff( DiffDateRequestType )( int )
```

### getTimeDiff {#getTimeDiff}

```text
getTimeDiff( GetTimeDiffRequest )( int )
```

### getTimestampFromString {#getTimestampFromString}

```text
getTimestampFromString( GetTimestampFromStringRequest )( long )
 throws


InvalidTimestamp
```

### cancelTimeout {#cancelTimeout}

```text
cancelTimeout( long )( bool )
```

Cancels a timeout from a long-value created from \#scheduleTimeout

### setNextTimeoutByTime {#setNextTimeoutByTime}

setNextTimeoutByTime\( undefined \)

### getCurrentDateTime {#getCurrentDateTime}

```text
getCurrentDateTime( CurrentDateTimeRequestType )( string )
```

### sleep {#sleep}

```text
sleep( undefined )( undefined )
```

### setNextTimeout {#setNextTimeout}

setNextTimeout\( SetNextTimeOutRequest \)

it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message  
 When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation  
 \( default: timeout \)

### getTimeFromMilliSeconds {#getTimeFromMilliSeconds}

```text
getTimeFromMilliSeconds( int )( TimeValuesType )
```

### getDateTimeValues {#getDateTimeValues}

```text
getDateTimeValues( GetTimestampFromStringRequest )( DateTimeType )
 throws


InvalidDate
```

### setNextTimeoutByDateTime {#setNextTimeoutByDateTime}

setNextTimeoutByDateTime\( undefined \)

### getCurrentDateValues {#getCurrentDateValues}

```text
getCurrentDateValues( void )( DateValuesType )
```

Returns the current date split in three fields: day, month and year

### getTimeValues {#getTimeValues}

```text
getTimeValues( string )( TimeValuesType )
```

## Message type list

### ScheduleTimeOutRequest {#ScheduleTimeOutRequest}

```text
type ScheduleTimeOutRequest: int { 
    .message?: undefined
    .operation?: string
    .timeunit?: string
}
```

### DateValuesRequestType {#DateValuesRequestType}

```text
type DateValuesRequestType: string { 
    .format?: string
}
```

### DateValuesType {#DateValuesType}

```text
type DateValuesType: void { 
    .month: int
    .year: int
    .day: int
}
```

### GetDateTimeRequest {#GetDateTimeRequest}

```text
type GetDateTimeRequest: long { 
    .format?: string
}
```

### GetDateTimeResponse {#GetDateTimeResponse}

```text
type GetDateTimeResponse: string { 
    .month: int
    .hour: int
    .year: int
    .day: int
    .minute: int
    .second: int
}
```

### DiffDateRequestType {#DiffDateRequestType}

```text
type DiffDateRequestType: void { 
    .format?: string
    .date2: string
    .date1: string
}
```

### GetTimeDiffRequest {#GetTimeDiffRequest}

```text
type GetTimeDiffRequest: void { 
    .time1: string
    .time2: string
}
```

### GetTimestampFromStringRequest {#GetTimestampFromStringRequest}

```text
type GetTimestampFromStringRequest: string { 
    .format?: string
    .language?: string
}
```

### CurrentDateTimeRequestType {#CurrentDateTimeRequestType}

```text
type CurrentDateTimeRequestType: void { 
    .format?: string
}
```

### SetNextTimeOutRequest {#SetNextTimeOutRequest}

```text
type SetNextTimeOutRequest: int { 
    .message?: undefined
    .operation?: string
}
```

### TimeValuesType {#TimeValuesType}

```text
type TimeValuesType: void { 
    .hour: int
    .minute: int
    .second: int
}
```

### DateTimeType {#DateTimeType}

```text
type DateTimeType: void { 
    .month: int
    .hour: int
    .year: int
    .day: int
    .minute: int
    .second: int
}
```

## Type list

### undefined {#undefined}

```text
type undefined: undefined
```

