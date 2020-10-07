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

```jolie
zip@ZipUtils( request )( response )
```

#### Request type <a id="ZipRequest"></a>

Type: ZipRequest

```jolie
type ZipRequest: undefined
```

`ZipRequest : void`

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

### IOException <a id="IOException"></a>

Operation documentation:

Invocation template:

```jolie
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

```jolie
unzip@ZipUtils( request )( response )
```

#### Request type <a id="UnzipRequest"></a>

Type: UnzipRequest

```jolie
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

```jolie
type UnzipResponse: void {
    .entry*: string
}
```

`UnzipResponse : void`

* `entry : string`

#### Possible faults thrown

Fault `FileNotFound` with type `undefined`

Fault-handling install template:

```jolie
install ( FileNotFound => /* error-handling code */ )
```

### readEntry <a id="readEntry"></a>

Operation documentation:

Invocation template:

```jolie
readEntry@ZipUtils( request )( response )
```

#### Request type <a id="ReadEntryRequest"></a>

Type: ReadEntryRequest

```jolie
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

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### listEntries <a id="listEntries"></a>

Operation documentation:

Invocation template:

```jolie
listEntries@ZipUtils( request )( response )
```

#### Request type <a id="ListEntriesRequest"></a>

Type: ListEntriesRequest

```jolie
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

```jolie
type ListEntriesResponse: void {
    .entry*: string
}
```

`ListEntriesResponse : void`

* `entry : string`

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

```jolie
type JavaExceptionType: string { .stackTrace: string }
```

