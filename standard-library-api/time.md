# Time

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Time documentation: |  |  |  |
| Time | - | - | [TimeInterface](time.md#TimeInterface) |

### List of Available Interfaces

### TimeInterface <a id="TimeInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [scheduleTimeout](time.md#scheduleTimeout) | [ScheduleTimeOutRequest](time.md#ScheduleTimeOutRequest) | long |  InvalidTimeUnit\( undefined \) |
| [getDateValues](time.md#getDateValues) | [DateValuesRequestType](time.md#DateValuesRequestType) | [DateValuesType](time.md#DateValuesType) |  InvalidDate\( undefined \) |
| [getDateTime](time.md#getDateTime) | [GetDateTimeRequest](time.md#GetDateTimeRequest) | [GetDateTimeResponse](time.md#GetDateTimeResponse) |  |
| [getCurrentTimeMillis](time.md#getCurrentTimeMillis) | void | long |  |
| [getDateDiff](time.md#getDateDiff) | [DiffDateRequestType](time.md#DiffDateRequestType) | int |  |
| [getTimeDiff](time.md#getTimeDiff) | [GetTimeDiffRequest](time.md#GetTimeDiffRequest) | int |  |
| [getTimestampFromString](time.md#getTimestampFromString) | [GetTimestampFromStringRequest](time.md#GetTimestampFromStringRequest) | long |  InvalidTimestamp\( undefined \) |
| [cancelTimeout](time.md#cancelTimeout) | long | bool |  |
| [setNextTimeoutByTime](time.md#setNextTimeoutByTime) | undefined |  - |  |
| [getCurrentDateTime](time.md#getCurrentDateTime) | [CurrentDateTimeRequestType](time.md#CurrentDateTimeRequestType) | string |  |
| [sleep](time.md#sleep) | undefined | undefined |  |
| [setNextTimeout](time.md#setNextTimeout) | [SetNextTimeOutRequest](time.md#SetNextTimeOutRequest) |  - |  |
| [getTimeFromMilliSeconds](time.md#getTimeFromMilliSeconds) | int | [TimeValuesType](time.md#TimeValuesType) |  |
| [getDateTimeValues](time.md#getDateTimeValues) | [GetTimestampFromStringRequest](time.md#GetTimestampFromStringRequest) | [DateTimeType](time.md#DateTimeType) |  InvalidDate\( undefined \) |
| [setNextTimeoutByDateTime](time.md#setNextTimeoutByDateTime) | undefined |  - |  |
| [getCurrentDateValues](time.md#getCurrentDateValues) | void | [DateValuesType](time.md#DateValuesType) |  |
| [getTimeValues](time.md#getTimeValues) | string | [TimeValuesType](time.md#TimeValuesType) |  |

## Operation Description

### scheduleTimeout <a id="scheduleTimeout"></a>

Operation documentation: Schedules a timeout, which can be cancelled using \#cancelTimeout from the returned string. Default .timeunit value is MILLISECONDS, .operation default is "timeout".

Invocation template:

```text
scheduleTimeout@Time( request )( response )
```

#### Request type <a id="ScheduleTimeOutRequest"></a>

Type: ScheduleTimeOutRequest

```text
type ScheduleTimeOutRequest: int {
    .message?: undefined
    .operation?: string
    .timeunit?: string
}
```

`ScheduleTimeOutRequest : int`

* `message : any`
* `operation : string`
* `timeunit : string`

#### Response type

Type: long

`long : long`

#### Possible faults thrown

Fault `InvalidTimeUnit` with type `undefined`

Fault-handling install template:

```text
install ( InvalidTimeUnit => /* error-handling code */ )
```

### getDateValues <a id="getDateValues"></a>

Operation documentation: Converts an input string into a date expressed by means of three elements: day, month and year. The request may specify the date parsing format. See \#DateValuesRequestType for details.

Invocation template:

```text
getDateValues@Time( request )( response )
```

#### Request type <a id="DateValuesRequestType"></a>

Type: DateValuesRequestType

```text
type DateValuesRequestType: string {
    .format?: string
}
```

`DateValuesRequestType : string`

* `format : string`

#### Response type <a id="DateValuesType"></a>

Type: DateValuesType

```text
type DateValuesType: void {
    .month: int
    .year: int
    .day: int
}
```

`DateValuesType : void` : WARNING: work in progress, the API is unstable.

* `month : int`
* `year : int`
* `day : int`

#### Possible faults thrown

Fault `InvalidDate` with type `undefined`

Fault-handling install template:

```text
install ( InvalidDate => /* error-handling code */ )
```

### getDateTime <a id="getDateTime"></a>

Operation documentation: It returns a date time in a string format starting from a timestamp

Invocation template:

```text
getDateTime@Time( request )( response )
```

#### Request type <a id="GetDateTimeRequest"></a>

Type: GetDateTimeRequest

```text
type GetDateTimeRequest: long {
    .format?: string
}
```

`GetDateTimeRequest : long`

* `format : string`

#### Response type <a id="GetDateTimeResponse"></a>

Type: GetDateTimeResponse

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

`GetDateTimeResponse : string`

* `month : int`
* `hour : int`
* `year : int`
* `day : int`
* `minute : int`
* `second : int`

### getCurrentTimeMillis <a id="getCurrentTimeMillis"></a>

Operation documentation: Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

Invocation template:

```text
getCurrentTimeMillis@Time( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: long

`long : long`

### getDateDiff <a id="getDateDiff"></a>

Operation documentation: Returns the current date split in three fields: day, month and year

Invocation template:

```text
getDateDiff@Time( request )( response )
```

#### Request type <a id="DiffDateRequestType"></a>

Type: DiffDateRequestType

```text
type DiffDateRequestType: void {
    .format?: string
    .date2: string
    .date1: string
}
```

`DiffDateRequestType : void`

* `format : string`
* `date2 : string`
* `date1 : string`

#### Response type

Type: int

`int : int`

### getTimeDiff <a id="getTimeDiff"></a>

Operation documentation: Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

Invocation template:

```text
getTimeDiff@Time( request )( response )
```

#### Request type <a id="GetTimeDiffRequest"></a>

Type: GetTimeDiffRequest

```text
type GetTimeDiffRequest: void {
    .time1: string
    .time2: string
}
```

`GetTimeDiffRequest : void`

* `time1 : string`
* `time2 : string`

#### Response type

Type: int

`int : int`

### getTimestampFromString <a id="getTimestampFromString"></a>

Operation documentation: Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

Invocation template:

```text
getTimestampFromString@Time( request )( response )
```

#### Request type <a id="GetTimestampFromStringRequest"></a>

Type: GetTimestampFromStringRequest

```text
type GetTimestampFromStringRequest: string {
    .format?: string
    .language?: string
}
```

`GetTimestampFromStringRequest : string`

* `format : string`
* `language : string`

#### Response type

Type: long

`long : long`

#### Possible faults thrown

Fault `InvalidTimestamp` with type `undefined`

Fault-handling install template:

```text
install ( InvalidTimestamp => /* error-handling code */ )
```

### cancelTimeout <a id="cancelTimeout"></a>

Operation documentation: Cancels a timeout from a long-value created from \#scheduleTimeout

Invocation template:

```text
cancelTimeout@Time( request )( response )
```

#### Request type

Type: long

`long : long`

#### Response type

Type: bool

`bool : bool`

### setNextTimeoutByTime <a id="setNextTimeoutByTime"></a>

Operation documentation: it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation \( default: timeout \)

Invocation template:

```text
setNextTimeoutByTime@Time( request )
```

#### Request type

Type: undefined

`undefined : any`

### getCurrentDateTime <a id="getCurrentDateTime"></a>

Operation documentation:

Invocation template:

```text
getCurrentDateTime@Time( request )( response )
```

#### Request type <a id="CurrentDateTimeRequestType"></a>

Type: CurrentDateTimeRequestType

```text
type CurrentDateTimeRequestType: void {
    .format?: string
}
```

`CurrentDateTimeRequestType : void`

* `format : string`

#### Response type

Type: string

`string : string`

### sleep <a id="sleep"></a>

Operation documentation:

Invocation template:

```text
sleep@Time( request )( response )
```

#### Request type

Type: undefined

`undefined : any`

#### Response type

Type: undefined

`undefined : any`

### setNextTimeout <a id="setNextTimeout"></a>

Operation documentation: it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation \( default: timeout \)

Invocation template:

```text
setNextTimeout@Time( request )
```

#### Request type <a id="SetNextTimeOutRequest"></a>

Type: SetNextTimeOutRequest

```text
type SetNextTimeOutRequest: int {
    .message?: undefined
    .operation?: string
}
```

`SetNextTimeOutRequest : int`

* `message : any`
* `operation : string`

### getTimeFromMilliSeconds <a id="getTimeFromMilliSeconds"></a>

Operation documentation: Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

Invocation template:

```text
getTimeFromMilliSeconds@Time( request )( response )
```

#### Request type

Type: int

`int : int`

#### Response type <a id="TimeValuesType"></a>

Type: TimeValuesType

```text
type TimeValuesType: void {
    .hour: int
    .minute: int
    .second: int
}
```

`TimeValuesType : void`

* `hour : int`
* `minute : int`
* `second : int`

### getDateTimeValues <a id="getDateTimeValues"></a>

Operation documentation: Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

Invocation template:

```text
getDateTimeValues@Time( request )( response )
```

#### Request type <a id="GetTimestampFromStringRequest"></a>

Type: GetTimestampFromStringRequest

```text
type GetTimestampFromStringRequest: string {
    .format?: string
    .language?: string
}
```

`GetTimestampFromStringRequest : string`

* `format : string`
* `language : string`

#### Response type <a id="DateTimeType"></a>

Type: DateTimeType

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

`DateTimeType : void`

* `month : int`
* `hour : int`
* `year : int`
* `day : int`
* `minute : int`
* `second : int`

#### Possible faults thrown

Fault `InvalidDate` with type `undefined`

Fault-handling install template:

```text
install ( InvalidDate => /* error-handling code */ )
```

### setNextTimeoutByDateTime <a id="setNextTimeoutByDateTime"></a>

Operation documentation: it sets a timeout whose duration is in milliseconds and it is represented by the root value of the message When the alarm is triggered a message whose content is defined in .message is sent to operation defined in .operation \( default: timeout \)

Invocation template:

```text
setNextTimeoutByDateTime@Time( request )
```

#### Request type

Type: undefined

`undefined : any`

### getCurrentDateValues <a id="getCurrentDateValues"></a>

Operation documentation: Returns the current date split in three fields: day, month and year

Invocation template:

```text
getCurrentDateValues@Time( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type <a id="DateValuesType"></a>

Type: DateValuesType

```text
type DateValuesType: void {
    .month: int
    .year: int
    .day: int
}
```

`DateValuesType : void` : WARNING: work in progress, the API is unstable.

* `month : int`
* `year : int`
* `day : int`

### getTimeValues <a id="getTimeValues"></a>

Operation documentation: Warning: this is temporary and subject to future change as soon as long is supported by Jolie.

Invocation template:

```text
getTimeValues@Time( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type <a id="TimeValuesType"></a>

Type: TimeValuesType

```text
type TimeValuesType: void {
    .hour: int
    .minute: int
    .second: int
}
```

`TimeValuesType : void`

* `hour : int`
* `minute : int`
* `second : int`

