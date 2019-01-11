# Include library: xml_utils.iol

Inclusion code: <code>include "xml_utils.iol"</code>

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
      <td>XmlUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#XmlUtilsInterface">XmlUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="XmlUtilsInterface">XmlUtilsInterface</h3>

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

### Operation Description


#### xmlToValue
Operation documentation: 
		  Transforms the base value in XML format (data types string, raw) into a Jolie value
		 
		  The XML root node will be discarded, the rest gets converted recursively
		 

Invocation template: <code>xmlToValue@XmlUtils( request )( response )</code>

<h4 id="XMLToValueRequest">Request type</h4>

Type documentation: no documentation provided 
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


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: <code>install ( IOException => /* error-handling code */ )</code>
<pre>type IOExceptionType: JavaExceptionType</pre>


#### transform


Invocation template: <code>transform@XmlUtils( request )( response )</code>

<h4 id="XMLTransformationRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type XMLTransformationRequest: void {
	.source: string
	.xslt: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>TransformerException</code> with type <code>JavaExceptionType</code>

Fault-handling install template: <code>install ( TransformerException => /* error-handling code */ )</code>
<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>


#### valueToXml
Operation documentation: 
		  Transforms the value contained within the root node into an xml string.
		 
		  The base value of ValueToXmlRequest.root will be discarded, the rest gets converted recursively
		 

Invocation template: <code>valueToXml@XmlUtils( request )( response )</code>

<h4 id="ValueToXmlRequest">Request type</h4>

Type documentation: no documentation provided 
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


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: <code>install ( IOException => /* error-handling code */ )</code>
<pre>type IOExceptionType: JavaExceptionType</pre>


Fault <code>IllegalArgumentException</code> with type <code>string</code>

Fault-handling install template: <code>install ( IllegalArgumentException => /* error-handling code */ )</code>




<h4>Subtypes</h4>


<a id="IOExceptionType"></a>
IOExceptionType

<pre>type IOExceptionType: JavaExceptionType</pre>




