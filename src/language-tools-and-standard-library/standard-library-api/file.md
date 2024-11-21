<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service File

> from file import File

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#FileInterface'>FileInterface</a> |

### List of Available Interfaces

### FileInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| convertFromBase64ToBinaryValue | <a href="#string">string</a> | <a href='#raw'>raw</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  deprecated, please use base64ToRaw@Converter()() from converter.iol  |
| convertFromBinaryToBase64Value | <a href="#raw">raw</a> | <a href='#string'>string</a> | - |  deprecated, please use rawToBase64@Converter()() from converter.iol  |
| copyDir | <a href="#CopyDirRequest">CopyDirRequest</a> | <a href='#bool'>bool</a> | <details><summary>FileNotFound</summary>undefined</details><details><summary>IOException</summary>undefined</details> | <br>	  it copies a source directory into a destination one<br>	 |
| delete | <a href="#DeleteRequest">DeleteRequest</a> | <a href='#bool'>bool</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  |
| deleteDir | <a href="#string">string</a> | <a href='#bool'>bool</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> | <br>	   it deletes a directory recursively removing all its contents<br>	 |
| exists | <a href="#string">string</a> | <a href='#bool'>bool</a> | - | <br>	 it tests if the specified file or directory exists or not.<br>	 |
| getFileSeparator | <a href="#void">void</a> | <a href='#string'>string</a> | - |  |
| getMimeType | <a href="#string">string</a> | <a href='#string'>string</a> | <details><summary>FileNotFound</summary><a href='#FileNotFoundType'>FileNotFoundType</a></details> |  |
| getParentPath | <a href="#string">string</a> | <a href='#string'>string</a> | <details><summary>InvalidPathException</summary><a href='#0#JavaExceptionType'>0#JavaExceptionType</a></details> | <br>	  Constructs the path to the parent directory.<br>	  Can be used to construct paths that does not exist so long as the path uses the system's filesystem path conventions.<br>	  Throws a InvalidPathException fault if input path is not a recognized system path or if the parent has no parent.<br>	  |
| getRealServiceDirectory | <a href="#void">void</a> | <a href='#string'>string</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  Returns the real filesystem directory (following links) from which the service has been launched  |
| getRealServiceFileName | <a href="#void">void</a> | <a href='#string'>string</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  Returns the name of the real file (following links) from which the service has been launched  |
| getServiceDirectory | <a href="#void">void</a> | <a href='#string'>string</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  Returns the filesystem directory from which the service has been launched  |
| getServiceFileName | <a href="#void">void</a> | <a href='#string'>string</a> | - |  Returns the name of the file from which the service has been launched  |
| getServiceParentPath | <a href="#void">void</a> | <a href='#string'>string</a> | - |  Returns the parent path of the service  |
| getSize | <a href="#any">any</a> | <a href='#int'>int</a> | - | <br>	  The size of any basic type variable.<br>	  - raw: buffer size<br>	  - void: 0<br>	  - boolean: 1<br>	  - integer types: int 4, long 8<br>	  - double: 8<br>	  - string: size in the respective platform encoding, on ASCII and latin1<br>	    equal to the string's length, on Unicode (UTF-8 etc.) >= string's length<br>	  |
| isDirectory | <a href="#string">string</a> | <a href='#bool'>bool</a> | <details><summary>FileNotFound</summary><a href='#FileNotFoundType'>FileNotFoundType</a></details><details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> | <br>	  it returns if a filename is a directory or not. False if the file does not exist.<br>	 |
| list | <a href="#ListRequest">ListRequest</a> | <a href='#ListResponse'>ListResponse</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  |
| mkdir | <a href="#string">string</a> | <a href='#bool'>bool</a> | - | <br>	<br>	 it creates the directory specified in the request root. Returns true if the directory has been<br>	 created with success, false otherwise<br>	 |
| readFile | <a href="#ReadFileRequest">ReadFileRequest</a> | <a href='#undefined'>undefined</a> | <details><summary>FileNotFound</summary><a href='#FileNotFoundType'>FileNotFoundType</a></details><details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> | <br>	  Reads some file's content into a Jolie structure<br>	 <br>	  Supported formats (ReadFileRequest.format):<br>	  - text (the default)<br>	  - base64 (same as binary but afterwards base64-encoded)<br>	  - binary<br>	  - xml<br>	  - xml_store (a type-annotated XML format)<br>	  - properties (Java properties file)<br>	  - json<br>	 <br>	  Child values: text, base64 and binary only populate the return's base value, the other formats fill in the child values as well.<br>	  - xml, xml_store: the XML root node will costitute a return's child value, the rest is filled in recursively<br>	  - properties: each property is represented by a child value<br>	  - json: each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest is filled in recursively<br>	  |
| rename | <a href="#RenameRequest">RenameRequest</a> | <a href='#void'>void</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  |
| setMimeTypeFile | <a href="#string">string</a> | <a href='#void'>void</a> | <details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> |  |
| toAbsolutePath | <a href="#string">string</a> | <a href='#string'>string</a> | <details><summary>InvalidPathException</summary><a href='#0#JavaExceptionType'>0#JavaExceptionType</a></details> | <br>	  Constructs an absolute path to the target file or directory.<br>	  Can be used to construct an absolute path for new files that does not exist yet.<br>	  Throws a InvalidPathException fault if input is a relative path is not system recognized path.<br>	  |
| writeFile | <a href="#WriteFileRequest">WriteFileRequest</a> | <a href='#void'>void</a> | <details><summary>FileNotFound</summary><a href='#FileNotFoundType'>FileNotFoundType</a></details><details><summary>IOException</summary><a href='#3#IOExceptionType'>3#IOExceptionType</a></details> | <br>	  Writes a Jolie structure out to an external file<br>	 <br>	  Supported formats (WriteFileRequest.format):<br>	  - text (the default if base value not of type raw)<br>	  - binary (the default if base value of type raw)<br>	  - xml<br>	  - xml_store (a type-annotated XML format)<br>	  - json<br>	 <br>	 <br>	  Child values: text and binary only consider the content's (WriteFileRequest.content) base value, the other formats look at the child values as well.<br>	  - xml, xml_store: the XML root node will costitute the content's only child value, the rest gets read out recursively<br>	  - json: each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets read out recursively<br>	 <br>	 	when format is xml and a schema is defined, the resulting xml follows the schema constraints.<br>	   Use "@NameSpace" in order to enable root element identification in the schema by specifing the namespace of the root.<br>	   Use "@Prefix" for forcing a prefix in an element.<br>	   Use "@ForceAttribute" for forcing an attribute in an element even if it is not defined in the corresponding schema<br>	  |


### Types

<details>
<summary><span id="CopyDirRequest">CopyDirRequest: &#10;from: the source directory to copy&#10;to: the target directory to copy into&#10;
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;from[1,1]: string // 
&nbsp;&nbsp;to[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="DeleteRequest">DeleteRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;isRegex[0,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="FileNotFoundType">FileNotFoundType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#WeakJavaExceptionType'>WeakJavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="IOExceptionType">IOExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#JavaExceptionType'>JavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="IOExceptionType">IOExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#IOExceptionType'>IOExceptionType</a>
</pre>
</details>
<details>
<summary><span id="JavaExceptionType">JavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;stackTrace[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="JavaExceptionType">JavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#JavaExceptionType'>JavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="ListRequest">ListRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;regex[0,1]: string // 
&nbsp;&nbsp;dirsOnly[0,1]: bool // 
&nbsp;&nbsp;directory[1,1]: string // 
&nbsp;&nbsp;recursive[0,1]: bool // 
&nbsp;&nbsp;order[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;byname[0,1]: bool // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;info[0,1]: bool // 
&#125;
</pre>
</details>
<details>
<summary><span id="ListResponse">ListResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;result[0,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;info[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;size[1,1]: long // 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;absolutePath[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lastModified[1,1]: long // 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;isDirectory[1,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;isHidden[1,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="ReadFileRequest">ReadFileRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[1,1]: string // 
&nbsp;&nbsp;format[0,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;skipMixedText[0,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;charset[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;stream[0,1]: bool //  if format is "yaml" and this is true, the file is read as a stream of multiple YAML documents which will be returned as a "documents" array in the response
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="RenameRequest">RenameRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[1,1]: string // 
&nbsp;&nbsp;to[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="WeakJavaExceptionType">WeakJavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
any &#123;
&nbsp;&nbsp;stackTrace[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="WriteFileRequest">WriteFileRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[1,1]: string // 
&nbsp;&nbsp;format[0,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;schema[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;indent[0,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;doctype_system[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;encoding[0,1]: string // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;content[1,1]: undefined // 
&nbsp;&nbsp;append[0,1]: int // 
&#125;
</pre>
</details>
