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
  <tbody>
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
WARNING: the API of this service is experimental. Use it at your own risk.


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
      <td><a href="#parseRoles">parseRoles</a></td>
      <td><a href="#ParseRoleRequest">ParseRoleRequest</a></td>
      <td><a href="#Role">Role</a></td>
      <td>
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

### Operation Description



<h4 id="getInputPortMetaData">getInputPortMetaData</h4>



Invocation template: <pre>getInputPortMetaData@MetaJolie( request )( response )</pre>

<h4 id="GetInputPortMetaDataRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetInputPortMetaDataRequest: void {
	.filename: string
	.name: Name
}</pre>


<h4 id="GetInputPortMetaDataResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type GetInputPortMetaDataResponse: void {
	.input*: Participant
}</pre>


**Possible faults thrown**


Fault <code>ParserException</code> with type <code>ParserExceptionType</code>

Fault-handling install template: <code>install ( ParserException => /* error-handling code */ )</code>
<pre>type ParserExceptionType: void {
	.line: int
	.sourceName: string
	.message: string
}</pre>


Fault <code>InputPortMetaDataFault</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InputPortMetaDataFault => /* error-handling code */ )</code>



Fault <code>SemanticException</code> with type <code>SemanticExceptionType</code>

Fault-handling install template: <code>install ( SemanticException => /* error-handling code */ )</code>
<pre>type SemanticExceptionType: void {
	.error*: void {
		.line: int
		.sourceName: string
		.message: string
	}
}</pre>



<h4 id="parseRoles">parseRoles</h4>



Invocation template: <pre>parseRoles@MetaJolie( request )( response )</pre>

<h4 id="ParseRoleRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ParseRoleRequest: void {
	.filename: string
	.rolename: Name
}</pre>


<h4 id="Role">Response type</h4>
Type documentation: no documentation provided 
<pre>type Role: void {
	.output?: Participant
	.input: Participant
	.name: Name
	.conversation*: Conversation
}</pre>






<h4 id="getMetaData">getMetaData</h4>



Invocation template: <pre>getMetaData@MetaJolie( request )( response )</pre>

<h4 id="GetMetaDataRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type GetMetaDataRequest: void {
	.filename: string
	.name: Name
}</pre>


<h4 id="GetMetaDataResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type GetMetaDataResponse: void {
	.output*: Participant
	.input*: Participant
	.interfaces*: Interface
	.types*: Type
	.service: Service
	.embeddedServices*: void {
		.servicepath: string
		.type: string
		.portId: string
	}
}</pre>


**Possible faults thrown**


Fault <code>ParserException</code> with type <code>ParserExceptionType</code>

Fault-handling install template: <code>install ( ParserException => /* error-handling code */ )</code>
<pre>type ParserExceptionType: void {
	.line: int
	.sourceName: string
	.message: string
}</pre>


Fault <code>SemanticException</code> with type <code>SemanticExceptionType</code>

Fault-handling install template: <code>install ( SemanticException => /* error-handling code */ )</code>
<pre>type SemanticExceptionType: void {
	.error*: void {
		.line: int
		.sourceName: string
		.message: string
	}
}</pre>



<h4 id="messageTypeCast">messageTypeCast</h4>



Invocation template: <pre>messageTypeCast@MetaJolie( request )( response )</pre>

<h4 id="MessageTypeCastRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type MessageTypeCastRequest: void {
	.types: void {
		.types*: Type
		.messageTypeName: Name
	}
	.message: undefined
}</pre>


<h4 id="MessageTypeCastResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type MessageTypeCastResponse: void {
	.message: undefined
}</pre>


**Possible faults thrown**


Fault <code>TypeMismatch</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( TypeMismatch => /* error-handling code */ )</code>




<h4 id="checkNativeType">checkNativeType</h4>



Invocation template: <pre>checkNativeType@MetaJolie( request )( response )</pre>

<h4 id="CheckNativeTypeRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type CheckNativeTypeRequest: void {
	.type_name: string
}</pre>


<h4 id="CheckNativeTypeResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type CheckNativeTypeResponse: void {
	.result: bool
}</pre>









