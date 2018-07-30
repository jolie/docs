# Converter

## From file `converter.iol`

| Port Name | Location | Protocol |
| --- | --- |
| Converter |  |  |

## List of the available interfaces

* [ConverterInterface](converter.md#ConverterInterface)

## Interface ConverterInterface {#ConverterInterface}

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- |
| [base64ToRaw](converter.md#base64ToRaw) | string  | raw  |  IOException\( [IOExceptionType](converter.md#IOExceptionType) \)    |
| [rawToBase64](converter.md#rawToBase64) | raw  | string  |  |
| [rawToString](converter.md#rawToString) | [RawToStringRequest](converter.md#RawToStringRequest)  | string  |  IOException\( [IOExceptionType](converter.md#IOExceptionType) \)    |
| [stringToRaw](converter.md#stringToRaw) | [StringToRawRequest](converter.md#StringToRawRequest)  | raw  |  IOException\( [IOExceptionType](converter.md#IOExceptionType) \)    |

## Operation list

### stringToRaw {#stringToRaw}

```text
stringToRaw( StringToRawRequest )( raw )
 throws


IOException( IOExceptionType )
```

### base64ToRaw {#base64ToRaw}

```text
base64ToRaw( string )( raw )
 throws


IOException( IOExceptionType )
```

### rawToBase64 {#rawToBase64}

```text
rawToBase64( raw )( string )
```

### rawToString {#rawToString}

```text
rawToString( RawToStringRequest )( string )
 throws


IOException( IOExceptionType )
```

## Message type list

### StringToRawRequest {#StringToRawRequest}

```text
type StringToRawRequest: string { 
    .charset?: string
}
```

### IOExceptionType {#IOExceptionType}

```text
type IOExceptionType: JavaExceptionType
```

### RawToStringRequest {#RawToStringRequest}

```text
type RawToStringRequest: raw { 
    .charset?: string
}
```

## Type list

