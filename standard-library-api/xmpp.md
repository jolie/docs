# XMPP

## From file `xmpp.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| XMPP |  |  |

## List of the available interfaces

* [XMPPInterface](xmpp.md#XMPPInterface)

## Interface XMPPInterface {#XMPPInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [connect](xmpp.md#connect) | [ConnectionRequest](xmpp.md#ConnectionRequest)  | void  |  XMPPException,   |
| [sendMessage](xmpp.md#sendMessage) | [SendMessageRequest](xmpp.md#SendMessageRequest)  | void  |  XMPPException,   |

## Operation list

### sendMessage {#sendMessage}

```text
sendMessage( SendMessageRequest )( void )
 throws


XMPPException
```

### connect {#connect}

```text
connect( ConnectionRequest )( void )
 throws


XMPPException
```

## Message type list

### SendMessageRequest {#SendMessageRequest}

```text
type SendMessageRequest: string { 
    .to: string
}
```

### ConnectionRequest {#ConnectionRequest}

```text
type ConnectionRequest: void { 
    .password: string
    .port?: int
    .resource?: string
    .host?: string
    .serviceName: string
    .username: string
}
```

## Type list

