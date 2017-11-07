<html>
<head></head><body>
<h1>JolieDoc for Port Parser</h1>
<h2>From file <code>metaparser.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Parser</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#ParserInterface">ParserInterface </a>
</ul>
<hr>
<h2 id=ParserInterface>Interface ParserInterface</h2>
<a name="ParserInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#getCardinality">getCardinality</a></td>
<td><a href="#Cardinality">Cardinality</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getInterface">getInterface</a></td>
<td><a href="#Interface">Interface</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getNativeType">getNativeType</a></td>
<td><a href="#NativeType">NativeType</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getParticipantInput">getParticipantInput</a></td>
<td><a href="#Participant">Participant</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getParticipantOutput">getParticipantOutput</a></td>
<td><a href="#Participant">Participant</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getSubType">getSubType</a></td>
<td><a href="#SubType">SubType</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getSurface">getSurface</a></td>
<td><a href="#Participant">Participant</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getSurfaceWithoutOutputPort">getSurfaceWithoutOutputPort</a></td>
<td><a href="#Participant">Participant</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getType">getType</a></td>
<td><a href="#Type">Type</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getTypeInLine">getTypeInLine</a></td>
<td><a href="#Type">Type</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="getSurface"></a><h3 id="getSurface">getSurface</h3></div>
<pre>getSurface( <a href="#Participant">Participant</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getNativeType"></a><h3 id="getNativeType">getNativeType</h3></div>
<pre>getNativeType( <a href="#NativeType">NativeType</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getInterface"></a><h3 id="getInterface">getInterface</h3></div>
<pre>getInterface( <a href="#Interface">Interface</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getTypeInLine"></a><h3 id="getTypeInLine">getTypeInLine</h3></div>
<pre>getTypeInLine( <a href="#Type">Type</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getSurfaceWithoutOutputPort"></a><h3 id="getSurfaceWithoutOutputPort">getSurfaceWithoutOutputPort</h3></div>
<pre>getSurfaceWithoutOutputPort( <a href="#Participant">Participant</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getType"></a><h3 id="getType">getType</h3></div>
<pre>getType( <a href="#Type">Type</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getParticipantOutput"></a><h3 id="getParticipantOutput">getParticipantOutput</h3></div>
<pre>getParticipantOutput( <a href="#Participant">Participant</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getSubType"></a><h3 id="getSubType">getSubType</h3></div>
<pre>getSubType( <a href="#SubType">SubType</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getParticipantInput"></a><h3 id="getParticipantInput">getParticipantInput</h3></div>
<pre>getParticipantInput( <a href="#Participant">Participant</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getCardinality"></a><h3 id="getCardinality">getCardinality</h3></div>
<pre>getCardinality( <a href="#Cardinality">Cardinality</a> )( <a href="#string">string</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="Participant"></a><h3 id="Participant">Participant</h3>
<pre lang="jolie">type Participant: void { 
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}</pre>
<hr>
<h2>Type list</h2>
<h3 id="Interface">Interface</h3>
<a name="Interface"></a>
<pre lang="jolie">type Interface: void { 
    .types*: Type
    .operations*: Operation
    .name: Name
}</pre>
<h3 id="Type">Type</h3>
<a name="Type"></a>
<pre lang="jolie">type Type: void { 
    .root_type: NativeType
    .sub_type*: SubType
    .name: Name
}</pre>
<h3 id="NativeType">NativeType</h3>
<a name="NativeType"></a>
<pre lang="jolie">type NativeType: void { 
    .string_type?: bool
    .void_type?: bool
    .raw_type?: bool
    .int_type?: bool
    .any_type?: bool
    .link?: void { 
        .domain?: string
        .name: string
    }
    .bool_type?: bool
    .double_type?: bool
    .long_type?: bool
}</pre>
<h3 id="SubType">SubType</h3>
<a name="SubType"></a>
<pre lang="jolie">type SubType: void { 
    .type_inline?: Type
    .name: string
    .cardinality: Cardinality
    .type_link?: Name
}</pre>
<h3 id="Cardinality">Cardinality</h3>
<a name="Cardinality"></a>
<pre lang="jolie">type Cardinality: void { 
    .min: int
    .max?: int
    .infinite?: int
}</pre>
<h3 id="Name">Name</h3>
<a name="Name"></a>
<pre lang="jolie">type Name: void { 
    .registry?: string
    .domain?: string
    .name: string
}</pre>
<h3 id="Operation">Operation</h3>
<a name="Operation"></a>
<pre lang="jolie">type Operation: void { 
    .operation_name: string
    .output?: Name
    .input: Name
    .documentation?: any
    .fault*: Fault
}</pre>
<h3 id="Fault">Fault</h3>
<a name="Fault"></a>
<pre lang="jolie">type Fault: void { 
    .type_name?: Name
    .name: Name
}</pre>
</body>
</html>
