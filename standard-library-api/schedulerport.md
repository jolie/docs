# SchedulerPort

## From file `scheduler.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| SchedulerPort |  |  |

## List of the available interfaces

* [SchedulerInterface](schedulerport.md#SchedulerInterface)

## Interface SchedulerInterface {#SchedulerInterface}

 Configure the schedule in chron style string

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [setDailySchedule](schedulerport.md#setDailySchedule) | [DailyScheduleReq](schedulerport.md#DailyScheduleReq)  |   |   |
| [setSchedule](schedulerport.md#setSchedule) | [ScheduleReq](schedulerport.md#ScheduleReq)  |   |   |

## Operation list

### setSchedule {#setSchedule}

setSchedule\( ScheduleReq \)

### setDailySchedule {#setDailySchedule}

setDailySchedule\( DailyScheduleReq \)

## Message type list

### ScheduleReq {#ScheduleReq}

```text
type ScheduleReq: void { 
    .period: int
    .format?: string
    .operation?: string
    .start_date: FullDate
}
```

### DailyScheduleReq {#DailyScheduleReq}

```text
type DailyScheduleReq: void { 
    .start_hour: int
    .operation?: string
    .start_min?: int
}
```

## Type list

### FullDate {#FullDate}

```text
type FullDate: void { 
    .sec: int
    .min: int
    .hour: int
    .month: int
    .year: int
    .msec: int
    .day: int
}
```

