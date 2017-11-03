# JolieDoc for Port File #

## From file `file.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>File</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  FileInterface 

--------------------

## Interface FileInterface ##

from: the source directory to copy  
to: the target directory to copy into

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">convertFromBase64ToBinaryValue</a></td>
   <td>string<br></td>
   <td>raw<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">convertFromBinaryToBase64Value</a></td>
   <td>raw<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">copyDir</a></td>
   <td><a rel="nofollow">CopyDirRequest</a><br></td>
   <td>bool<br></td>
   <td>FileNotFound,&nbsp;<br>IOException,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">delete</a></td>
   <td><a rel="nofollow">DeleteRequest</a><br></td>
   <td>bool<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">deleteDir</a></td>
   <td>string<br></td>
   <td>bool<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">exists</a></td>
   <td>string<br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getFileSeparator</a></td>
   <td>void<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getMimeType</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td>FileNotFound( <a rel="nofollow">FileNotFoundType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getParentPath</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td>InvalidPathException( <a rel="nofollow">JavaExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getServiceDirectory</a></td>
   <td>void<br></td>
   <td>string<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getSize</a></td>
   <td>any<br></td>
   <td>int<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">isDirectory</a></td>
   <td>string<br></td>
   <td>bool<br></td>
   <td>FileNotFound( <a rel="nofollow">FileNotFoundType</a> )&nbsp;&nbsp;<br>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">list</a></td>
   <td><a rel="nofollow">ListRequest</a><br></td>
   <td><a rel="nofollow">ListResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">mkdir</a></td>
   <td>string<br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">readFile</a></td>
   <td><a rel="nofollow">ReadFileRequest</a><br></td>
   <td>undefined<br></td>
   <td>FileNotFound( <a rel="nofollow">FileNotFoundType</a> )&nbsp;&nbsp;<br>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">rename</a></td>
   <td><a rel="nofollow">RenameRequest</a><br></td>
   <td>void<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">setMimeTypeFile</a></td>
   <td>string<br></td>
   <td>void<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">toAbsolutePath</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td>InvalidPathException( <a rel="nofollow">JavaExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">writeFile</a></td>
   <td><a rel="nofollow">WriteFileRequest</a><br></td>
   <td>void<br></td>
   <td>FileNotFound( <a rel="nofollow">FileNotFoundType</a> )&nbsp;&nbsp;<br>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### convertFromBase64ToBinaryValue ###

    convertFromBase64ToBinaryValue( string )( raw ) throws
    				IOException( IOExceptionType )

deprecated, please use base64ToRaw@Converter()() from converter.iol

### getMimeType ###

    getMimeType( string )( string ) throws
    				FileNotFound( FileNotFoundType )

### convertFromBinaryToBase64Value ###

    convertFromBinaryToBase64Value( raw )( string )

deprecated, please use rawToBase64@Converter()() from converter.iol

### toAbsolutePath ###

    toAbsolutePath( string )( string ) throws
    				InvalidPathException( JavaExceptionType )

Constructs an absolute path to the target file or directory.  
Can be used to construct an absolute path for new files that does not exist yet.  
Throws a InvalidPathException fault if input is a relative path is not system recognized path.

### getParentPath ###

    getParentPath( string )( string ) throws
    				InvalidPathException( JavaExceptionType )

Constructs the path to the parent directory.  
Can be used to construct paths that does not exist so long as the path uses the system's filesystem path conventions.  
Throws a InvalidPathException fault if input path is not a recognized system path or if the parent has no parent.

### list ###

    list( ListRequest )( ListResponse )

### copyDir ###

    copyDir( CopyDirRequest )( bool ) throws
    				FileNotFound
    				IOException

it copies a source directory into a destination one

### delete ###

    delete( DeleteRequest )( bool ) throws
    				IOException( IOExceptionType )

### getSize ###

    getSize( any )( int )

The size of any basic type variable.  
\- raw: buffer size  
\- void: 0  
\- boolean: 1  
\- integer types: int 4, long 8  
\- double: 8  
\- string: size in the respective platform encoding, on ASCII and latin1  
equal to the string's length, on Unicode (UTF-8 etc.) >= string's length

### getFileSeparator ###

    getFileSeparator( void )( string )

### rename ###

    rename( RenameRequest )( void ) throws
    				IOException( IOExceptionType )

### readFile ###

    readFile( ReadFileRequest )( undefined ) throws
    				FileNotFound( FileNotFoundType )
    				IOException( IOExceptionType )

Reads some file's content into a Jolie structure  
  
Supported formats (ReadFileRequest.format):  
\- text (the default)  
\- base64 (same as binary but afterwards base64-encoded)  
\- binary  
\- xml  
\- xml\_store (a type-annotated XML format)  
\- properties (Java properties file)  
\- json  
  
Child values: text, base64 and binary only populate the return's base value, the other formats fill in the child values as well.  
\- xml, xml\_store: the XML root node will costitute a return's child value, the rest is filled in recursively  
\- properties: each property is represented by a child value  
\- json: each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "\_" helper childs (e.g. a\[i\]\[j\] -> a.\_\[i\].\_\[j\]), the rest is filled in recursively

### exists ###

    exists( string )( bool )

it tests if the specified file or directory exists or not.

### setMimeTypeFile ###

    setMimeTypeFile( string )( void ) throws
    				IOException( IOExceptionType )

### deleteDir ###

    deleteDir( string )( bool ) throws
    				IOException( IOExceptionType )

it deletes a directory recursively removing all its contents

### getServiceDirectory ###

    getServiceDirectory( void )( string ) throws
    				IOException( IOExceptionType )

### writeFile ###

    writeFile( WriteFileRequest )( void ) throws
    				FileNotFound( FileNotFoundType )
    				IOException( IOExceptionType )

Writes a Jolie structure out to an external file  
  
Supported formats (WriteFileRequest.format):  
\- text (the default if base value not of type raw)  
\- binary (the default if base value of type raw)  
\- xml  
\- xml\_store (a type-annotated XML format)  
\- json  
  
  
Child values: text and binary only consider the content's (WriteFileRequest.content) base value, the other formats look at the child values as well.  
\- xml, xml\_store: the XML root node will costitute the content's only child value, the rest gets read out recursively  
\- json: each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "\_" helper childs disappear (e.g. a.\_\[i\].\_\[j\] -> a\[i\]\[j\]), the rest gets read out recursively

### mkdir ###

    mkdir( string )( bool )

it creates the directory specified in the request root. Returns true if the directory has been  
created with success, false otherwise

### isDirectory ###

    isDirectory( string )( bool ) throws
    				FileNotFound( FileNotFoundType )
    				IOException( IOExceptionType )

it returns if a filename is a directory or not. False if the file does not exist.

--------------------

## Message type list ##

### IOExceptionType ###

    type IOExceptionType: JavaExceptionType FileNotFoundType type FileNotFoundType: WeakJavaExceptionType JavaExceptionType type JavaExceptionType: string { 
        .stackTrace: string
    } ListRequest type ListRequest: void { 
        .regex?: string
        .dirsOnly?: bool
        .directory: string
        .order?: void { 
            .byname?: bool
        }
        .info?: bool
    } ListResponse type ListResponse: void { 
        .result*: string { 
            .info?: void { 
                .size: long
                .absolutePath: string
                .lastModified: long
                .isDirectory: bool
                .isHidden: bool
            }
        }
    } CopyDirRequest type CopyDirRequest: void { 
        .from: string
        .to: string
    } DeleteRequest type DeleteRequest: string { 
        .isRegex?: int
    } RenameRequest type RenameRequest: void { 
        .filename: string
        .to: string
    } ReadFileRequest type ReadFileRequest: void { 
        .filename: string
        .format?: string { 
            .charset?: string
        }
    } WriteFileRequest type WriteFileRequest: void { 
        .filename: string
        .format?: string { 
            .schema*: string
            .indent?: bool
            .doctype_system?: string
            .encoding?: string
        }
        .content: undefined
        .append?: int
    } Type list