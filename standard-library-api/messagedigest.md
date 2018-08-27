# MessageDigest

## From file `message_digest.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| MessageDigest |  |  |

## List of the available interfaces

* [MessageDigestInterface](messagedigest.md#MessageDigestInterface)

## Interface MessageDigestInterface {#MessageDigestInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [md5](messagedigest.md#md5) | [MD5Request](messagedigest.md#MD5Request)  | string  |  UnsupportedOperation\( [JavaExceptionType](messagedigest.md#JavaExceptionType) \)    |

## Operation list

### md5 {#md5}

```text
md5( MD5Request )( string )
 throws


UnsupportedOperation( JavaExceptionType )
```

## Message type list

### MD5Request {#MD5Request}

```text
type MD5Request: string { 
    .radix?: int
}
```

### JavaExceptionType {#JavaExceptionType}

```text
type JavaExceptionType: string { 
    .stackTrace: string
}
```

## Type list

