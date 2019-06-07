# Include library: xml_utils.iol

Inclusion code: <pre>include "xml_utils.iol"</pre>

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
  <tbody><tr><td>XmlUtils documentation: </td></tr>
    <tr>
      <td>XmlUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#XmlUtilsInterface">XmlUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="XmlUtilsInterface">XmlUtilsInterface</h3>

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
      <td><a href="#xmlToValue">xmlToValue</a></td>
      <td><a href="#XMLToValueRequest">XMLToValueRequest</a></td>
      <td>undefined</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#transform">transform</a></td>
      <td><a href="#XMLTransformationRequest">XMLTransformationRequest</a></td>
      <td>string</td>
      <td>
        TransformerException( <a href="#JavaExceptionType">JavaExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#valueToXml">valueToXml</a></td>
      <td><a href="#ValueToXmlRequest">ValueToXmlRequest</a></td>
      <td>string</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> ) <br> 
        IllegalArgumentException( string )
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="xmlToValue">xmlToValue</h3>

Operation documentation: 
		  Transforms the base value in XML format (data types string, raw) into a Jolie value
		 
		  The XML root node will be discarded, the rest gets converted recursively
		 


Invocation template: 
<pre>xmlToValue@XmlUtils( request )( response )</pre>

<h4 id="XMLToValueRequest">Request type</h4>

Type: XMLToValueRequest


<pre>type XMLToValueRequest: any {
	.options?: void {
		.skipMixedText?: bool
		.charset?: string
		.includeAttributes?: bool
		.schemaLanguage?: string
		.includeRoot?: bool
		.schemaUrl?: string
	}
	.isXmlStore?: bool
}</pre>

<code>XMLToValueRequest : any</code> 

<ul>

  <li><code>options : void</code> 

<ul>

  <li><code>skipMixedText : bool</code> 
</li>

  <li><code>charset : string</code> 
</li>

  <li><code>includeAttributes : bool</code> 
</li>

  <li><code>schemaLanguage : string</code> 
</li>

  <li><code>includeRoot : bool</code> 
</li>

  <li><code>schemaUrl : string</code> 
</li>

</ul>
</li>

  <li><code>isXmlStore : bool</code> 
</li>

</ul>



<h4>Response type</h4>

Type: undefined




<code>undefined : any</code> 




<h4>Possible faults thrown</h4>


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3 id="transform">transform</h3>

Operation documentation: 


Invocation template: 
<pre>transform@XmlUtils( request )( response )</pre>

<h4 id="XMLTransformationRequest">Request type</h4>

Type: XMLTransformationRequest


<pre>type XMLTransformationRequest: void {
	.source: string
	.xslt: string
}</pre>

<code>XMLTransformationRequest : void</code> 

<ul>

  <li><code>source : string</code> 
</li>

  <li><code>xslt : string</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 




<h4>Possible faults thrown</h4>


Fault <code>TransformerException</code> with type <code>JavaExceptionType</code>

Fault-handling install template: 
<pre>install ( TransformerException => /* error-handling code */ )</pre>
<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>



<h3 id="valueToXml">valueToXml</h3>

Operation documentation: 
		  Transforms the value contained within the root node into an xml string.
		 
		  The base value of ValueToXmlRequest.root will be discarded, the rest gets converted recursively
		 


Invocation template: 
<pre>valueToXml@XmlUtils( request )( response )</pre>

<h4 id="ValueToXmlRequest">Request type</h4>

Type: ValueToXmlRequest


<pre>type ValueToXmlRequest: void {
	.omitXmlDeclaration?: bool
	.indent?: bool
	.plain?: bool
	.root: undefined
	.rootNodeName?: string
	.isXmlStore?: bool
	.applySchema?: void {
		.schema: string
		.doctypeSystem?: string
		.encoding?: string
	}
}</pre>

<code>ValueToXmlRequest : void</code> 

<ul>

  <li><code>omitXmlDeclaration : bool</code> 
</li>

  <li><code>indent : bool</code> 
</li>

  <li><code>plain : bool</code> 
</li>

  <li><code>root : any</code> 
</li>

  <li><code>rootNodeName : string</code> 
</li>

  <li><code>isXmlStore : bool</code> 
</li>

  <li><code>applySchema : void</code> 

<ul>

  <li><code>schema : string</code> 
</li>

  <li><code>doctypeSystem : string</code> 
</li>

  <li><code>encoding : string</code> 
</li>

</ul>
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


Fault <code>IllegalArgumentException</code> with type <code>string</code>

Fault-handling install template: 
<pre>install ( IllegalArgumentException => /* error-handling code */ )</pre>




<h3>Subtypes</h3>


<h4 id="JavaExceptionType">JavaExceptionType</h4>



<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>
<code>JavaExceptionType : string</code> 




