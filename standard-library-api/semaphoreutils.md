# SemaphoreUtils

## From file `semaphore_utils.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| SemaphoreUtils |  |  |

## List of the available interfaces

* [SemaphoreUtilsInterface](semaphoreutils.md#SemaphoreUtilsInterface)

## Interface SemaphoreUtilsInterface {#SemaphoreUtilsInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [acquire](semaphoreutils.md#acquire) | [SemaphoreRequest](semaphoreutils.md#SemaphoreRequest)  | bool  |  |
| [release](semaphoreutils.md#release) | [SemaphoreRequest](semaphoreutils.md#SemaphoreRequest)  | bool  |  |

## Operation list

### release {#release}

```text
release( SemaphoreRequest )( bool )
```

Releases permits to a semaphore.  
 If there exists no semaphore with the given ".name", "release" creates a  
 new semaphore with that name and as many permits as indicated in ".permits".  
 The default behaviour when value ".permits" is absent is to release one permit.

### acquire {#acquire}

```text
acquire( SemaphoreRequest )( bool )
```

Acquires permits from a semaphore.  
 If there exists no semaphore with the given ".name", "acquire" creates a  
 new semaphore with 0 permits with that name.  
 The operation returns a response when a new permit is released \(see operation "release"\).  
 The default behaviour when value ".permits" is absent is to acquire one permit.

## Message type list

### SemaphoreRequest {#SemaphoreRequest}

```text
type SemaphoreRequest: void { 
    .permits?: int
    .name: string
}
```

## Type list

