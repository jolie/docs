# Include library: zip_utils.iol

Inclusion code: <code>include "zip_utils.iol"</code>

<table>
  <caption>Service Deployment</caption>
  <thead>
    <tr>
      <th>Port Name</th>
      <th>Location</th>
      <th>Protocol</th>
      <th>Interfaces</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ZipUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#ZipUtilsInterface">ZipUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="ZipUtilsInterface">ZipUtilsInterface</h3>

<table>
  <thead>
    <tr>
      <th>Operation Name</th>
      <th>Input Type</th>
      <th>Output Type</th>
      <th>Faults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#zip">zip</a></td>
      <td><a href="#ZipRequest">ZipRequest</a></td>
      <td>raw</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#IOException">IOException</a></td>
      <td>undefined</a></td>
      <td>undefined</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#unzip">unzip</a></td>
      <td><a href="#UnzipRequest">UnzipRequest</a></td>
      <td><a href="#UnzipResponse">UnzipResponse</a></td>
      <td>
        FileNotFound( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#readEntry">readEntry</a></td>
      <td><a href="#ReadEntryRequest">ReadEntryRequest</a></td>
      <td>any</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="zip"></a>
#### zip


Invocation template: <code>zip@ZipUtils( request )( response )</code>

**Request type**
<a id="ZipRequest"></a>
Type documentation: no documentation provided 
<pre>type ZipRequest: undefined</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: <code>install ( IOException => /* error-handling code */ )</code>
<pre>type IOExceptionType: JavaExceptionType</pre>

---

<a id="IOException"></a>
#### IOException


Invocation template: <code>IOException@ZipUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="unzip"></a>
#### unzip


Invocation template: <code>unzip@ZipUtils( request )( response )</code>

**Request type**
<a id="UnzipRequest"></a>
Type documentation: no documentation provided 
<pre>type UnzipRequest: void {
	.filename: string
	.targetPath: string
}</pre>


**Response type**
<a id="UnzipResponse"></a>
Type documentation: no documentation provided 
<pre>type UnzipResponse: void {
	.entry*: string
}</pre>


**Possible faults thrown**


Fault <code>FileNotFound</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( FileNotFound => /* error-handling code */ )</code>


---

<a id="readEntry"></a>
#### readEntry


Invocation template: <code>readEntry@ZipUtils( request )( response )</code>

**Request type**
<a id="ReadEntryRequest"></a>
Type documentation: no documentation provided 
<pre>type ReadEntryRequest: void {
	.entry: string
	.filename: string
}</pre>


**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: <code>install ( IOException => /* error-handling code */ )</code>
<pre>type IOExceptionType: JavaExceptionType</pre>

---


<h4>Subtypes</h4>


<a id="IOExceptionType"></a>
IOExceptionType

<pre>type IOExceptionType: JavaExceptionType</pre>




