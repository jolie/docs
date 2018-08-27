# Monitor

## From file `standard_monitor.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| Monitor |  |  |

## List of the available interfaces

* [MonitorInterface](monitor.md#MonitorInterface)
* [StandardMonitorInterface](monitor.md#StandardMonitorInterface)

## Interface MonitorInterface {#MonitorInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [pushEvent](monitor.md#pushEvent) | [undefined](monitor.md#undefined)  |   |   |

## Interface StandardMonitorInterface {#StandardMonitorInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [flush](monitor.md#flush) | void  | [FlushResponse](monitor.md#FlushResponse)  |  |
| [setMonitor](monitor.md#setMonitor) | [SetStandardMonitorRequest](monitor.md#SetStandardMonitorRequest)  | void  |  |

## Operation list

### pushEvent {#pushEvent}

pushEvent\( undefined \)

### flush {#flush}

```text
flush( void )( FlushResponse )
```

### setMonitor {#setMonitor}

```text
setMonitor( SetStandardMonitorRequest )( void )
```

## Message type list

### FlushResponse {#FlushResponse}

```text
type FlushResponse: void { 
    .events*: MonitorEvent
}
```

### SetStandardMonitorRequest {#SetStandardMonitorRequest}

```text
type SetStandardMonitorRequest: void { 
    .queueMax?: int
    .triggeredEnabled?: bool
    .triggerThreshold?: int
}
```

## Type list

### MonitorEvent {#MonitorEvent}

```text
type MonitorEvent: void { 
    .memory: long
    .data?: undefined
    .type: string
    .timestamp: long
}
```

