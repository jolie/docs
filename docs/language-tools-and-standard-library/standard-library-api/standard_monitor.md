# StandardMonitor

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| MonitorInput | local | - | [StandardMonitorInputInterface](standard_monitor.md#StandardMonitorInputInterface) |
| Monitor documentation: |  |  |  |
| Monitor | - | - | [MonitorInterface](standard_monitor.md#MonitorInterface)[StandardMonitorInterface](standard_monitor.md#StandardMonitorInterface) |

### List of Available Interfaces

### StandardMonitorInputInterface <a id="StandardMonitorInputInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [monitorAlert](standard_monitor.md#monitorAlert) | void |  - |  |

## Operation Description

### monitorAlert <a id="monitorAlert"></a>

Operation documentation:

Invocation template:

```jolie
monitorAlert( request )
```

#### Request type

Type: void

`void : void`

### MonitorInterface <a id="MonitorInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [pushEvent](standard_monitor.md#pushEvent) | undefined |  - |  |

## Operation Description

### pushEvent <a id="pushEvent"></a>

Operation documentation:

Invocation template:

```jolie
pushEvent@Monitor( request )
```

#### Request type

Type: undefined

`undefined : any`

### Subtypes

#### MonitorEvent <a id="MonitorEvent"></a>

```jolie
type MonitorEvent: void {
    .memory: long
    .data?: undefined
    .type: string
    .timestamp: long
}
```

 `MonitorEvent : void`

### StandardMonitorInterface <a id="StandardMonitorInterface"></a>

 Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [flush](standard_monitor.md#flush) | void | [FlushResponse](standard_monitor.md#FlushResponse) |  |
| [setMonitor](standard_monitor.md#setMonitor) | [SetStandardMonitorRequest](standard_monitor.md#SetStandardMonitorRequest) | void |  |

## Operation Description

### flush <a id="flush"></a>

 Operation documentation: Invocation template:

```jolie
flush@Monitor( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type <a id="FlushResponse"></a>

Type: FlushResponse

```jolie
type FlushResponse: void {
    .events*: MonitorEvent
}
```

`FlushResponse : void`

* `events : void`

### setMonitor <a id="setMonitor"></a>

Operation documentation:

Invocation template:

```jolie
setMonitor@Monitor( request )( response )
```

#### Request type <a id="SetStandardMonitorRequest"></a>

Type: SetStandardMonitorRequest

```jolie
type SetStandardMonitorRequest: void {
    .queueMax?: int
    .triggeredEnabled?: bool
    .triggerThreshold?: int
}
```

`SetStandardMonitorRequest : void`

* `queueMax : int`
* `triggeredEnabled : bool`
* `triggerThreshold : int`

#### Response type

Type: void

`void : void`

### Subtypes

#### MonitorEvent <a id="MonitorEvent"></a>

```
type MonitorEvent: void { .memory: long .data?: undefined .type: string .timestamp: long }
```

