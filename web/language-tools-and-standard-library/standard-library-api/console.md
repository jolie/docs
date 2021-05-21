# Console

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| ConsoleInputPort | local | - | [ConsoleInputInterface](console.md#ConsoleInputInterface) |
| Console documentation: |  |  |  |
| Console | - | - | [ConsoleInterface](console.md#ConsoleInterface) |

### List of Available Interfaces

### ConsoleInputInterface <a id="ConsoleInputInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [in](console.md#in) | [InRequest](console.md#InRequest) |  - |  |

## Operation Description

### in <a id="in"></a>

Operation documentation:

Invocation template:

```jolie
in( request )
```

#### Request type <a id="InRequest"></a>

Type: InRequest

```jolie
type InRequest: string {
    .token?: string
}
```

`InRequest : string`

* `token : string`

### ConsoleInterface <a id="ConsoleInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [print](console.md#print) | undefined | void |  |
| [println](console.md#println) | undefined | void |  |
| [registerForInput](console.md#registerForInput) | [RegisterForInputRequest](console.md#RegisterForInputRequest) | void |  |
| [unsubscribeSessionListener](console.md#unsubscribeSessionListener) | [UnsubscribeSessionListener](console.md#UnsubscribeSessionListener) | void |  |
| [subscribeSessionListener](console.md#subscribeSessionListener) | [SubscribeSessionListener](console.md#SubscribeSessionListener) | void |  |
| [enableTimestamp](console.md#enableTimestamp) | [EnableTimestampRequest](console.md#EnableTimestampRequest) | void |  |

## Operation Description

### print <a id="print"></a>

Operation documentation:

Invocation template:

```jolie
print@Console( request )( response )
```

#### Request type

Type: undefined

`undefined : any`

#### Response type

Type: void

`void : void`

### println <a id="println"></a>

Operation documentation:

Invocation template:

```jolie
println@Console( request )( response )
```

#### Request type

Type: undefined

`undefined : any`

#### Response type

Type: void

`void : void`

### registerForInput <a id="registerForInput"></a>

Operation documentation: it enables the console for input listening parameter enableSessionListener enables console input listening for more than one service session \(default=false\)

Invocation template:

```jolie
registerForInput@Console( request )( response )
```

#### Request type <a id="RegisterForInputRequest"></a>

Type: RegisterForInputRequest

```jolie
type RegisterForInputRequest: void {
    .enableSessionListener?: bool
}
```

`RegisterForInputRequest : void`

* `enableSessionListener : bool`

#### Response type

Type: void

`void : void`

### unsubscribeSessionListener <a id="unsubscribeSessionListener"></a>

Operation documentation: it disables a session to receive inputs from the console, previously registered with subscribeSessionListener operation

Invocation template:

```jolie
unsubscribeSessionListener@Console( request )( response )
```

#### Request type <a id="UnsubscribeSessionListener"></a>

Type: UnsubscribeSessionListener

```jolie
type UnsubscribeSessionListener: void {
    .token: string
}
```

`UnsubscribeSessionListener : void`

* `token : string`

#### Response type

Type: void

`void : void`

### subscribeSessionListener <a id="subscribeSessionListener"></a>

Operation documentation: it receives a token string which identifies a service session. it enables the session to receive inputs from the console

Invocation template:

```jolie
subscribeSessionListener@Console( request )( response )
```

#### Request type <a id="SubscribeSessionListener"></a>

Type: SubscribeSessionListener

```jolie
type SubscribeSessionListener: void {
    .token: string
}
```

`SubscribeSessionListener : void`

* `token : string`

#### Response type

Type: void

`void : void`

### enableTimestamp <a id="enableTimestamp"></a>

Operation documentation: It enables timestamp inline printing for each console output operation call: print, println Parameter format allows to specifiy the timestamp output format. Bad Format will be printed out if format value is not allowed.

Invocation template:

```jolie
enableTimestamp@Console( request )( response )
```

#### Request type <a id="EnableTimestampRequest"></a>

Type: EnableTimestampRequest

```jolie
type EnableTimestampRequest: bool {
    .format?: string
}
```

`EnableTimestampRequest : bool`

* `format : string`

#### Response type

Type: void

`void : void`

