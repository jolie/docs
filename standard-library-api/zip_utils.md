# Include library: zip_utils.iol

Inclusion code: <pre>include "zip_utils.iol"</pre>

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

<h2>Operation Description</h2>



<h3 id="zip">zip</h3>


Invocation template: 
<pre>zip@ZipUtils( request )( response )</pre>

<h4 id="ZipRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ZipRequest: undefined</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3 id="IOException">IOException</h3>


Invocation template: 
<pre>IOException@ZipUtils( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="unzip">unzip</h3>


Invocation template: 
<pre>unzip@ZipUtils( request )( response )</pre>

<h4 id="UnzipRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type UnzipRequest: void {
	.filename: string
	.targetPath: string
}</pre>


<h4 id="UnzipResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type UnzipResponse: void {
	.entry*: string
}</pre>



<h4>Possible faults thrown</h4>



Fault <code>FileNotFound</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( FileNotFound => /* error-handling code */ )</pre>




<h3 id="readEntry">readEntry</h3>


Invocation template: 
<pre>readEntry@ZipUtils( request )( response )</pre>

<h4 id="ReadEntryRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ReadEntryRequest: void {
	.entry: string
	.filename: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 




<h4>Possible faults thrown</h4>



Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3>Subtypes</h3>


<h4 id="IOExceptionType">IOExceptionType</h4>

<pre>type IOExceptionType: JavaExceptionType</pre>



