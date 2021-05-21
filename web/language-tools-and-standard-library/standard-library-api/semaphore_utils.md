# SemaphoreUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| SemaphoreUtils documentation: |  |  |  |
| SemaphoreUtils | - | - | [SemaphoreUtilsInterface](semaphore_utils.md#SemaphoreUtilsInterface) |

### List of Available Interfaces

### SemaphoreUtilsInterface <a id="SemaphoreUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [release](semaphore_utils.md#release) | [SemaphoreRequest](semaphore_utils.md#SemaphoreRequest) | bool |  |
| [acquire](semaphore_utils.md#acquire) | [SemaphoreRequest](semaphore_utils.md#SemaphoreRequest) | bool |  |

## Operation Description

### release <a id="release"></a>

Operation documentation: Releases permits to a semaphore. If there exists no semaphore with the given ".name", "release" creates a new semaphore with that name and as many permits as indicated in ".permits". The default behaviour when value ".permits" is absent is to release one permit.

Invocation template:

```jolie
release@SemaphoreUtils( request )( response )
```

#### Request type <a id="SemaphoreRequest"></a>

Type: SemaphoreRequest

```jolie
type SemaphoreRequest: void {
    .permits?: int
    .name: string
}
```

`SemaphoreRequest : void`

* `permits : int` : the optional number of permits to release/acquire
* `name : string`

#### Response type

Type: bool

`bool : bool`

### acquire <a id="acquire"></a>

Operation documentation: Acquires permits from a semaphore. If there exists no semaphore with the given ".name", "acquire" creates a new semaphore with 0 permits with that name. The operation returns a response when a new permit is released \(see operation "release"\). The default behaviour when value ".permits" is absent is to acquire one permit.

Invocation template:

```jolie
acquire@SemaphoreUtils( request )( response )
```

#### Request type <a id="SemaphoreRequest"></a>

Type: SemaphoreRequest

```jolie
type SemaphoreRequest: void {
    .permits?: int
    .name: string
}
```

`SemaphoreRequest : void`

* `permits : int` : the optional number of permits to release/acquire
* `name : string`

#### Response type

Type: bool

`bool : bool`

