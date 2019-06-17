# Scheduler

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Scheduler documentation: |  |  |  |
| Scheduler | - | - | [SchedulerInterface](scheduler.md#SchedulerInterface) |

### List of Available Interfaces

### SchedulerInterface <a id="SchedulerInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [setCronJob](scheduler.md#setCronJob) | [SetCronJobRequest](scheduler.md#SetCronJobRequest) | void |  JobAlreadyExists\( void \) |
| [deleteCronJob](scheduler.md#deleteCronJob) | [DeleteCronJobRequest](scheduler.md#DeleteCronJobRequest) | void |  |
| [setCallbackOperation](scheduler.md#setCallbackOperation) | [SetCallBackOperationRequest](scheduler.md#SetCallBackOperationRequest) |  - |  |

## Operation Description

### setCronJob <a id="setCronJob"></a>

Operation documentation:

Invocation template:

```text
setCronJob@Scheduler( request )( response )
```

#### Request type <a id="SetCronJobRequest"></a>

Type: SetCronJobRequest

```text
type SetCronJobRequest: void {
    .jobName: string
    .cronSpecs: void {
        .dayOfWeek: string
        .hour: string
        .month: string
        .dayOfMonth: string
        .year?: string
        .second: string
        .minute: string
    }
    .groupName: string
}
```

`SetCronJobRequest : void`

* `jobName : string`
* `cronSpecs : void`
  * `dayOfWeek : string`
  * `hour : string`
  * `month : string`
  * `dayOfMonth : string`
  * `year : string`
  * `second : string`
  * `minute : string`
* `groupName : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `JobAlreadyExists` with type `void`

Fault-handling install template:

```text
install ( JobAlreadyExists => /* error-handling code */ )
```

### deleteCronJob <a id="deleteCronJob"></a>

Operation documentation:

Invocation template:

```text
deleteCronJob@Scheduler( request )( response )
```

#### Request type <a id="DeleteCronJobRequest"></a>

Type: DeleteCronJobRequest

```text
type DeleteCronJobRequest: void {
    .jobName: string
    .groupName: string
}
```

`DeleteCronJobRequest : void`

* `jobName : string`
* `groupName : string`

#### Response type

Type: void

`void : void`

### setCallbackOperation <a id="setCallbackOperation"></a>

Operation documentation:

Invocation template:

```text
setCallbackOperation@Scheduler( request )
```

#### Request type <a id="SetCallBackOperationRequest"></a>

Type: SetCallBackOperationRequest

```text
type SetCallBackOperationRequest: void {
    .operationName: string
}
```

`SetCallBackOperationRequest : void`

* `operationName : string`

