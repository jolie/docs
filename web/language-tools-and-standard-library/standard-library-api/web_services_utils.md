# WebServicesUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| WebServicesUtils documentation: |  |  |  |
| WebServicesUtils | - | - | [WebServicesUtilsInterface](web_services_utils.md#WebServicesUtilsInterface) |

### List of Available Interfaces

### WebServicesUtilsInterface <a id="WebServicesUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [wsdlToJolie](web_services_utils.md#wsdlToJolie) | string | string |  IOException\( [IOExceptionType](web_services_utils.md#IOExceptionType) \) |

## Operation Description

### wsdlToJolie <a id="wsdlToJolie"></a>

Operation documentation:

Invocation template:

```jolie
wsdlToJolie@WebServicesUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### Subtypes

#### JavaExceptionType <a id="JavaExceptionType"></a>

```
type JavaExceptionType: string { .stackTrace: string }
```

