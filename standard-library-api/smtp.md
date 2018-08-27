# SMTP

## From file `smtp.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| SMTP |  |  |

## List of the available interfaces

* [SMTPInterface](smtp.md#SMTPInterface)

## Interface SMTPInterface {#SMTPInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [sendMail](smtp.md#sendMail) | [SendMailRequest](smtp.md#SendMailRequest)  | void  |  SMTPFault,   |

## Operation list

### sendMail {#sendMail}

```text
sendMail( SendMailRequest )( void )
 throws


SMTPFault
```

## Message type list

### SendMailRequest {#SendMailRequest}

```text
type SendMailRequest: void { 
    .cc*: string
    .authenticate?: void { 
        .password: string
        .username: string
    }
    .bcc*: string
    .subject: string
    .host: string
    .replyTo*: string
    .from: string
    .to[1,2147483647]: string
    .contentType?: string
    .content: string
}
```

## Type list

