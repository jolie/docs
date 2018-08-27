# SecurityUtils

## From file `security_utils.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| SecurityUtils |  |  |

## List of the available interfaces

* [SecurityUtilsInterface](securityutils.md#SecurityUtilsInterface)

## Interface SecurityUtilsInterface {#SecurityUtilsInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [createSecureToken](securityutils.md#createSecureToken) | void  | string  |  |
| [secureRandom](securityutils.md#secureRandom) | [SecureRandomRequest](securityutils.md#SecureRandomRequest)  | raw  |  |

## Operation list

### secureRandom {#secureRandom}

```text
secureRandom( SecureRandomRequest )( raw )
```

### createSecureToken {#createSecureToken}

```text
createSecureToken( void )( string )
```

## Message type list

### SecureRandomRequest {#SecureRandomRequest}

```text
type SecureRandomRequest: void { 
    .size: int
}
```

## Type list

