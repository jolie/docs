# QueueUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| QueueUtils documentation: |  |  |  |
| QueueUtils | - | - | [QueueUtilsInterface](queue_utils.md#QueueUtilsInterface) |

### List of Available Interfaces

### QueueUtilsInterface <a id="QueueUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [size](queue_utils.md#size) | string | int |  |
| [poll](queue_utils.md#poll) | string | undefined |  |
| [new\_queue](queue_utils.md#new_queue) | string | bool |  |
| [delete\_queue](queue_utils.md#delete_queue) | string | bool |  |
| [push](queue_utils.md#push) | [QueueRequest](queue_utils.md#QueueRequest) | bool |  |
| [peek](queue_utils.md#peek) | string | undefined |  |

## Operation Description

### size <a id="size"></a>

Operation documentation: Returns the size of an existing queue, null otherwise

Invocation template:

```jolie
size@QueueUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: int

`int : int`

### poll <a id="poll"></a>

Operation documentation: Removes and returns the head of the queue

Invocation template:

```jolie
poll@QueueUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: undefined

`undefined : any`

### new\_queue <a id="new_queue"></a>

Operation documentation: Creates a new queue with queue\_name as key

Invocation template:

```jolie
new_queue@QueueUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: bool

`bool : bool`

### delete\_queue <a id="delete_queue"></a>

Operation documentation: Removes an existing queue

Invocation template:

```jolie
delete_queue@QueueUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: bool

`bool : bool`

### push <a id="push"></a>

Operation documentation: Pushes an element at the end of an existing queue

Invocation template:

```jolie
push@QueueUtils( request )( response )
```

#### Request type <a id="QueueRequest"></a>

Type: QueueRequest

```jolie
type QueueRequest: void {
    .queue_name: string
    .element: undefined
}
```

`QueueRequest : void`

* `queue_name : string`
* `element : any`

#### Response type

Type: bool

`bool : bool`

### peek <a id="peek"></a>

Operation documentation: Retrieves, but does not remove, the head of the queue

Invocation template:

```jolie
peek@QueueUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: undefined

`undefined : any`

