# CallbackDefault

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| SchedulerCallBack | local | - | [SchedulerCallBackInterface](callback_default.md#SchedulerCallBackInterface) |

### List of Available Interfaces

### SchedulerCallBackInterface <a id="SchedulerCallBackInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [schedulerCallback](callback_default.md#schedulerCallback) | [SchedulerCallBackRequest](callback_default.md#SchedulerCallBackRequest) |  - |  |

## Operation Description

### schedulerCallback <a id="schedulerCallback"></a>

Operation documentation:

Invocation template:

```jolie
schedulerCallback( request )
```

#### Request type <a id="SchedulerCallBackRequest"></a>

Type: SchedulerCallBackRequest

```jolie
type SchedulerCallBackRequest: void {
    .jobName: string
    .groupName: string
}
```

`SchedulerCallBackRequest : void`

* `jobName : string`
* `groupName : string`

