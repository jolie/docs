# Include library: metaparser.iol

Inclusion code: <code>include "metaparser.iol"</code>

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

### Operation Description


<a id="getSurface"></a>
#### getSurface


Invocation template: <code>getSurface@Parser( request )( response )</code>

**Request type**
<a id="Participant"></a>
Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getNativeType"></a>
#### getNativeType


Invocation template: <code>getNativeType@Parser( request )( response )</code>

**Request type**
<a id="NativeType"></a>
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


**Response type**

Type documentation: no documentation provided 





---

<a id="getInterface"></a>
#### getInterface


Invocation template: <code>getInterface@Parser( request )( response )</code>

**Request type**
<a id="Interface"></a>
Type documentation: no documentation provided 
<pre>type Interface: void {
	.types*: Type
	.operations*: Operation
	.name: Name
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getTypeInLine"></a>
#### getTypeInLine


Invocation template: <code>getTypeInLine@Parser( request )( response )</code>

**Request type**
<a id="Type"></a>
Type documentation: no documentation provided 
<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getSurfaceWithoutOutputPort"></a>
#### getSurfaceWithoutOutputPort


Invocation template: <code>getSurfaceWithoutOutputPort@Parser( request )( response )</code>

**Request type**
<a id="Participant"></a>
Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getType"></a>
#### getType


Invocation template: <code>getType@Parser( request )( response )</code>

**Request type**
<a id="Type"></a>
Type documentation: no documentation provided 
<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getParticipantOutput"></a>
#### getParticipantOutput


Invocation template: <code>getParticipantOutput@Parser( request )( response )</code>

**Request type**
<a id="Participant"></a>
Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getSubType"></a>
#### getSubType


Invocation template: <code>getSubType@Parser( request )( response )</code>

**Request type**
<a id="SubType"></a>
Type documentation: no documentation provided 
<pre>type SubType: void {
	.type_inline?: Type
	.name: string
	.cardinality: Cardinality
	.type_link?: Name
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getParticipantInput"></a>
#### getParticipantInput


Invocation template: <code>getParticipantInput@Parser( request )( response )</code>

**Request type**
<a id="Participant"></a>
Type documentation: no documentation provided 
<pre>type Participant: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getCardinality"></a>
#### getCardinality


Invocation template: <code>getCardinality@Parser( request )( response )</code>

**Request type**
<a id="Cardinality"></a>
Type documentation: no documentation provided 
<pre>type Cardinality: void {
	.min: int
	.max?: int
	.infinite?: int
}</pre>


**Response type**

Type documentation: no documentation provided 





---





