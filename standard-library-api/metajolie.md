# Include library: metajolie.iol

Inclusion code: <pre>include "metajolie.iol"</pre>

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
  <tbody><tr><td>MetaJolie documentation: </td></tr>
    <tr>
      <td>MetaJolie</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#MetaJolieInterface">MetaJolieInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="MetaJolieInterface">MetaJolieInterface</h3>

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
      <td><a href="#getInputPortMetaData">getInputPortMetaData</a></td>
      <td><a href="#GetInputPortMetaDataRequest">GetInputPortMetaDataRequest</a></td>
      <td><a href="#GetInputPortMetaDataResponse">GetInputPortMetaDataResponse</a></td>
      <td>
        ParserException( <a href="#ParserExceptionType">ParserExceptionType</a> ) <br> 
        InputPortMetaDataFault( undefined ) <br> 
        SemanticException( <a href="#SemanticExceptionType">SemanticExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#getMetaData">getMetaData</a></td>
      <td><a href="#GetMetaDataRequest">GetMetaDataRequest</a></td>
      <td><a href="#GetMetaDataResponse">GetMetaDataResponse</a></td>
      <td>
        ParserException( <a href="#ParserExceptionType">ParserExceptionType</a> ) <br> 
        SemanticException( <a href="#SemanticExceptionType">SemanticExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#messageTypeCast">messageTypeCast</a></td>
      <td><a href="#MessageTypeCastRequest">MessageTypeCastRequest</a></td>
      <td><a href="#MessageTypeCastResponse">MessageTypeCastResponse</a></td>
      <td>
        TypeMismatch( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#checkNativeType">checkNativeType</a></td>
      <td><a href="#CheckNativeTypeRequest">CheckNativeTypeRequest</a></td>
      <td><a href="#CheckNativeTypeResponse">CheckNativeTypeResponse</a></td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="getInputPortMetaData">getInputPortMetaData</h3>

Operation documentation: 


Invocation template: 
<pre>getInputPortMetaData@MetaJolie( request )( response )</pre>

<h4 id="GetInputPortMetaDataRequest">Request type</h4>

Type: GetInputPortMetaDataRequest


<pre>type GetInputPortMetaDataRequest: void {
	.filename: string
	.name?: Name
}</pre>

<code>GetInputPortMetaDataRequest : void</code> 

<ul>

  <li><code>filename : string</code> :  the filename where the service definition is 
</li>

  <li><code>name : void</code> :  the absolute name to give to the resource. in this operation only .domain will be used. default .domain = "". 
</li>

</ul>



<h4 id="GetInputPortMetaDataResponse">Response type</h4>

Type: GetInputPortMetaDataResponse


<pre>type GetInputPortMetaDataResponse: void {
	.input*: Port
}</pre>

<code>GetInputPortMetaDataResponse : void</code> 

<ul>

  <li><code>input : void</code> :  the full description of each input port of the service definition 
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>ParserException</code> with type <code>ParserExceptionType</code>

Fault-handling install template: 
<pre>install ( ParserException => /* error-handling code */ )</pre>
<pre>type ParserExceptionType: void {
	.line: int
	.sourceName: string
	.message: string
}</pre>


Fault <code>InputPortMetaDataFault</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( InputPortMetaDataFault => /* error-handling code */ )</pre>



Fault <code>SemanticException</code> with type <code>SemanticExceptionType</code>

Fault-handling install template: 
<pre>install ( SemanticException => /* error-handling code */ )</pre>
<pre>type SemanticExceptionType: void {
	.error*: void {
		.line: int
		.sourceName: string
		.message: string
	}
}</pre>



<h3 id="getMetaData">getMetaData</h3>

Operation documentation: 


Invocation template: 
<pre>getMetaData@MetaJolie( request )( response )</pre>

<h4 id="GetMetaDataRequest">Request type</h4>

Type: GetMetaDataRequest


<pre>type GetMetaDataRequest: void {
	.filename: string
	.name: Name
}</pre>

<code>GetMetaDataRequest : void</code> 

<ul>

  <li><code>filename : string</code> :  the filename where the service definition is 
</li>

  <li><code>name : void</code> :  the name and the domain name to give to the service 
</li>

</ul>



<h4 id="GetMetaDataResponse">Response type</h4>

Type: GetMetaDataResponse


<pre>type GetMetaDataResponse: void {
	.output*: Port
	.input*: Port
	.interfaces*: Interface
	.types*: Type
	.service: Service
	.embeddedServices*: void {
		.servicepath: string
		.type: string
		.portId: string
	}
}</pre>

<code>GetMetaDataResponse : void</code> 

<ul>

  <li><code>output : void</code> :  the definitions of all the output ports 
</li>

  <li><code>input : void</code> :  the definitions of all the input ports 
</li>

  <li><code>interfaces : void</code> :  the definitions of all the interfaces 
</li>

  <li><code>types : void</code> :  the definitions of all the types 
</li>

  <li><code>service : void</code> :  the definition of the service 
</li>

  <li><code>embeddedServices : void</code> :  the definitions of all the embedded services 

<ul>

  <li><code>servicepath : string</code> :  path where the service can be found 
</li>

  <li><code>type : string</code> :  type of the embedded service 
</li>

  <li><code>portId : string</code> :  target output port where the embedded service is bound 
</li>

</ul>
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>ParserException</code> with type <code>ParserExceptionType</code>

Fault-handling install template: 
<pre>install ( ParserException => /* error-handling code */ )</pre>
<pre>type ParserExceptionType: void {
	.line: int
	.sourceName: string
	.message: string
}</pre>


Fault <code>SemanticException</code> with type <code>SemanticExceptionType</code>

Fault-handling install template: 
<pre>install ( SemanticException => /* error-handling code */ )</pre>
<pre>type SemanticExceptionType: void {
	.error*: void {
		.line: int
		.sourceName: string
		.message: string
	}
}</pre>



<h3 id="messageTypeCast">messageTypeCast</h3>

Operation documentation: 


Invocation template: 
<pre>messageTypeCast@MetaJolie( request )( response )</pre>

<h4 id="MessageTypeCastRequest">Request type</h4>

Type: MessageTypeCastRequest


<pre>type MessageTypeCastRequest: void {
	.types: void {
		.types*: Type
		.messageTypeName: Name
	}
	.message: undefined
}</pre>

<code>MessageTypeCastRequest : void</code> 

<ul>

  <li><code>types : void</code> :  the types to use for casting the message 

<ul>

  <li><code>types : void</code> :  list of all the required types 
</li>

  <li><code>messageTypeName : void</code> :  starting type to user for casting 
</li>

</ul>
</li>

  <li><code>message : any</code> :  the message to be cast 
</li>

</ul>



<h4 id="MessageTypeCastResponse">Response type</h4>

Type: MessageTypeCastResponse


<pre>type MessageTypeCastResponse: void {
	.message: undefined
}</pre>

<code>MessageTypeCastResponse : void</code> 

<ul>

  <li><code>message : any</code> :  casted message 
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>TypeMismatch</code> with type <code>undefined</code>

Fault-handling install template: 
<pre>install ( TypeMismatch => /* error-handling code */ )</pre>




<h3 id="checkNativeType">checkNativeType</h3>

Operation documentation: 


Invocation template: 
<pre>checkNativeType@MetaJolie( request )( response )</pre>

<h4 id="CheckNativeTypeRequest">Request type</h4>

Type: CheckNativeTypeRequest


<pre>type CheckNativeTypeRequest: void {
	.type_name: string
}</pre>

<code>CheckNativeTypeRequest : void</code> 

<ul>

  <li><code>type_name : string</code> :  the type name to check it is native 
</li>

</ul>



<h4 id="CheckNativeTypeResponse">Response type</h4>

Type: CheckNativeTypeResponse


<pre>type CheckNativeTypeResponse: void {
	.result: bool
}</pre>

<code>CheckNativeTypeResponse : void</code> 

<ul>

  <li><code>result : bool</code> 
</li>

</ul>








<h3>Subtypes</h3>


<h4 id="Name">Name</h4>



<pre>type Name: void {
	.registry?: string
	.domain?: string
	.name: string
}</pre>
<code>Name : void</code> 


<h4 id="Port">Port</h4>



<pre>type Port: void {
	.protocol: string
	.interfaces*: Interface
	.name: Name
	.location: any
}</pre>
<code>Port : void</code> 


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


<h4 id="Service">Service</h4>



<pre>type Service: void {
	.output*: Name
	.input*: void {
		.domain: string
		.name: string
	}
	.name: Name
}</pre>
<code>Service : void</code> 




