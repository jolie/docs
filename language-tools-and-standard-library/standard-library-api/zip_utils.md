# ZipUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| ZipUtils documentation: |  |  |  |
| ZipUtils | - | - | [ZipUtilsInterface](zip_utils.md#ZipUtilsInterface) |

### List of Available Interfaces

### ZipUtilsInterface <a id="ZipUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [zip](zip_utils.md#zip) | [ZipRequest](zip_utils.md#ZipRequest) | raw |  IOException\( [IOExceptionType](zip_utils.md#IOExceptionType) \) |
| [IOException](zip_utils.md#IOException) | undefined | undefined |  |
| [unzip](zip_utils.md#unzip) | [UnzipRequest](zip_utils.md#UnzipRequest) | [UnzipResponse](zip_utils.md#UnzipResponse) |  FileNotFound\( undefined \) |
| [readEntry](zip_utils.md#readEntry) | [ReadEntryRequest](zip_utils.md#ReadEntryRequest) | any |  IOException\( [IOExceptionType](zip_utils.md#IOExceptionType) \) |
| [listEntries](zip_utils.md#listEntries) | [ListEntriesRequest](zip_utils.md#ListEntriesRequest) | [ListEntriesResponse](zip_utils.md#ListEntriesResponse) |  IOException\( [IOExceptionType](zip_utils.md#IOExceptionType) \) |

## Operation Description

### zip <a id="zip"></a>

Operation documentation:

Invocation template:

```text
zip@ZipUtils( request )( response )
```

#### Request type <a id="ZipRequest"></a>

Type: ZipRequest

```text
type ZipRequest: undefined
```

`ZipRequest : void`

#### Response type

Type: raw

`raw : raw`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```text
install ( IOException => /* error-handling code */ )
```

```text
type IOExceptionType: JavaExceptionType
```

### IOException <a id="IOException"></a>

Operation documentation:

Invocation template:

```text
IOException@ZipUtils( request )( response )
```

#### Request type

Type: undefined

`undefined : any`

#### Response type

Type: undefined

`undefined : any`

### unzip <a id="unzip"></a>

Operation documentation:

Invocation template:

```text
unzip@ZipUtils( request )( response )
```

#### Request type <a id="UnzipRequest"></a>

Type: UnzipRequest

```text
type UnzipRequest: void {
    .filename: string
    .targetPath: string
}
```

`UnzipRequest : void`

* `filename : string`
* `targetPath : string`

#### Response type <a id="UnzipResponse"></a>

Type: UnzipResponse

```text
type UnzipResponse: void {
    .entry*: string
}
```

`UnzipResponse : void`

* `entry : string`

#### Possible faults thrown

Fault `FileNotFound` with type `undefined`

Fault-handling install template:

```text
install ( FileNotFound => /* error-handling code */ )
```

### readEntry <a id="readEntry"></a>

Operation documentation:

Invocation template:

```text
readEntry@ZipUtils( request )( response )
```

#### Request type <a id="ReadEntryRequest"></a>

Type: ReadEntryRequest

```text
type ReadEntryRequest: void {
    .entry: string
    .filename?: string
    .archive?: raw
}
```

`ReadEntryRequest : void`

* `entry : string`
* `filename : string`
* `archive : raw`

#### Response type

Type: any

`any : any`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```text
install ( IOException => /* error-handling code */ )
```

```text
type IOExceptionType: JavaExceptionType
```

### listEntries <a id="listEntries"></a>

Operation documentation:

Invocation template:

```text
listEntries@ZipUtils( request )( response )
```

#### Request type <a id="ListEntriesRequest"></a>

Type: ListEntriesRequest

```text
type ListEntriesRequest: void {
    .filename?: string
    .archive?: raw
}
```

`ListEntriesRequest : void`

* `filename : string`
* `archive : raw`

#### Response type <a id="ListEntriesResponse"></a>

Type: ListEntriesResponse

```text
type ListEntriesResponse: void {
    .entry*: string
}
```

`ListEntriesResponse : void`

* `entry : string`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```text
install ( IOException => /* error-handling code */ )
```

```text
type IOExceptionType: JavaExceptionType
```

### Subtypes

#### JavaExceptionType <a id="JavaExceptionType"></a>

```
type JavaExceptionType: string { .stackTrace: string }
```

