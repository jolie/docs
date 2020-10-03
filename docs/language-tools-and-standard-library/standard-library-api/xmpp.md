# XMPP

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| XMPP documentation: |  |  |  |
| XMPP | - | - | [XMPPInterface](xmpp.md#XMPPInterface) |

### List of Available Interfaces

### XMPPInterface <a id="XMPPInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [sendMessage](xmpp.md#sendMessage) | [SendMessageRequest](xmpp.md#SendMessageRequest) | void |  XMPPException\( undefined \) |
| [connect](xmpp.md#connect) | [ConnectionRequest](xmpp.md#ConnectionRequest) | void |  XMPPException\( undefined \) |

## Operation Description

### sendMessage <a id="sendMessage"></a>

Operation documentation:

Invocation template:

```jolie
sendMessage@XMPP( request )( response )
```

#### Request type <a id="SendMessageRequest"></a>

Type: SendMessageRequest

```jolie
type SendMessageRequest: string {
    .to: string
}
```

`SendMessageRequest : string`

* `to : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `XMPPException` with type `undefined`

Fault-handling install template:

```jolie
install ( XMPPException => /* error-handling code */ )
```

### connect <a id="connect"></a>

Operation documentation:

Invocation template:

```jolie
connect@XMPP( request )( response )
```

#### Request type <a id="ConnectionRequest"></a>

Type: ConnectionRequest

```jolie
type ConnectionRequest: void {
    .password: string
    .port?: int
    .resource?: string
    .host?: string
    .serviceName: string
    .username: string
}
```

`ConnectionRequest : void`

* `password : string`
* `port : int`
* `resource : string`
* `host : string`
* `serviceName : string`
* `username : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `XMPPException` with type `undefined`

Fault-handling install template:

```jolie
install ( XMPPException => /* error-handling code */ )
```

