# Include library: converter.iol

Inclusion code: <pre>include "converter.iol"</pre>

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
  <tbody><tr><td>Converter documentation: </td></tr>
    <tr>
      <td>Converter</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#ConverterInterface">ConverterInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="ConverterInterface">ConverterInterface</h3>

Interface documentation: 

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
      <td><a href="#stringToRaw">stringToRaw</a></td>
      <td><a href="#StringToRawRequest">StringToRawRequest</a></td>
      <td>raw</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#base64ToRaw">base64ToRaw</a></td>
      <td>string</td>
      <td>raw</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#rawToBase64">rawToBase64</a></td>
      <td>raw</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#rawToString">rawToString</a></td>
      <td><a href="#RawToStringRequest">RawToStringRequest</a></td>
      <td>string</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="stringToRaw">stringToRaw</h3>

Operation documentation:  string <-> raw (byte arrays) conversion methods 


Invocation template: 
<pre>stringToRaw@Converter( request )( response )</pre>

<h4 id="StringToRawRequest">Request type</h4>

Type: StringToRawRequest


<pre>type StringToRawRequest: string {
	.charset?: string
}</pre>

<code>StringToRawRequest : string</code> 

<ul>

  <li><code>charset : string</code> :  set the encoding. Default: system (eg. for Unix-like OS UTF-8) 
</li>

</ul>



<h4>Response type</h4>

Type: raw




<code>raw : raw</code> 




<h4>Possible faults thrown</h4>


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3 id="base64ToRaw">base64ToRaw</h3>

Operation documentation: 


Invocation template: 
<pre>base64ToRaw@Converter( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: raw




<code>raw : raw</code> 




<h4>Possible faults thrown</h4>


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3 id="rawToBase64">rawToBase64</h3>

Operation documentation: 


Invocation template: 
<pre>rawToBase64@Converter( request )( response )</pre>

<h4>Request type</h4>

Type: raw




<code>raw : raw</code> 



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="rawToString">rawToString</h3>

Operation documentation:  string <-> raw (byte arrays) conversion methods 


Invocation template: 
<pre>rawToString@Converter( request )( response )</pre>

<h4 id="RawToStringRequest">Request type</h4>

Type: RawToStringRequest


<pre>type RawToStringRequest: raw {
	.charset?: string
}</pre>

<code>RawToStringRequest : raw</code> :  The byte array to be converted  

<ul>

  <li><code>charset : string</code> :  set the encoding. Default: system (eg. for Unix-like OS UTF-8) 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 




<h4>Possible faults thrown</h4>


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3>Subtypes</h3>


<h4 id="JavaExceptionType">JavaExceptionType</h4>



<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>
<code>JavaExceptionType : string</code> 




