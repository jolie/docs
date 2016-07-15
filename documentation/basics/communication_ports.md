## Communication Ports

Communication ports constitute the deployment part of a Jolie program. They define the communication links used by services to exchange data.

The basic deployment primitives are input ports and output ports, which support input and output communications with other services. Ports are based on *interfaces* and *data types*.The deployment part of a Jolie program is a list of *deployment instructions* among which we can have input and output ports, interfaces, and data type definitions.

---

## Ports

Let us recall the concepts of *input ports* and *output ports* seen in the [Behaviour and Deployment](getting_started/behavior_and_deployment.html) section. There are two kinds of ports: *input ports*, which expose input operations to other services, and *output ports*, defining how to invoke the operations of other services.

*Location*, *protocol* and *interface* are the three elements in the definition of ports. 
Location and protocol define the concrete binding information between a Jolie program and other service, interfaces specify type information expected to be satisfied by the behaviour that uses the port. 

### Locations

A location expresses the communication medium, along with its configuration parameters, a service uses for exposing its interface (input port) or invoking another service (output port). 

A location must indicate the communication medium the port has to use and its related parameters in this form: `medium[:parameters]`, where *medium* is a medium identifier and the optional *parameters* is a medium-specific string.

Jolie currently supports four media:

- `socket` (TCP/IP sockets).
- `btl2cap` (Bluetooth L2CAP);
- `rmi` (Java RMI);
- `localsocket` (Unix local sockets);

An example of a valid location is: `"socket://www.mysite.com:80/"`, where `socket://` is the location medium and the following part represents its parameters.

For a thorough description of the locations supported by Jolie and their parameters see [Locations](locations/introduction.html) section.

### Protocols

A protocol defines how data to be sent or received should be, respectively, encoded or decoded, following an isomorphism. 

Protocols are referred by name. Examples of valid (supported) protocol names are:

- `http`;
- `https`;
- `soap`;
- `sodep` (a binary protocol specifically developed for Jolie);
- `xmlrpc`.

For a thorough description of the protocols supported by Jolie and their parameters see [Protocols](protocols/introduction.html) section.

### The syntax of input and output ports

The syntax for input and output ports is, respectively:

<div style="overflow:auto;">
	<div style="float:left; width:49%;">
		<pre class="syntax">
inputPort id {
	Location: URI
	Protocol: p
	Interfaces: iface_1, 
				..., 
				iface_n
}
</pre>
	</div>
	<div style="float:left; width:49%;">
		<pre class="syntax">
outputPort id {
	Location: URI
	Protocol: p
	Interfaces: iface_1, 
				..., 
				iface_n
}
</pre>
	</div>
</div>

where `URI` is a [URI](http://en.wikipedia.org/wiki/Uniform_resource_identifier) (Uniform Resource Identifier), defining the location of the port; `id`, `p` and `iface_i` are the identifiers representing, respectively, the name of the port, the data protocol to use, and the interfaces accessible through the port.

Let us consider the following input port declaration:

<pre class="code">
inputPort SumInput {
	Location: "socket://localhost:8000/"
	Protocol: soap
	Interfaces: SumInterface
}
</pre>

`SumInput` is an inputPort, and it exposes the operations defined in `SumInterface` interface. Such operations can be invoked at the TCP/IP socket `localhost`, on port `8000`, and by encoding messages with the `soap` protocol.

Finally, let us define the `SumServ` outputPort, which is used to invoke the services exposed by `SumInput`:

<pre class="code">
outputPort SumServ {
	Location: "socket://localhost:8000/"
	Protocol: soap
	Interfaces: SumInterface
}
</pre>

---

## Interfaces

Jolie defines two types of operations:

- one-way operations, which receive a message;
- request-response operations, which reply or receive a message and send back a response.

Thus an interface is a collection of operation types, a list of One-Way and Request-Response operation declarations.

The basic declaration of an interface lists all the names of the its operations, grouped by type:

<pre class="syntax">
interface identifier {
	OneWay: 
		ow_name1( t1 ), 
		ow_name2( t2 ), 
		//...,
		ow_nameN( tN )
	RequestResponse:
		rr_name1( tk1 )( tk2 ),
		rr_name2( tk3 )( tk4 ),
		//...
		rr_nameN( tkN )( tkN+1 )
}
</pre>

The syntax presented above includes the types of the messages of each operation. One-way operations require only one message type, whilst request-responses define both request (left argument) and response (right argument) types.

Let us declare the interface `SumInterface`:

<pre class="code">
interface SumInterface {
	RequestResponse:
		sum( SumRequest )( int )
}
</pre>

`SumInterface` defines a request-response operation `sum`. `SumInterface` is the same used in the declaration of `SumInput` and `SumServ`, shown at the end of ports subsection.

The type declarations of both request and response messages are explained further in the data types subsection below.

---

## Data types

In Jolie, the messages exchanged through operations are data trees (see section [Handling Simple Data](basics/handling_simple_data.html)). A data type defines:

- the structure of a data tree;
- the type of the content of its node;
- the allowed number of occurrences of each node.

Let us consider an iterative explanation of data types syntax:

### Basic data types

The simplest kind of data types is the basic-typed one, whose syntax is:

<pre class="syntax">
basic_type: {string, int, long, double, bool, raw, void, any}

type T: basic_type
</pre>

An example of such kind of data types is:

<pre class="code">
type Name: string
</pre>

### Subtree data types

A type *T* can (optionally) have a list of named subnode types or the `undefined` keyword, which makes the type accepting any subtree (undefined is a shorcut for `any: { ? }`).

<pre class="syntax">
type T: basic_type {
	.subnode_1: basic_type
	...
	.subnode_n: basic_type
}

OR

type T: basic_type {
	undefined
}
</pre>

<div class="attention"><p>Subnodes are always prefixed by the `.` symbol.</p></div> 

Furthermore, given *Ti* in *{T1, ..., Tn}* subtree data types, subnode types can have basic or custom types:

<pre class="syntax">
type T: basic_type {
	.subnode_1: (basic_type OR Ti)
	...
	.subnode_n: (basic_type OR Ti)
}
</pre>

### Custom-typed subtree data types with cardinality

Given R as a range, which specifies the allowed number of occurrences of the subnode in a value, *R = { [min, max], \*, ?}*. Therefore, *R* can be an interval from `min` to `max` (both integers), `*` is a shortcut, meaning any number of occurrences (`[0, *]`), and `?` is a shortcut for `[0, 1]`.

In Jolie, when no cardinality is defined, it is defaulted to the value `[1,1]`, meaning that one and only one occurrence of that subnode can be contained in the node. 

Considering *Ti* in *{T1, ..., Tn}* custom-typed subtree data types and *R* range, the complete syntax for data types follows:

<pre class="syntax">
type T: basic_type {
	.subnode_1[R]: (basic_type OR Ti)
	...
	.subnode_n[R]: (basic_type OR Ti)
}
</pre>

Let us consider the previous example, in which the operation `sum` defines the types of its request and response messages, respectively, as a complex type `SumRequest` and a native type `int`. Hence the declaration of `SumRequest` follows:

<pre class="code">
type SumRequest: void {
	.number [ 2, * ]: int
}
</pre>

The declaration above reads: `SumRequest` is a void-typed node, containing a subtree of nodes among which at least two must be `number`s of native type `int`. 

A type declaration can be used in other type declarations, like in the example below:

<pre class="code">
type mySubType: void {
	.value: double
	.comment: string
}

type myType: string {
	
	.x[ 1, * ]: mySubType

	.y[ 1, 3 ]: void {
		.value*: double
		.comment: string
	}

	.z?: void { ? }
}
</pre>

As we can read, nodes `x` and `y` are similarly typed, both are typed as `void` and have two subnodes: `value`, typed as `double`, and `comment`, typed as `string`.

Let us focus on the cardinality. To be valid, the node `myType` must declare:

- at least one nodes `x` of type `mySubType`;
- a range between one and three of `y`.

Referring to the previous example, `x` requires the definition of both nodes `value` and `comment`, while `y` requires only the definition the node `comment`, since none or an infinite number of nodes `myType.y.value` can be defined. The subnode `z` can be present or not, and can contain any kind of subnode (`{ ? }`).

---

## Creating a communication port

Let us write an complete example of communication ports in Jolie:

<pre class="code">
//sumInterface.ol

type SumRequest: void {
	.number [ 2, * ]: int
}

interface SumInterface {
	RequestResponse: sum( SumRequest )( int )
}
</pre>

`SumInterface` declaration.

<pre class="code">
include "sumInterface.ol"

inputPort SumInput {
	Location: "socket://localhost:8000/"
	Protocol: soap
	Interfaces: SumInterface
}
</pre>

`SumInput` port declaration.

---

## Using communications ports

Once defined, ports can be used for input and output communications. Below we present the syntax of one-way and request-response operations used in the behaviour part for sending (output) and receiving (input) messages.

### Input operations

Receiving one-way operations receive a message and store its content into the provided variable.

<pre class="syntax">
operation_name( response )
</pre>

On the other hand, request-response operations receive a message, do some processing and eventually return back a response. Therefore receiving request-response operations are associated to a scope that contains the code block executed before sending the content of the response variable - the variable provided as argument of the second pair of round brackets.

<pre class="syntax">
operation_name( request )( response ){
	// code block
}
</pre> 

### Output operations

Sending one-way operations are similar to receiving ones although their syntax indicates also the port on which they execute their output.

<pre class="syntax">
operation_name@OutputPort_Name( request )
</pre>

Analogously, also sending request-response operations indicate the port used to send their message. As for sending one-ways no code block is associated with the receiving operation as it simply sends a message and wait until it receives a response from the requested service.

<pre class="syntax">
operation_name@OutputPort_Name( request )( response )
</pre>

---

## Type mismatching

In Jolie, whenever a message is sent or received through a port, its type is checked against what specified in the port's interface. An invoker sending a message with a wrong type receives a `TypeMismatch` fault.

The `TypeMismatch` fault can be handled by exploiting the [fault handling](fault_handling/basics.html), as shown in the following example:

<pre class="code">
scope ( myScope ) 
{
	install( 
		TypeMismatch => println@Console( myScope.TypeMismatch )()
	);
	// code
}
</pre>

### Type mismatching in one-way operations

A `TypeMismatch` check is performed both when a message is sent and received in one-way operations. In the former case the sender checks if the type of the output message matches with the one declared operation's interface. In case of mismatch, the `TypeMismatch` fault is raised and the message is not sent. In the latter case, the receiver checks the type of the incoming message and, if its type does not match, the message is not received and a `TypeMismatch` warning is printed at console.

In case a `TypeMismatch` is raised by the receiver, no fault is sent back to the invoker as a response. Thus, in case a mismatching-typed message is correctly sent by the invoker, it is discarded by the receiver, keeping its behaviour unaffected, while the invoker is not notified with a fault message.

### Type mismatching in request-response operations

Message type declaration can be used for both request and response messages in a request-response operation. Moreover, it is possible to declare types for the fault messages by means of the following syntax:

<pre class="syntax">
op_name ( request_type )( response_type ) throws fault_name ( fault_type )
</pre>

`TypeMismatch` fault in request-response operations leads to four different scenarios, summed in the table below:

<table class="table table-bordered table-striped">
	<tr>
		<th></th>
		<th>Fault raised in REQUEST messages</th>
		<th>Fault raised in RESPONSE messages</th>
	</tr>
	<tr>
		<td><strong>SENDER side</strong></td>
		<td>
			<ul>
				<li>The message is not sent;</li>
				<li>a <code>TypeMismatch</code> exception is raised.</li>
			</ul>
		</td>
		<td>
			<ul>
				<li>a <code>TypeMismatch</code> exception is raised.</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td><strong>RECEIVER side</strong></td>
		<td>
			<ul>
				<li>The message is discarded;</li>
				<li>a warning message is sent to console;</li>
				<li>a <code>TypeMismatch</code> fault message is sent to the sender</li>
			</ul>
		</td>
		<td>
			<ul>
				<li>a <code>TypeMismatch</code> exception is raised.</li>
				<li>a <code>TypeMismatch</code> fault is sent to the sender.</li>
			</ul>
		</td>
	</tr>
</table>

---

## A comprehensive example

Let us consider the following scenario for a comprehensive example on communication ports.

`PercentInterface` defines the `percent` request-response operation. Both request and response messages are typed.

<pre class="code">
//percentInterface.iol

type percent_request: void {
	.part: int
	.total: int
}

type percent_response: void {
	.percent_value: double
}

interface PercentInterface {
	RequestResponse: percent( percent_request )( percent_response )
}
</pre>

The client declares the `outputPort` to communicate with the server and invokes the `percent` operation.

<pre class="code">
//Client.ol

include "console.iol"
include "percentInterface.iol"

outputPort PercService {
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: PercentInterface
}

define valid_request {
	request.total = 10;
	request.part = 3
}

define typeMismatch_request {
	request.total = 10.0;
	request.part = 3
}

main
{
	install( TypeMismatch =>
				println@Console( "TypeMismatch: " + main.TypeMismatch )()
		);
	//valid_request;
	typeMismatch_request;
	percent@PercService( request )( response );
	println@Console( "n"+"Percentage value: "+response.percent_value )()
}
</pre>

The server declares the corresponding `inputPort` to exposes the `percent` service and implements its behaviour.

<pre class="code">
//Server.ol

include "console.iol"
include "percentInterface.iol"

inputPort PercService {
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: PercentInterface
}

main
{
	install( TypeMismatch =>
				println@Console( "TypeMismatch: " + main.TypeMismatch )()
	);

	percent( request )( response ){
		response.percent_value = double( request.part )/request.total
	}
}
</pre>

The programs can be downloaded from the link below:

<div class="download"><a href="documentation/basics/code/communication_ports_code.zip">Communication Ports Code Example</a></div>

Once extracted, the two programs may be run in two separate shells. Make sure to start `server.ol` before `client.ol`. 

Note the presence of two definitions, respectively at Lines 12-15 and Lines 17-18 in client's source code. Both of these procedures set the values of `request.total` and `request.part` in the request message. By switching the comment from Line 27 to 28 and viceversa the invocation of `percent` operation is successful or returns a `TypeMismatch` error.