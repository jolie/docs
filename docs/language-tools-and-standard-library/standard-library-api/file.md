# File

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| File documentation: |  |  |  |
| File | - | - | [FileInterface](file.md#FileInterface) |

### List of Available Interfaces

### FileInterface <a id="FileInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [convertFromBase64ToBinaryValue](file.md#convertFromBase64ToBinaryValue) | string | raw |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [getMimeType](file.md#getMimeType) | string | string |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \) |
| [convertFromBinaryToBase64Value](file.md#convertFromBinaryToBase64Value) | raw | string |  |
| [toAbsolutePath](file.md#toAbsolutePath) | string | string |  InvalidPathException\( [JavaExceptionType](file.md#JavaExceptionType) \) |
| [getParentPath](file.md#getParentPath) | string | string |  InvalidPathException\( [JavaExceptionType](file.md#JavaExceptionType) \) |
| [list](file.md#list) | [ListRequest](file.md#ListRequest) | [ListResponse](file.md#ListResponse) |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [copyDir](file.md#copyDir) | [CopyDirRequest](file.md#CopyDirRequest) | bool |  FileNotFound\( undefined \)  IOException\( undefined \) |
| [delete](file.md#delete) | [DeleteRequest](file.md#DeleteRequest) | bool |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [getSize](file.md#getSize) | any | int |  |
| [getFileSeparator](file.md#getFileSeparator) | void | string |  |
| [rename](file.md#rename) | [RenameRequest](file.md#RenameRequest) | void |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [readFile](file.md#readFile) | [ReadFileRequest](file.md#ReadFileRequest) | undefined |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [exists](file.md#exists) | string | bool |  |
| [setMimeTypeFile](file.md#setMimeTypeFile) | string | void |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [deleteDir](file.md#deleteDir) | string | bool |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [getServiceDirectory](file.md#getServiceDirectory) | void | string |  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [writeFile](file.md#writeFile) | [WriteFileRequest](file.md#WriteFileRequest) | void |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |
| [mkdir](file.md#mkdir) | string | bool |  |
| [isDirectory](file.md#isDirectory) | string | bool |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)  IOException\( [IOExceptionType](file.md#IOExceptionType) \) |

## Operation Description

### convertFromBase64ToBinaryValue <a id="convertFromBase64ToBinaryValue"></a>

Operation documentation: deprecated, please use base64ToRaw@Converter\(\)\(\) from converter.iol

Invocation template:

```jolie
convertFromBase64ToBinaryValue@File( request )( response )
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

### getMimeType <a id="getMimeType"></a>

Operation documentation: it tests if the specified file or directory exists or not.

Invocation template:

```jolie
getMimeType@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

#### Possible faults thrown

Fault `FileNotFound` with type `FileNotFoundType`

Fault-handling install template:

```jolie
install ( FileNotFound => /* error-handling code */ )
```

```jolie
type FileNotFoundType: WeakJavaExceptionType
```

### convertFromBinaryToBase64Value <a id="convertFromBinaryToBase64Value"></a>

Operation documentation: deprecated, please use rawToBase64@Converter\(\)\(\) from converter.iol

Invocation template:

```jolie
convertFromBinaryToBase64Value@File( request )( response )
```

#### Request type

Type: raw

`raw : raw`

#### Response type

Type: string

`string : string`

### toAbsolutePath <a id="toAbsolutePath"></a>

Operation documentation: Constructs an absolute path to the target file or directory. Can be used to construct an absolute path for new files that does not exist yet. Throws a InvalidPathException fault if input is a relative path is not system recognized path.

Invocation template:

```jolie
toAbsolutePath@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

#### Possible faults thrown

Fault `InvalidPathException` with type `JavaExceptionType`

Fault-handling install template:

```jolie
install ( InvalidPathException => /* error-handling code */ )
```

```jolie
type JavaExceptionType: string {
    .stackTrace: string
}
```

### getParentPath <a id="getParentPath"></a>

Operation documentation: Constructs the path to the parent directory. Can be used to construct paths that does not exist so long as the path uses the system's filesystem path conventions. Throws a InvalidPathException fault if input path is not a recognized system path or if the parent has no parent.

Invocation template:

```jolie
getParentPath@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

#### Possible faults thrown

Fault `InvalidPathException` with type `JavaExceptionType`

Fault-handling install template:

```jolie
install ( InvalidPathException => /* error-handling code */ )
```

```jolie
type JavaExceptionType: string {
    .stackTrace: string
}
```

### list <a id="list"></a>

Operation documentation: The size of any basic type variable.

* raw: buffer size
* void: 0
* boolean: 1
* integer types: int 4, long 8
* double: 8
* string: size in the respective platform encoding, on ASCII and latin1

  equal to the string's length, on Unicode \(UTF-8 etc.\) &gt;= string's length

Invocation template:

```jolie
list@File( request )( response )
```

#### Request type <a id="ListRequest"></a>

Type: ListRequest

```jolie
type ListRequest: void {
    .regex?: string
    .dirsOnly?: bool
    .directory: string
    .recursive?: bool
    .order?: void {
        .byname?: bool
    }
    .info?: bool
}
```

`ListRequest : void`

* `regex : string`
* `dirsOnly : bool`
* `directory : string`
* `recursive : bool`
* `order : void`
  * `byname : bool`
* `info : bool`

#### Response type <a id="ListResponse"></a>

Type: ListResponse

```jolie
type ListResponse: void {
    .result*: string {
        .info?: void {
            .size: long
            .absolutePath: string
            .lastModified: long
            .isDirectory: bool
            .isHidden: bool
        }
    }
}
```

`ListResponse : void`

* `result : string`
  * `info : void`
    * `size : long`
    * `absolutePath : string`
    * `lastModified : long`
    * `isDirectory : bool`
    * `isHidden : bool`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### copyDir <a id="copyDir"></a>

Operation documentation: it copies a source directory into a destination one

Invocation template:

```jolie
copyDir@File( request )( response )
```

#### Request type <a id="CopyDirRequest"></a>

Type: CopyDirRequest

```jolie
type CopyDirRequest: void {
    .from: string
    .to: string
}
```

`CopyDirRequest : void` : from: the source directory to copy to: the target directory to copy into

* `from : string`
* `to : string`

#### Response type

Type: bool

`bool : bool`

#### Possible faults thrown

Fault `FileNotFound` with type `undefined`

Fault-handling install template:

```jolie
install ( FileNotFound => /* error-handling code */ )
```

Fault `IOException` with type `undefined`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

### delete <a id="delete"></a>

Operation documentation: it copies a source directory into a destination one

Invocation template:

```jolie
delete@File( request )( response )
```

#### Request type <a id="DeleteRequest"></a>

Type: DeleteRequest

```jolie
type DeleteRequest: string {
    .isRegex?: int
}
```

`DeleteRequest : string`

* `isRegex : int`

#### Response type

Type: bool

`bool : bool`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### getSize <a id="getSize"></a>

Operation documentation: The size of any basic type variable.

* raw: buffer size
* void: 0
* boolean: 1
* integer types: int 4, long 8
* double: 8
* string: size in the respective platform encoding, on ASCII and latin1

  equal to the string's length, on Unicode \(UTF-8 etc.\) &gt;= string's length

Invocation template:

```jolie
getSize@File( request )( response )
```

#### Request type

Type: any

`any : any`

#### Response type

Type: int

`int : int`

### getFileSeparator <a id="getFileSeparator"></a>

Operation documentation: it tests if the specified file or directory exists or not.

Invocation template:

```jolie
getFileSeparator@File( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: string

`string : string`

### rename <a id="rename"></a>

Operation documentation: The size of any basic type variable.

* raw: buffer size
* void: 0
* boolean: 1
* integer types: int 4, long 8
* double: 8
* string: size in the respective platform encoding, on ASCII and latin1

  equal to the string's length, on Unicode \(UTF-8 etc.\) &gt;= string's length

Invocation template:

```jolie
rename@File( request )( response )
```

#### Request type <a id="RenameRequest"></a>

Type: RenameRequest

```jolie
type RenameRequest: void {
    .filename: string
    .to: string
}
```

`RenameRequest : void`

* `filename : string`
* `to : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### readFile <a id="readFile"></a>

Operation documentation: Reads some file's content into a Jolie structure

```jolie
  Supported formats (ReadFileRequest.format):
  - text (the default)
  - base64 (same as binary but afterwards base64-encoded)
  - binary
  - xml
  - xml_store (a type-annotated XML format)
  - properties (Java properties file)
  - json

  Child values: text, base64 and binary only populate the return's base value, the other formats fill in the child values as well.
  - xml, xml_store: the XML root node will costitute a return's child value, the rest is filled in recursively
  - properties: each property is represented by a child value
  - json: each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest is filled in recursively
```

Invocation template:

```jolie
readFile@File( request )( response )
```

#### Request type <a id="ReadFileRequest"></a>

Type: ReadFileRequest

```jolie
type ReadFileRequest: void {
    .filename: string
    .format?: string {
        .skipMixedText?: bool
        .charset?: string
    }
}
```

`ReadFileRequest : void`

* `filename : string`
* `format : string`
  * `skipMixedText : bool`
  * `charset : string`

#### Response type

Type: undefined

`undefined : any`

#### Possible faults thrown

Fault `FileNotFound` with type `FileNotFoundType`

Fault-handling install template:

```jolie
install ( FileNotFound => /* error-handling code */ )
```

```jolie
type FileNotFoundType: WeakJavaExceptionType
```

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### exists <a id="exists"></a>

Operation documentation: it tests if the specified file or directory exists or not.

Invocation template:

```jolie
exists@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: bool

`bool : bool`

### setMimeTypeFile <a id="setMimeTypeFile"></a>

Operation documentation: it tests if the specified file or directory exists or not.

Invocation template:

```jolie
setMimeTypeFile@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### deleteDir <a id="deleteDir"></a>

Operation documentation: it deletes a directory recursively removing all its contents

Invocation template:

```jolie
deleteDir@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: bool

`bool : bool`

#### Possible faults thrown

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### getServiceDirectory <a id="getServiceDirectory"></a>

Operation documentation: it tests if the specified file or directory exists or not.

Invocation template:

```jolie
getServiceDirectory@File( request )( response )
```

#### Request type

Type: void

`void : void`

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

### writeFile <a id="writeFile"></a>

Operation documentation: Writes a Jolie structure out to an external file

```jolie
  Supported formats (WriteFileRequest.format):
  - text (the default if base value not of type raw)
  - binary (the default if base value of type raw)
  - xml
  - xml_store (a type-annotated XML format)
  - json


  Child values: text and binary only consider the content's (WriteFileRequest.content) base value, the other formats look at the child values as well.
  - xml, xml_store: the XML root node will costitute the content's only child value, the rest gets read out recursively
  - json: each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets read out recursively

     when format is xml and a schema is defined, the resulting xml follows the schema constraints.
   Use "@NameSpace" in order to enable root element identification in the schema by specifing the namespace of the root.
   Use "@Prefix" for forcing a prefix in an element.
   Use "@ForceAttribute" for forcing an attribute in an element even if it is not defined in the corresponding schema
```

Invocation template:

```jolie
writeFile@File( request )( response )
```

#### Request type <a id="WriteFileRequest"></a>

Type: WriteFileRequest

```jolie
type WriteFileRequest: void {
    .filename: string
    .format?: string {
        .schema*: string
        .indent?: bool
        .doctype_system?: string
        .encoding?: string
    }
    .content: undefined
    .append?: int
}
```

`WriteFileRequest : void`

* `filename : string`
* `format : string`
  * `schema : string`
  * `indent : bool`
  * `doctype_system : string`
  * `encoding : string`
* `content : any`
* `append : int`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `FileNotFound` with type `FileNotFoundType`

Fault-handling install template:

```jolie
install ( FileNotFound => /* error-handling code */ )
```

```jolie
type FileNotFoundType: WeakJavaExceptionType
```

Fault `IOException` with type `IOExceptionType`

Fault-handling install template:

```jolie
install ( IOException => /* error-handling code */ )
```

```jolie
type IOExceptionType: JavaExceptionType
```

### mkdir <a id="mkdir"></a>

Operation documentation:

```jolie
 it creates the directory specified in the request root. Returns true if the directory has been
 created with success, false otherwise
```

Invocation template:

```jolie
mkdir@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: bool

`bool : bool`

### isDirectory <a id="isDirectory"></a>

Operation documentation: it returns if a filename is a directory or not. False if the file does not exist.

Invocation template:

```jolie
isDirectory@File( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: bool

`bool : bool`

#### Possible faults thrown

Fault `FileNotFound` with type `FileNotFoundType`

Fault-handling install template:

```jolie
install ( FileNotFound => /* error-handling code */ )
```

```jolie
type FileNotFoundType: WeakJavaExceptionType
```

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

#### WeakJavaExceptionType <a id="WeakJavaExceptionType"></a>

```jolie
type WeakJavaExceptionType: any { .stackTrace?: string }
```

