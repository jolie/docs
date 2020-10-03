# SMTP

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| SMTP documentation: |  |  |  |
| SMTP | - | - | [SMTPInterface](smtp.md#SMTPInterface) |

### List of Available Interfaces

### SMTPInterface <a id="SMTPInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [sendMail](smtp.md#sendMail) | [SendMailRequest](smtp.md#SendMailRequest) | void |  SMTPFault\( undefined \) |

## Operation Description

### sendMail <a id="sendMail"></a>

Operation documentation:

Invocation template:

```jolie
sendMail@SMTP( request )( response )
```

#### Request type <a id="SendMailRequest"></a>

Type: SendMailRequest

```jolie
type SendMailRequest: void {
    .cc*: string
    .authenticate?: void {
        .password: string
        .username: string
    }
    .bcc*: string
    .attachment*: void {
        .filename: string
        .contentType: string
        .content: raw
    }
    .subject: string
    .host: string
    .replyTo*: string
    .from: string
    .to[1,2147483647]: string
    .contentType?: string
    .content: string
}
```

`SendMailRequest : void`

* `cc : string`
* `authenticate : void`
  * `password : string`
  * `username : string`
* `bcc : string`
* `attachment : void`
  * `filename : string`
  * `contentType : string`
  * `content : raw`
* `subject : string`
* `host : string`
* `replyTo : string`
* `from : string`
* `to : string`
* `contentType : string`
* `content : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `SMTPFault` with type `undefined`

Fault-handling install template:

```jolie
install ( SMTPFault => /* error-handling code */ )
```

