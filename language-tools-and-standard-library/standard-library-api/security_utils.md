# SecurityUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| SecurityUtils documentation: |  |  |  |
| SecurityUtils | - | - | [SecurityUtilsInterface](security_utils.md#SecurityUtilsInterface) |

### List of Available Interfaces

### SecurityUtilsInterface <a id="SecurityUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [secureRandom](security_utils.md#secureRandom) | [SecureRandomRequest](security_utils.md#SecureRandomRequest) | raw |  |
| [createSecureToken](security_utils.md#createSecureToken) | void | string |  |

## Operation Description

### secureRandom <a id="secureRandom"></a>

Operation documentation:

Invocation template:

```jolie
secureRandom@SecurityUtils( request )( response )
```

#### Request type <a id="SecureRandomRequest"></a>

Type: SecureRandomRequest

```jolie
type SecureRandomRequest: void {
    .size: int
}
```

`SecureRandomRequest : void`

* `size : int`

#### Response type

Type: raw

`raw : raw`

### createSecureToken <a id="createSecureToken"></a>

Operation documentation:

Invocation template:

```jolie
createSecureToken@SecurityUtils( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: string

`string : string`

