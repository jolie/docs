# QueueUtils

## From file `queue_utils.iol`

| Port Name | Location | Protocol |
| --- | --- |
| QueueUtils |  |  |

## List of the available interfaces

* [QueueUtilsInterface](queueutils.md#QueueUtilsInterface)

## Interface QueueUtilsInterface {#QueueUtilsInterface}

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- | --- | --- |
| [delete\_queue](queueutils.md#delete_queue) | string  | bool  |  |
| [new\_queue](queueutils.md#new_queue) | string  | bool  |  |
| [peek](queueutils.md#peek) | string  | undefined  |  |
| [poll](queueutils.md#poll) | string  | undefined  |  |
| [push](queueutils.md#push) | [QueueRequest](queueutils.md#QueueRequest)  | bool  |  |
| [size](queueutils.md#size) | string  | int  |  |

## Operation list

### size {#size}

```text
size( string )( int )
```

### poll {#poll}

```text
poll( string )( undefined )
```

### new\_queue {#new_queue}

```text
new_queue( string )( bool )
```

### delete\_queue {#delete_queue}

```text
delete_queue( string )( bool )
```

### push {#push}

```text
push( QueueRequest )( bool )
```

### peek {#peek}

```text
peek( string )( undefined )
```

## Message type list

### QueueRequest {#QueueRequest}

```text
type QueueRequest: void { 
    .queue_name: string
    .element: undefined
}
```

## Type list

