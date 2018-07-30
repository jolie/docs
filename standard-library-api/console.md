# Console

## From file `console.iol`

| Port Name | Location | Protocol |
| --- | --- |
| Console |  |  |

## List of the available interfaces

* [ConsoleInterface](console.md#ConsoleInterface)

## Interface ConsoleInterface {#ConsoleInterface}

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- | --- | --- |
| [enableTimestamp](console.md#enableTimestamp) | [EnableTimestampRequest](console.md#EnableTimestampRequest)  | void  |  |
| [print](console.md#print) | undefined  | void  |  |
| [println](console.md#println) | undefined  | void  |  |
| [registerForInput](console.md#registerForInput) | [RegisterForInputRequest](console.md#RegisterForInputRequest)  | void  |  |
| [subscribeSessionListener](console.md#subscribeSessionListener) | [SubscribeSessionListener](console.md#SubscribeSessionListener)  | void  |  |
| [unsubscribeSessionListener](console.md#unsubscribeSessionListener) | [UnsubscribeSessionListener](console.md#UnsubscribeSessionListener)  | void  |  |

## Operation list

### print {#print}

```text
print( undefined )( void )
```

### println {#println}

```text
println( undefined )( void )
```

### registerForInput {#registerForInput}

```text
registerForInput( RegisterForInputRequest )( void )
```

it enables the console for input listening  
 parameter enableSessionListener enables console input listening for more than one service session \(default=false\)

### unsubscribeSessionListener {#unsubscribeSessionListener}

```text
unsubscribeSessionListener( UnsubscribeSessionListener )( void )
```

it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation

### subscribeSessionListener {#subscribeSessionListener}

```text
subscribeSessionListener( SubscribeSessionListener )( void )
```

it receives a token string which identifies a service session.  
 it enables the session to receive inputs from the console

### enableTimestamp {#enableTimestamp}

```text
enableTimestamp( EnableTimestampRequest )( void )
```

It enables timestamp inline printing for each console output operation call: print, println  
 Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.

## Message type list

### RegisterForInputRequest {#RegisterForInputRequest}

```text
type RegisterForInputRequest: void { 
    .enableSessionListener?: bool
}
```

### UnsubscribeSessionListener {#UnsubscribeSessionListener}

```text
type UnsubscribeSessionListener: void { 
    .token: string
}
```

### SubscribeSessionListener {#SubscribeSessionListener}

```text
type SubscribeSessionListener: void { 
    .token: string
}
```

### EnableTimestampRequest {#EnableTimestampRequest}

```text
type EnableTimestampRequest: bool { 
    .format?: string
}
```

## Type list

