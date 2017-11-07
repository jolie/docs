<html>
<head></head><body>
<h1>JolieDoc for Port MetaJolie</h1>
<h2>From file <code>metajolie.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>MetaJolie</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#MetaJolieInterface">MetaJolieInterface </a>
</ul>
<hr>
<h2 id=MetaJolieInterface>Interface MetaJolieInterface</h2>
<a name="MetaJolieInterface"></a>
WARNING: the API of this service is experimental. Use it at your own risk.
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#checkNativeType">checkNativeType</a></td>
<td><a href="#CheckNativeTypeRequest">CheckNativeTypeRequest</a><br /></td>
<td><a href="#CheckNativeTypeResponse">CheckNativeTypeResponse</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getInputPortMetaData">getInputPortMetaData</a></td>
<td><a href="#GetInputPortMetaDataRequest">GetInputPortMetaDataRequest</a><br /></td>
<td><a href="#GetInputPortMetaDataResponse">GetInputPortMetaDataResponse</a><br /></td>
<td>
ParserException( <a href="#ParserExceptionType">ParserExceptionType</a> )&nbsp;&nbsp;<br>
InputPortMetaDataFault,&nbsp;<br>
SemanticException( <a href="#SemanticExceptionType">SemanticExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#getMetaData">getMetaData</a></td>
<td><a href="#GetMetaDataRequest">GetMetaDataRequest</a><br /></td>
<td><a href="#GetMetaDataResponse">GetMetaDataResponse</a><br /></td>
<td>
ParserException( <a href="#ParserExceptionType">ParserExceptionType</a> )&nbsp;&nbsp;<br>
SemanticException( <a href="#SemanticExceptionType">SemanticExceptionType</a> )&nbsp;&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#messageTypeCast">messageTypeCast</a></td>
<td><a href="#MessageTypeCastRequest">MessageTypeCastRequest</a><br /></td>
<td><a href="#MessageTypeCastResponse">MessageTypeCastResponse</a><br /></td>
<td>
TypeMismatch,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#parseRoles">parseRoles</a></td>
<td><a href="#ParseRoleRequest">ParseRoleRequest</a><br /></td>
<td><a href="#Role">Role</a><br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="getInputPortMetaData"></a><h3 id="getInputPortMetaData">getInputPortMetaData</h3></div>
<pre>getInputPortMetaData( <a href="#GetInputPortMetaDataRequest">GetInputPortMetaDataRequest</a> )( <a href="#GetInputPortMetaDataResponse">GetInputPortMetaDataResponse</a> )
 throws

				
ParserException( <a href="#ParserExceptionType">ParserExceptionType</a> )

				
InputPortMetaDataFault

				
SemanticException( <a href="#SemanticExceptionType">SemanticExceptionType</a> )
</pre>
<div class="operation-title"><a name="parseRoles"></a><h3 id="parseRoles">parseRoles</h3></div>
<pre>parseRoles( <a href="#ParseRoleRequest">ParseRoleRequest</a> )( <a href="#Role">Role</a> )
</pre>
<div class="operation-title"><a name="getMetaData"></a><h3 id="getMetaData">getMetaData</h3></div>
<pre>getMetaData( <a href="#GetMetaDataRequest">GetMetaDataRequest</a> )( <a href="#GetMetaDataResponse">GetMetaDataResponse</a> )
 throws

				
ParserException( <a href="#ParserExceptionType">ParserExceptionType</a> )

				
SemanticException( <a href="#SemanticExceptionType">SemanticExceptionType</a> )
</pre>
<div class="operation-title"><a name="messageTypeCast"></a><h3 id="messageTypeCast">messageTypeCast</h3></div>
<pre>messageTypeCast( <a href="#MessageTypeCastRequest">MessageTypeCastRequest</a> )( <a href="#MessageTypeCastResponse">MessageTypeCastResponse</a> )
 throws

				
TypeMismatch
</pre>
<div class="operation-title"><a name="checkNativeType"></a><h3 id="checkNativeType">checkNativeType</h3></div>
<pre>checkNativeType( <a href="#CheckNativeTypeRequest">CheckNativeTypeRequest</a> )( <a href="#CheckNativeTypeResponse">CheckNativeTypeResponse</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="GetInputPortMetaDataRequest"></a><h3 id="GetInputPortMetaDataRequest">GetInputPortMetaDataRequest</h3>
<pre lang="jolie">type GetInputPortMetaDataRequest: void { 
    .filename: string
    .name: Name
}</pre>
<a name="GetInputPortMetaDataResponse"></a><h3 id="GetInputPortMetaDataResponse">GetInputPortMetaDataResponse</h3>
<pre lang="jolie">type GetInputPortMetaDataResponse: void { 
    .input*: Participant
}</pre>
<a name="ParserExceptionType"></a><h3 id="ParserExceptionType">ParserExceptionType</h3>
<pre lang="jolie">type ParserExceptionType: void { 
    .line: int
    .sourceName: string
    .message: string
}</pre>
<a name="SemanticExceptionType"></a><h3 id="SemanticExceptionType">SemanticExceptionType</h3>
<pre lang="jolie">type SemanticExceptionType: void { 
    .error*: void { 
        .line: int
        .sourceName: string
        .message: string
    }
}</pre>
<a name="ParseRoleRequest"></a><h3 id="ParseRoleRequest">ParseRoleRequest</h3>
<pre lang="jolie">type ParseRoleRequest: void { 
    .filename: string
    .rolename: Name
}</pre>
<a name="Role"></a><h3 id="Role">Role</h3>
<pre lang="jolie">type Role: void { 
    .output?: Participant
    .input: Participant
    .name: Name
    .conversation*: Conversation
}</pre>
<a name="GetMetaDataRequest"></a><h3 id="GetMetaDataRequest">GetMetaDataRequest</h3>
<pre lang="jolie">type GetMetaDataRequest: void { 
    .filename: string
    .name: Name
}</pre>
<a name="GetMetaDataResponse"></a><h3 id="GetMetaDataResponse">GetMetaDataResponse</h3>
<pre lang="jolie">type GetMetaDataResponse: void { 
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
<a name="MessageTypeCastRequest"></a><h3 id="MessageTypeCastRequest">MessageTypeCastRequest</h3>
<pre lang="jolie">type MessageTypeCastRequest: void { 
    .types: void { 
        .types*: Type
        .messageTypeName: Name
    }
    .message: undefined
}</pre>
<a name="MessageTypeCastResponse"></a><h3 id="MessageTypeCastResponse">MessageTypeCastResponse</h3>
<pre lang="jolie">type MessageTypeCastResponse: void { 
    .message: undefined
}</pre>
<a name="CheckNativeTypeRequest"></a><h3 id="CheckNativeTypeRequest">CheckNativeTypeRequest</h3>
<pre lang="jolie">type CheckNativeTypeRequest: void { 
    .type_name: string
}</pre>
<a name="CheckNativeTypeResponse"></a><h3 id="CheckNativeTypeResponse">CheckNativeTypeResponse</h3>
<pre lang="jolie">type CheckNativeTypeResponse: void { 
    .result: bool
}</pre>
<hr>
<h2>Type list</h2>
<h3 id="Name">Name</h3>
<a name="Name"></a>
<pre lang="jolie">type Name: void { 
    .registry?: string
    .domain?: string
    .name: string
}</pre>
<h3 id="Participant">Participant</h3>
<a name="Participant"></a>
<pre lang="jolie">type Participant: void { 
    .protocol: string
    .interfaces*: Interface
    .name: Name
    .location: any
}</pre>
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
<h3 id="Conversation">Conversation</h3>
<a name="Conversation"></a>
<pre lang="jolie">type Conversation: void { 
    .participant_type: void { 
        .is_input?: int
        .is_output?: int
    }
    .operation: string
}</pre>
<h3 id="Service">Service</h3>
<a name="Service"></a>
<pre lang="jolie">type Service: void { 
    .output*: Name
    .input*: void { 
        .domain: string
        .name: string
    }
    .name: Name
}</pre>
<h3 id="undefined">undefined</h3>
<a name="undefined"></a>
<pre lang="jolie">type undefined: undefined</pre>
</body>
</html>
