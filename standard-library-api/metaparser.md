# Include library: metaparser.iol

Inclusion code: <pre>include "metaparser.iol"</pre>

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
      <td>Parser</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#ParserInterface">ParserInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="ParserInterface">ParserInterface</h3>

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
      <td><a href="#getSurface">getSurface</a></td>
      <td><a href="#Participant">Participant</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getNativeType">getNativeType</a></td>
      <td><a href="#NativeType">NativeType</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getInterface">getInterface</a></td>
      <td><a href="#Interface">Interface</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getTypeInLine">getTypeInLine</a></td>
      <td><a href="#Type">Type</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getSurfaceWithoutOutputPort">getSurfaceWithoutOutputPort</a></td>
      <td><a href="#Participant">Participant</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getType">getType</a></td>
      <td><a href="#Type">Type</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getParticipantOutput">getParticipantOutput</a></td>
      <td><a href="#Participant">Participant</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getSubType">getSubType</a></td>
      <td><a href="#SubType">SubType</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getParticipantInput">getParticipantInput</a></td>
      <td><a href="#Participant">Participant</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getCardinality">getCardinality</a></td>
      <td><a href="#Cardinality">Cardinality</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="getSurface">getSurface</h3>


Invocation template: 
<pre>getSurface@Parser( request )( response )</pre>

<h4 id="Participant">Request type</h4>

Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getNativeType">getNativeType</h3>


Invocation template: 
<pre>getNativeType@Parser( request )( response )</pre>

<h4 id="NativeType">Request type</h4>

Type documentation: no documentation provided 
<pre>type NativeType: void {
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


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getInterface">getInterface</h3>


Invocation template: 
<pre>getInterface@Parser( request )( response )</pre>

<h4 id="Interface">Request type</h4>

Type documentation: no documentation provided 
<pre>type Interface: void {
	.types*: Type
	.operations*: Operation
	.name: Name
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getTypeInLine">getTypeInLine</h3>


Invocation template: 
<pre>getTypeInLine@Parser( request )( response )</pre>

<h4 id="Type">Request type</h4>

Type documentation: no documentation provided 
<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getSurfaceWithoutOutputPort">getSurfaceWithoutOutputPort</h3>


Invocation template: 
<pre>getSurfaceWithoutOutputPort@Parser( request )( response )</pre>

<h4 id="Participant">Request type</h4>

Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getType">getType</h3>


Invocation template: 
<pre>getType@Parser( request )( response )</pre>

<h4 id="Type">Request type</h4>

Type documentation: no documentation provided 
<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getParticipantOutput">getParticipantOutput</h3>


Invocation template: 
<pre>getParticipantOutput@Parser( request )( response )</pre>

<h4 id="Participant">Request type</h4>

Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getSubType">getSubType</h3>


Invocation template: 
<pre>getSubType@Parser( request )( response )</pre>

<h4 id="SubType">Request type</h4>

Type documentation: no documentation provided 
<pre>type SubType: void {
	.type_inline?: Type
	.name: string
	.cardinality: Cardinality
	.type_link?: Name
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getParticipantInput">getParticipantInput</h3>


Invocation template: 
<pre>getParticipantInput@Parser( request )( response )</pre>

<h4 id="Participant">Request type</h4>

Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="getCardinality">getCardinality</h3>


Invocation template: 
<pre>getCardinality@Parser( request )( response )</pre>

<h4 id="Cardinality">Request type</h4>

Type documentation: no documentation provided 
<pre>type Cardinality: void {
	.min: int
	.max?: int
	.infinite?: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 










