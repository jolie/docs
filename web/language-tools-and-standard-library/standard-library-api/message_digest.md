# MessageDigest

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| MessageDigest documentation: |  |  |  |
| MessageDigest | - | - | [MessageDigestInterface](message_digest.md#MessageDigestInterface) |

### List of Available Interfaces

### MessageDigestInterface <a id="MessageDigestInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [md5](message_digest.md#md5) | [MD5Request](message_digest.md#MD5Request) | string |  UnsupportedOperation\( [JavaExceptionType](message_digest.md#JavaExceptionType) \) |

## Operation Description

### md5 <a id="md5"></a>

Operation documentation:

Invocation template:

```jolie
md5@MessageDigest( request )( response )
```

#### Request type <a id="MD5Request"></a>

Type: MD5Request

```jolie
type MD5Request: string {
    .radix?: int
} | raw {
    .radix?: int
}
```

`MD5Request :`

*  `: string`
  * `radix : int`
*  `: raw`
  * `radix : int`

#### Response type

Type: string

`string : string`

#### Possible faults thrown

Fault `UnsupportedOperation` with type `JavaExceptionType`

Fault-handling install template:

```jolie
install ( UnsupportedOperation => /* error-handling code */ )
```

```jolie
type JavaExceptionType: string {
    .stackTrace: string
}
```

