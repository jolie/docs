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
  <tbody><tr><td>Parser documentation: </td></tr>
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
      <td><a href="#getSurface">getSurface</a></td>
      <td><a href="#Port">Port</a></td>
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
      <td><a href="#Port">Port</a></td>
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
      <td><a href="#getOutputPort">getOutputPort</a></td>
      <td><a href="#Port">Port</a></td>
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
      <td><a href="#getInputPort">getInputPort</a></td>
      <td><a href="#Port">Port</a></td>
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

Operation documentation: 


Invocation template: 
<pre>getSurface@Parser( request )( response )</pre>

<h4 id="Port">Request type</h4>

Type: Port


<pre>type Port: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>

<code>Port : void</code> 

<ul>

  <li><code>protocol : string</code> 
</li>

  <li><code>interfaces : void</code> 
</li>

  <li><code>name : void</code> 
</li>

  <li><code>location : any</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getNativeType">getNativeType</h3>

Operation documentation: 


Invocation template: 
<pre>getNativeType@Parser( request )( response )</pre>

<h4 id="NativeType">Request type</h4>

Type: NativeType


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

<code>NativeType : void</code> 

<ul>

  <li><code>string_type : bool</code> 
</li>

  <li><code>void_type : bool</code> 
</li>

  <li><code>raw_type : bool</code> 
</li>

  <li><code>int_type : bool</code> 
</li>

  <li><code>any_type : bool</code> 
</li>

  <li><code>link : void</code> 

<ul>

  <li><code>domain : string</code> 
</li>

  <li><code>name : string</code> 
</li>

</ul>
</li>

  <li><code>bool_type : bool</code> 
</li>

  <li><code>double_type : bool</code> 
</li>

  <li><code>long_type : bool</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getInterface">getInterface</h3>

Operation documentation: 


Invocation template: 
<pre>getInterface@Parser( request )( response )</pre>

<h4 id="Interface">Request type</h4>

Type: Interface


<pre>type Interface: void {
	.types*: Type
	.operations*: Operation
	.name: Name
}</pre>

<code>Interface : void</code> 

<ul>

  <li><code>types : void</code> 
</li>

  <li><code>operations : void</code> 
</li>

  <li><code>name : void</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getTypeInLine">getTypeInLine</h3>

Operation documentation: 


Invocation template: 
<pre>getTypeInLine@Parser( request )( response )</pre>

<h4 id="Type">Request type</h4>

Type: Type


<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>

<code>Type : void</code> 

<ul>

  <li><code>root_type : void</code> 
</li>

  <li><code>sub_type : void</code> 
</li>

  <li><code>name : void</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getSurfaceWithoutOutputPort">getSurfaceWithoutOutputPort</h3>

Operation documentation: 


Invocation template: 
<pre>getSurfaceWithoutOutputPort@Parser( request )( response )</pre>

<h4 id="Port">Request type</h4>

Type: Port


<pre>type Port: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>

<code>Port : void</code> 

<ul>

  <li><code>protocol : string</code> 
</li>

  <li><code>interfaces : void</code> 
</li>

  <li><code>name : void</code> 
</li>

  <li><code>location : any</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getType">getType</h3>

Operation documentation: 


Invocation template: 
<pre>getType@Parser( request )( response )</pre>

<h4 id="Type">Request type</h4>

Type: Type


<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>

<code>Type : void</code> 

<ul>

  <li><code>root_type : void</code> 
</li>

  <li><code>sub_type : void</code> 
</li>

  <li><code>name : void</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getOutputPort">getOutputPort</h3>

Operation documentation: 


Invocation template: 
<pre>getOutputPort@Parser( request )( response )</pre>

<h4 id="Port">Request type</h4>

Type: Port


<pre>type Port: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>

<code>Port : void</code> 

<ul>

  <li><code>protocol : string</code> 
</li>

  <li><code>interfaces : void</code> 
</li>

  <li><code>name : void</code> 
</li>

  <li><code>location : any</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getSubType">getSubType</h3>

Operation documentation: 


Invocation template: 
<pre>getSubType@Parser( request )( response )</pre>

<h4 id="SubType">Request type</h4>

Type: SubType


<pre>type SubType: void {
	.type_inline?: Type
	.name: string
	.cardinality: Cardinality
	.type_link?: Name
}</pre>

<code>SubType : void</code> 

<ul>

  <li><code>type_inline : void</code> 
</li>

  <li><code>name : string</code> 
</li>

  <li><code>cardinality : void</code> 
</li>

  <li><code>type_link : void</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getInputPort">getInputPort</h3>

Operation documentation: 


Invocation template: 
<pre>getInputPort@Parser( request )( response )</pre>

<h4 id="Port">Request type</h4>

Type: Port


<pre>type Port: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>

<code>Port : void</code> 

<ul>

  <li><code>protocol : string</code> 
</li>

  <li><code>interfaces : void</code> 
</li>

  <li><code>name : void</code> 
</li>

  <li><code>location : any</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3 id="getCardinality">getCardinality</h3>

Operation documentation: 


Invocation template: 
<pre>getCardinality@Parser( request )( response )</pre>

<h4 id="Cardinality">Request type</h4>

Type: Cardinality


<pre>type Cardinality: void {
	.min: int
	.max?: int
	.infinite?: int
}</pre>

<code>Cardinality : void</code> 

<ul>

  <li><code>min : int</code> 
</li>

  <li><code>max : int</code> 
</li>

  <li><code>infinite : int</code> 
</li>

</ul>



<h4>Response type</h4>

Type: string




<code>string : string</code> 








<h3>Subtypes</h3>


<h4 id="Interface">Interface</h4>



<pre>type Interface: void {
	.types*: Type
	.operations*: Operation
	.name: Name
}</pre>
<code>Interface : void</code> 


<h4 id="Type">Type</h4>



<pre>type Type: void {
	.root_type: NativeType
	.sub_type*: SubType
	.name: Name
}</pre>
<code>Type : void</code> 


<h4 id="NativeType">NativeType</h4>



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
<code>NativeType : void</code> 


<h4 id="SubType">SubType</h4>



<pre>type SubType: void {
	.type_inline?: Type
	.name: string
	.cardinality: Cardinality
	.type_link?: Name
}</pre>
<code>SubType : void</code> 


<h4 id="Cardinality">Cardinality</h4>



<pre>type Cardinality: void {
	.min: int
	.max?: int
	.infinite?: int
}</pre>
<code>Cardinality : void</code> 


<h4 id="Name">Name</h4>



<pre>type Name: void {
	.registry?: string
	.domain?: string
	.name: string
}</pre>
<code>Name : void</code> 


<h4 id="Operation">Operation</h4>



<pre>type Operation: void {
	.operation_name: string
	.output?: Name
	.input: Name
	.documentation?: any
	.fault*: Fault
}</pre>
<code>Operation : void</code> 


<h4 id="Fault">Fault</h4>



<pre>type Fault: void {
	.type_name?: Name
	.name: Name
}</pre>
<code>Fault : void</code> 




