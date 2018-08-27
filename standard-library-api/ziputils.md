# ZipUtils

## From file `zip_utils.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| ZipUtils |  |  |

## List of the available interfaces

* [ZipUtilsInterface](ziputils.md#ZipUtilsInterface)

## Interface ZipUtilsInterface {#ZipUtilsInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [IOException](ziputils.md#IOException) | undefined  | undefined  |  |
| [readEntry](ziputils.md#readEntry) | [ReadEntryRequest](ziputils.md#ReadEntryRequest)  | any  |  IOException\( [IOExceptionType](ziputils.md#IOExceptionType) \)    |
| [unzip](ziputils.md#unzip) | [UnzipRequest](ziputils.md#UnzipRequest)  | [UnzipResponse](ziputils.md#UnzipResponse)  |  FileNotFound,   |
| [zip](ziputils.md#zip) | ZipRequest  | raw  |  IOException\( [IOExceptionType](ziputils.md#IOExceptionType) \)    |

## Operation list

### zip {#zip}

```text
zip( ZipRequest )( raw )
 throws


IOException( IOExceptionType )
```

### IOException {#IOException}

```text
IOException( undefined )( undefined )
```

### unzip {#unzip}

```text
unzip( UnzipRequest )( UnzipResponse )
 throws


FileNotFound
```

### readEntry {#readEntry}

```text
readEntry( ReadEntryRequest )( any )
 throws


IOException( IOExceptionType )
```

## Message type list

### ZipRequest {#ZipRequest}

```text
type ZipRequest: undefined
```

### IOExceptionType {#IOExceptionType}

```text
type IOExceptionType: JavaExceptionType
```

### UnzipRequest {#UnzipRequest}

```text
type UnzipRequest: void { 
    .filename: string
    .targetPath: string
}
```

### UnzipResponse {#UnzipResponse}

```text
type UnzipResponse: void { 
    .entry*: string
}
```

### ReadEntryRequest {#ReadEntryRequest}

```text
type ReadEntryRequest: void { 
    .entry: string
    .filename: string
}
```

## Type list

