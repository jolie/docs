<html>
<head></head><body>
<h1>JolieDoc for Port File</h1>
<h2>From file <code>file.iol</code></h2>
<table>
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
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#FileInterface">FileInterface </a>
</ul>
<hr>
<h2 id=FileInterface>Interface FileInterface</h2>
<a name="FileInterface"></a>
from: the source directory to copy<br>to: the target directory to copy into
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#convertFromBase64ToBinaryValue">convertFromBase64ToBinaryValue</a></td>
<td>string<br /></td>
<td>raw<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#convertFromBinaryToBase64Value">convertFromBinaryToBase64Value</a></td>
<td>raw<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#copyDir">copyDir</a></td>
<td><a href="#CopyDirRequest">CopyDirRequest</a><br /></td>
<td>bool<br /></td>
<td>
FileNotFound,&nbsp;<br>
IOException,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#delete">delete</a></td>
<td><a href="#DeleteRequest">DeleteRequest</a><br /></td>
<td>bool<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#deleteDir">deleteDir</a></td>
<td>string<br /></td>
<td>bool<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#exists">exists</a></td>
<td>string<br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getFileSeparator">getFileSeparator</a></td>
<td>void<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getMimeType">getMimeType</a></td>
<td>string<br /></td>
<td>string<br /></td>
<td>
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getParentPath">getParentPath</a></td>
<td>string<br /></td>
<td>string<br /></td>
<td>
InvalidPathException( <a href="#JavaExceptionType">JavaExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getServiceDirectory">getServiceDirectory</a></td>
<td>void<br /></td>
<td>string<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getSize">getSize</a></td>
<td>any<br /></td>
<td>int<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#isDirectory">isDirectory</a></td>
<td>string<br /></td>
<td>bool<br /></td>
<td>
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )&nbsp;&nbsp;<br>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#list">list</a></td>
<td><a href="#ListRequest">ListRequest</a><br /></td>
<td><a href="#ListResponse">ListResponse</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#mkdir">mkdir</a></td>
<td>string<br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#readFile">readFile</a></td>
<td><a href="#ReadFileRequest">ReadFileRequest</a><br /></td>
<td>undefined<br /></td>
<td>
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )&nbsp;&nbsp;<br>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#rename">rename</a></td>
<td><a href="#RenameRequest">RenameRequest</a><br /></td>
<td>void<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#setMimeTypeFile">setMimeTypeFile</a></td>
<td>string<br /></td>
<td>void<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#toAbsolutePath">toAbsolutePath</a></td>
<td>string<br /></td>
<td>string<br /></td>
<td>
InvalidPathException( <a href="#JavaExceptionType">JavaExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#writeFile">writeFile</a></td>
<td><a href="#WriteFileRequest">WriteFileRequest</a><br /></td>
<td>void<br /></td>
<td>
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )&nbsp;&nbsp;<br>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="convertFromBase64ToBinaryValue"></a><h3 id="convertFromBase64ToBinaryValue">convertFromBase64ToBinaryValue</h3></div>
<pre>convertFromBase64ToBinaryValue( <a href="#string">string</a> )( <a href="#raw">raw</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>deprecated, please use base64ToRaw@Converter()() from converter.iol</p></span>
<div class="operation-title"><a name="getMimeType"></a><h3 id="getMimeType">getMimeType</h3></div>
<pre>getMimeType( <a href="#string">string</a> )( <a href="#string">string</a> )
 throws

				
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )
</pre>
<div class="operation-title"><a name="convertFromBinaryToBase64Value"></a><h3 id="convertFromBinaryToBase64Value">convertFromBinaryToBase64Value</h3></div>
<pre>convertFromBinaryToBase64Value( <a href="#raw">raw</a> )( <a href="#string">string</a> )
</pre>
<span class="opdoc"><p>deprecated, please use rawToBase64@Converter()() from converter.iol</p></span>
<div class="operation-title"><a name="toAbsolutePath"></a><h3 id="toAbsolutePath">toAbsolutePath</h3></div>
<pre>toAbsolutePath( <a href="#string">string</a> )( <a href="#string">string</a> )
 throws

				
InvalidPathException( <a href="#JavaExceptionType">JavaExceptionType</a> )
</pre>
<span class="opdoc"><p>Constructs an absolute path to the target file or directory.<br>	  Can be used to construct an absolute path for new files that does not exist yet.<br>	  Throws a InvalidPathException fault if input is a relative path is not system recognized path.</p></span>
<div class="operation-title"><a name="getParentPath"></a><h3 id="getParentPath">getParentPath</h3></div>
<pre>getParentPath( <a href="#string">string</a> )( <a href="#string">string</a> )
 throws

				
InvalidPathException( <a href="#JavaExceptionType">JavaExceptionType</a> )
</pre>
<span class="opdoc"><p>Constructs the path to the parent directory.<br>	  Can be used to construct paths that does not exist so long as the path uses the system's filesystem path conventions.<br>	  Throws a InvalidPathException fault if input path is not a recognized system path or if the parent has no parent.</p></span>
<div class="operation-title"><a name="list"></a><h3 id="list">list</h3></div>
<pre>list( <a href="#ListRequest">ListRequest</a> )( <a href="#ListResponse">ListResponse</a> )
</pre>
<div class="operation-title"><a name="copyDir"></a><h3 id="copyDir">copyDir</h3></div>
<pre>copyDir( <a href="#CopyDirRequest">CopyDirRequest</a> )( <a href="#bool">bool</a> )
 throws

				
FileNotFound

				
IOException
</pre>
<span class="opdoc"><p>it copies a source directory into a destination one</p></span>
<div class="operation-title"><a name="delete"></a><h3 id="delete">delete</h3></div>
<pre>delete( <a href="#DeleteRequest">DeleteRequest</a> )( <a href="#bool">bool</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="getSize"></a><h3 id="getSize">getSize</h3></div>
<pre>getSize( <a href="#any">any</a> )( <a href="#int">int</a> )
</pre>
<span class="opdoc"><p>The size of any basic type variable.<br>	  - raw: buffer size<br>	  - void: 0<br>	  - boolean: 1<br>	  - integer types: int 4, long 8<br>	  - double: 8<br>	  - string: size in the respective platform encoding, on ASCII and latin1<br>	    equal to the string's length, on Unicode (UTF-8 etc.) >= string's length</p></span>
<div class="operation-title"><a name="getFileSeparator"></a><h3 id="getFileSeparator">getFileSeparator</h3></div>
<pre>getFileSeparator( <a href="#void">void</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="rename"></a><h3 id="rename">rename</h3></div>
<pre>rename( <a href="#RenameRequest">RenameRequest</a> )( <a href="#void">void</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="readFile"></a><h3 id="readFile">readFile</h3></div>
<pre>readFile( <a href="#ReadFileRequest">ReadFileRequest</a> )( <a href="#undefined">undefined</a> )
 throws

				
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>Reads some file's content into a Jolie structure<br>	 <br>	  Supported formats (ReadFileRequest.format):<br>	  - text (the default)<br>	  - base64 (same as binary but afterwards base64-encoded)<br>	  - binary<br>	  - xml<br>	  - xml_store (a type-annotated XML format)<br>	  - properties (Java properties file)<br>	  - json<br>	 <br>	  Child values: text, base64 and binary only populate the return's base value, the other formats fill in the child values as well.<br>	  - xml, xml_store: the XML root node will costitute a return's child value, the rest is filled in recursively<br>	  - properties: each property is represented by a child value<br>	  - json: each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest is filled in recursively</p></span>
<div class="operation-title"><a name="exists"></a><h3 id="exists">exists</h3></div>
<pre>exists( <a href="#string">string</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>it tests if the specified file or directory exists or not.</p></span>
<div class="operation-title"><a name="setMimeTypeFile"></a><h3 id="setMimeTypeFile">setMimeTypeFile</h3></div>
<pre>setMimeTypeFile( <a href="#string">string</a> )( <a href="#void">void</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="deleteDir"></a><h3 id="deleteDir">deleteDir</h3></div>
<pre>deleteDir( <a href="#string">string</a> )( <a href="#bool">bool</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>it deletes a directory recursively removing all its contents</p></span>
<div class="operation-title"><a name="getServiceDirectory"></a><h3 id="getServiceDirectory">getServiceDirectory</h3></div>
<pre>getServiceDirectory( <a href="#void">void</a> )( <a href="#string">string</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<div class="operation-title"><a name="writeFile"></a><h3 id="writeFile">writeFile</h3></div>
<pre>writeFile( <a href="#WriteFileRequest">WriteFileRequest</a> )( <a href="#void">void</a> )
 throws

				
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>Writes a Jolie structure out to an external file<br>	 <br>	  Supported formats (WriteFileRequest.format):<br>	  - text (the default if base value not of type raw)<br>	  - binary (the default if base value of type raw)<br>	  - xml<br>	  - xml_store (a type-annotated XML format)<br>	  - json<br>	 <br>	 <br>	  Child values: text and binary only consider the content's (WriteFileRequest.content) base value, the other formats look at the child values as well.<br>	  - xml, xml_store: the XML root node will costitute the content's only child value, the rest gets read out recursively<br>	  - json: each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets read out recursively</p></span>
<div class="operation-title"><a name="mkdir"></a><h3 id="mkdir">mkdir</h3></div>
<pre>mkdir( <a href="#string">string</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>it creates the directory specified in the request root. Returns true if the directory has been<br>	 created with success, false otherwise</p></span>
<div class="operation-title"><a name="isDirectory"></a><h3 id="isDirectory">isDirectory</h3></div>
<pre>isDirectory( <a href="#string">string</a> )( <a href="#bool">bool</a> )
 throws

				
FileNotFound( <a href="#FileNotFoundType">FileNotFoundType</a> )

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>it returns if a filename is a directory or not. False if the file does not exist.</p></span>
<hr>
<h2>Message type list</h2>
<a name="IOExceptionType"></a><h3 id="IOExceptionType">IOExceptionType</h3>
<pre lang="jolie">type IOExceptionType: JavaExceptionType</pre>
<a name="FileNotFoundType"></a><h3 id="FileNotFoundType">FileNotFoundType</h3>
<pre lang="jolie">type FileNotFoundType: WeakJavaExceptionType</pre>
<a name="JavaExceptionType"></a><h3 id="JavaExceptionType">JavaExceptionType</h3>
<pre lang="jolie">type JavaExceptionType: string { 
    .stackTrace: string
}</pre>
<a name="ListRequest"></a><h3 id="ListRequest">ListRequest</h3>
<pre lang="jolie">type ListRequest: void { 
    .regex?: string
    .dirsOnly?: bool
    .directory: string
    .order?: void { 
        .byname?: bool
    }
    .info?: bool
}</pre>
<a name="ListResponse"></a><h3 id="ListResponse">ListResponse</h3>
<pre lang="jolie">type ListResponse: void { 
    .result*: string { 
        .info?: void { 
            .size: long
            .absolutePath: string
            .lastModified: long
            .isDirectory: bool
            .isHidden: bool
        }
    }
}</pre>
<a name="CopyDirRequest"></a><h3 id="CopyDirRequest">CopyDirRequest</h3>
<pre lang="jolie">type CopyDirRequest: void { 
    .from: string
    .to: string
}</pre>
<a name="DeleteRequest"></a><h3 id="DeleteRequest">DeleteRequest</h3>
<pre lang="jolie">type DeleteRequest: string { 
    .isRegex?: int
}</pre>
<a name="RenameRequest"></a><h3 id="RenameRequest">RenameRequest</h3>
<pre lang="jolie">type RenameRequest: void { 
    .filename: string
    .to: string
}</pre>
<a name="ReadFileRequest"></a><h3 id="ReadFileRequest">ReadFileRequest</h3>
<pre lang="jolie">type ReadFileRequest: void { 
    .filename: string
    .format?: string { 
        .charset?: string
    }
}</pre>
<a name="WriteFileRequest"></a><h3 id="WriteFileRequest">WriteFileRequest</h3>
<pre lang="jolie">type WriteFileRequest: void { 
    .filename: string
    .format?: string { 
        .schema*: string
        .indent?: bool
        .doctype_system?: string
        .encoding?: string
    }
    .content: undefined
    .append?: int
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
