# Converter

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Converter documentation: |  |  |  |
| Converter | - | - | [ConverterInterface](converter.md#ConverterInterface) |

### List of Available Interfaces

### ConverterInterface <a id="ConverterInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [stringToRaw](converter.md#stringToRaw) | [StringToRawRequest](converter.md#StringToRawRequest) | raw |  IOException\( [IOExceptionType](converter.md#IOExceptionType) \) |
| [base64ToRaw](converter.md#base64ToRaw) | string | raw |  IOException\( [IOExceptionType](converter.md#IOExceptionType) \) |
| [rawToBase64](converter.md#rawToBase64) | raw | string |  |
| [rawToString](converter.md#rawToString) | [RawToStringRequest](converter.md#RawToStringRequest) | string |  IOException\( [IOExceptionType](converter.md#IOExceptionType) \) |

## Operation Description

### stringToRaw <a id="stringToRaw"></a>

Operation documentation: string &lt;-&gt; raw \(byte arrays\) conversion methods

Invocation template:

```jolie
stringToRaw@Converter( request )( response )
```

#### Request type <a id="StringToRawRequest"></a>

Type: StringToRawRequest

```jolie
type StringToRawRequest: string {
    .charset?: string
}
```

`StringToRawRequest : string`

* `charset : string` : set the encoding. Default: system \(eg. for Unix-like OS UTF-8\)

#### Response type

Type: raw

`raw : raw`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### base64ToRaw <a id="base64ToRaw"></a>

Operation documentation:

Invocation template:

```jolie
base64ToRaw@Converter( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: raw

`raw : raw`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### rawToBase64 <a id="rawToBase64"></a>

Operation documentation:

Invocation template:

```jolie
rawToBase64@Converter( request )( response )
```

#### Request type

Type: raw

`raw : raw`

#### Response type

Type: string

`string : string`

### rawToString <a id="rawToString"></a>

Operation documentation: string &lt;-&gt; raw \(byte arrays\) conversion methods

Invocation template:

```jolie
rawToString@Converter( request )( response )
```

#### Request type <a id="RawToStringRequest"></a>

Type: RawToStringRequest

```jolie
type RawToStringRequest: raw {
    .charset?: string
}
```

`RawToStringRequest : raw` : The byte array to be converted

* `charset : string` : set the encoding. Default: system \(eg. for Unix-like OS UTF-8\)

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

