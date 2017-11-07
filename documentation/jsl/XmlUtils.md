<html>
<head></head><body>
<h1>JolieDoc for Port XmlUtils</h1>
<h2>From file <code>xml_utils.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>XmlUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#XmlUtilsInterface">XmlUtilsInterface </a>
</ul>
<hr>
<h2 id=XmlUtilsInterface>Interface XmlUtilsInterface</h2>
<a name="XmlUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#transform">transform</a></td>
<td><a href="#XMLTransformationRequest">XMLTransformationRequest</a><br /></td>
<td>string<br /></td>
<td>
TransformerException( <a href="#JavaExceptionType">JavaExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#valueToXml">valueToXml</a></td>
<td><a href="#ValueToXmlRequest">ValueToXmlRequest</a><br /></td>
<td>string<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#xmlToValue">xmlToValue</a></td>
<td><a href="#XMLToValueRequest">XMLToValueRequest</a><br /></td>
<td>undefined<br /></td>
<td>
IOException( <a href="#IOExceptionType">IOExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="xmlToValue"></a><h3 id="xmlToValue">xmlToValue</h3></div>
<pre>xmlToValue( <a href="#XMLToValueRequest">XMLToValueRequest</a> )( <a href="#undefined">undefined</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>Transforms the base value in XML format (data types string, raw) into a Jolie value<br>		 <br>		  The XML root node will be discarded, the rest gets converted recursively</p></span>
<div class="operation-title"><a name="transform"></a><h3 id="transform">transform</h3></div>
<pre>transform( <a href="#XMLTransformationRequest">XMLTransformationRequest</a> )( <a href="#string">string</a> )
 throws

				
TransformerException( <a href="#JavaExceptionType">JavaExceptionType</a> )
</pre>
<div class="operation-title"><a name="valueToXml"></a><h3 id="valueToXml">valueToXml</h3></div>
<pre>valueToXml( <a href="#ValueToXmlRequest">ValueToXmlRequest</a> )( <a href="#string">string</a> )
 throws

				
IOException( <a href="#IOExceptionType">IOExceptionType</a> )
</pre>
<span class="opdoc"><p>Transforms the value contained within the root node into an xml string.<br>		 <br>		  The base value of ValueToXmlRequest.root will be discarded, the rest gets converted recursively</p></span>
<hr>
<h2>Message type list</h2>
<a name="XMLToValueRequest"></a><h3 id="XMLToValueRequest">XMLToValueRequest</h3>
<pre lang="jolie">type XMLToValueRequest: any { 
    .options?: void { 
        .charset?: string
        .includeAttributes?: bool
        .schemaLanguage?: string
        .schemaUrl?: string
    }
}</pre>
<a name="IOExceptionType"></a><h3 id="IOExceptionType">IOExceptionType</h3>
<pre lang="jolie">type IOExceptionType: JavaExceptionType</pre>
<a name="XMLTransformationRequest"></a><h3 id="XMLTransformationRequest">XMLTransformationRequest</h3>
<pre lang="jolie">type XMLTransformationRequest: void { 
    .source: string
    .xslt: string
}</pre>
<a name="JavaExceptionType"></a><h3 id="JavaExceptionType">JavaExceptionType</h3>
<pre lang="jolie">type JavaExceptionType: string { 
    .stackTrace: string
}</pre>
<a name="ValueToXmlRequest"></a><h3 id="ValueToXmlRequest">ValueToXmlRequest</h3>
<pre lang="jolie">type ValueToXmlRequest: void { 
    .omitXmlDeclaration?: bool
    .indent?: bool
    .plain?: bool
    .root: undefined
    .rootNodeName: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
