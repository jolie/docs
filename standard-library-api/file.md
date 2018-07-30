# File

## From file `file.iol`

| Port Name | Location | Protocol |
| --- | --- |
| File |  |  |

## List of the available interfaces

* [FileInterface](file.md#FileInterface)

## Interface FileInterface {#FileInterface}

 from: the source directory to copy  
to: the target directory to copy into

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [convertFromBase64ToBinaryValue](file.md#convertFromBase64ToBinaryValue) | string  | raw  |  IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [convertFromBinaryToBase64Value](file.md#convertFromBinaryToBase64Value) | raw  | string  |  |
| [copyDir](file.md#copyDir) | [CopyDirRequest](file.md#CopyDirRequest)  | bool  |  FileNotFound,   IOException,   |
| [delete](file.md#delete) | [DeleteRequest](file.md#DeleteRequest)  | bool  |  IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [deleteDir](file.md#deleteDir) | string  | bool  |  IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [exists](file.md#exists) | string  | bool  |  |
| [getFileSeparator](file.md#getFileSeparator) | void  | string  |  |
| [getMimeType](file.md#getMimeType) | string  | string  |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)    |
| [getParentPath](file.md#getParentPath) | string  | string  |  InvalidPathException\( [JavaExceptionType](file.md#JavaExceptionType) \)    |
| [getServiceDirectory](file.md#getServiceDirectory) | void  | string  |  IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [getSize](file.md#getSize) | any  | int  |  |
| [isDirectory](file.md#isDirectory) | string  | bool  |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)    IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [list](file.md#list) | [ListRequest](file.md#ListRequest)  | [ListResponse](file.md#ListResponse)  |  |
| [mkdir](file.md#mkdir) | string  | bool  |  |
| [readFile](file.md#readFile) | [ReadFileRequest](file.md#ReadFileRequest)  | undefined  |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)    IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [rename](file.md#rename) | [RenameRequest](file.md#RenameRequest)  | void  |  IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [setMimeTypeFile](file.md#setMimeTypeFile) | string  | void  |  IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |
| [toAbsolutePath](file.md#toAbsolutePath) | string  | string  |  InvalidPathException\( [JavaExceptionType](file.md#JavaExceptionType) \)    |
| [writeFile](file.md#writeFile) | [WriteFileRequest](file.md#WriteFileRequest)  | void  |  FileNotFound\( [FileNotFoundType](file.md#FileNotFoundType) \)    IOException\( [IOExceptionType](file.md#IOExceptionType) \)    |

## Operation list

### convertFromBase64ToBinaryValue {#convertFromBase64ToBinaryValue}

```text
convertFromBase64ToBinaryValue( string )( raw )
 throws


IOException( IOExceptionType )
```

deprecated, please use base64ToRaw@Converter\(\)\(\) from converter.iol

### getMimeType {#getMimeType}

```text
getMimeType( string )( string )
 throws


FileNotFound( FileNotFoundType )
```

### convertFromBinaryToBase64Value {#convertFromBinaryToBase64Value}

```text
convertFromBinaryToBase64Value( raw )( string )
```

deprecated, please use rawToBase64@Converter\(\)\(\) from converter.iol

### toAbsolutePath {#toAbsolutePath}

```text
toAbsolutePath( string )( string )
 throws


InvalidPathException( JavaExceptionType )
```

Constructs an absolute path to the target file or directory.  
 Can be used to construct an absolute path for new files that does not exist yet.  
 Throws a InvalidPathException fault if input is a relative path is not system recognized path.

### getParentPath {#getParentPath}

```text
getParentPath( string )( string )
 throws


InvalidPathException( JavaExceptionType )
```

Constructs the path to the parent directory.  
 Can be used to construct paths that does not exist so long as the path uses the system's filesystem path conventions.  
 Throws a InvalidPathException fault if input path is not a recognized system path or if the parent has no parent.

### list {#list}

```text
list( ListRequest )( ListResponse )
```

### copyDir {#copyDir}

```text
copyDir( CopyDirRequest )( bool )
 throws


FileNotFound


IOException
```

it copies a source directory into a destination one

### delete {#delete}

```text
delete( DeleteRequest )( bool )
 throws


IOException( IOExceptionType )
```

### getSize {#getSize}

```text
getSize( any )( int )
```

The size of any basic type variable.  
 - raw: buffer size  
 - void: 0  
 - boolean: 1  
 - integer types: int 4, long 8  
 - double: 8  
 - string: size in the respective platform encoding, on ASCII and latin1  
 equal to the string's length, on Unicode \(UTF-8 etc.\) &gt;= string's length

### getFileSeparator {#getFileSeparator}

```text
getFileSeparator( void )( string )
```

### rename {#rename}

```text
rename( RenameRequest )( void )
 throws


IOException( IOExceptionType )
```

### readFile {#readFile}

```text
readFile( ReadFileRequest )( undefined )
 throws


FileNotFound( FileNotFoundType )


IOException( IOExceptionType )
```

Reads some file's content into a Jolie structure  
  
 Supported formats \(ReadFileRequest.format\):  
 - text \(the default\)  
 - base64 \(same as binary but afterwards base64-encoded\)  
 - binary  
 - xml  
 - xml\_store \(a type-annotated XML format\)  
 - properties \(Java properties file\)  
 - json  
  
 Child values: text, base64 and binary only populate the return's base value, the other formats fill in the child values as well.  
 - xml, xml\_store: the XML root node will costitute a return's child value, the rest is filled in recursively  
 - properties: each property is represented by a child value  
 - json: each attribute corresponds to a child value, the default values \(attribute "$" or singular value\) are saved as the base values, nested arrays get mapped with the "\_" helper childs \(e.g. a\[i\]\[j\] -&gt; a.\_\[i\].\_\[j\]\), the rest is filled in recursively

### exists {#exists}

```text
exists( string )( bool )
```

it tests if the specified file or directory exists or not.

### setMimeTypeFile {#setMimeTypeFile}

```text
setMimeTypeFile( string )( void )
 throws


IOException( IOExceptionType )
```

### deleteDir {#deleteDir}

```text
deleteDir( string )( bool )
 throws


IOException( IOExceptionType )
```

it deletes a directory recursively removing all its contents

### getServiceDirectory {#getServiceDirectory}

```text
getServiceDirectory( void )( string )
 throws


IOException( IOExceptionType )
```

### writeFile {#writeFile}

```text
writeFile( WriteFileRequest )( void )
 throws


FileNotFound( FileNotFoundType )


IOException( IOExceptionType )
```

Writes a Jolie structure out to an external file  
  
 Supported formats \(WriteFileRequest.format\):  
 - text \(the default if base value not of type raw\)  
 - binary \(the default if base value of type raw\)  
 - xml  
 - xml\_store \(a type-annotated XML format\)  
 - json  
  
  
 Child values: text and binary only consider the content's \(WriteFileRequest.content\) base value, the other formats look at the child values as well.  
 - xml, xml\_store: the XML root node will costitute the content's only child value, the rest gets read out recursively  
 - json: each child value corresponds to an attribute, the base values are saved as the default values \(attribute "$" or singular value\), the "\_" helper childs disappear \(e.g. a.\_\[i\].\_\[j\] -&gt; a\[i\]\[j\]\), the rest gets read out recursively

### mkdir {#mkdir}

```text
mkdir( string )( bool )
```

it creates the directory specified in the request root. Returns true if the directory has been  
 created with success, false otherwise

### isDirectory {#isDirectory}

```text
isDirectory( string )( bool )
 throws


FileNotFound( FileNotFoundType )


IOException( IOExceptionType )
```

it returns if a filename is a directory or not. False if the file does not exist.

## Message type list

### IOExceptionType {#IOExceptionType}

```text
type IOExceptionType: JavaExceptionType
```

### FileNotFoundType {#FileNotFoundType}

```text
type FileNotFoundType: WeakJavaExceptionType
```

### JavaExceptionType {#JavaExceptionType}

```text
type JavaExceptionType: string { 
    .stackTrace: string
}
```

### ListRequest {#ListRequest}

```text
type ListRequest: void { 
    .regex?: string
    .dirsOnly?: bool
    .directory: string
    .order?: void { 
        .byname?: bool
    }
    .info?: bool
}
```

### ListResponse {#ListResponse}

```text
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

### CopyDirRequest {#CopyDirRequest}

```text
type CopyDirRequest: void { 
    .from: string
    .to: string
}
```

### DeleteRequest {#DeleteRequest}

```text
type DeleteRequest: string { 
    .isRegex?: int
}
```

### RenameRequest {#RenameRequest}

```text
type RenameRequest: void { 
    .filename: string
    .to: string
}
```

### ReadFileRequest {#ReadFileRequest}

```text
type ReadFileRequest: void { 
    .filename: string
    .format?: string { 
        .charset?: string
    }
}
```

### WriteFileRequest {#WriteFileRequest}

```text
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

## Type list

