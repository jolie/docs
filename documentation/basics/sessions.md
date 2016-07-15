## Sessions and correlation sets

Having multiple instances of a behaviour running in a service introduces the problem of routing incoming messages to the right instance.

Let us clarify with an example. Assume that an E-Commerce service has two behaviour instances opened for buying two products, respectively product A and product B. If a message for performing a payment comes from the network, how can we determine if the payment is for A or it is for B? Supposedly, we should require that the payment message contains some information that allows us to relate it to the correct behaviour instance, e.g., a serial number. In common web application frameworks this issue is covered by *sid* session identifier, a unique key usually stored as a browser cookie.

Jolie supports incoming message routing to behaviour instances by means of *correlation sets*. Correlation sets are a generalisation of session identifiers: instead of referring to a single variable for identifying behaviour instances, a correlation set allows the programmer to refer to the combination of multiple variables, called *correlation variables*. Correlation set programming deals both with the deployment ad behavioural parts. The former must declare the correlation sets, instructing the interpreter on how to relate incoming messages to internal behaviour instances. The latter instead has to assign the concrete values to the correlation variables.

Let us introduce correlation sets via some examples and then look at their syntax.

---

## A simple correlation set example

Managing sessions identifiers through `csets` is simple. 

Let us consider an example in which a server prints at console concurrent messages coming from different clients. Each time a client logs in, the server instantiates a unique `sid`, by means of the `new` function. To request any other operation (`print` or `logout`), each client must send its own `sid` in order to identify its session with the server.

<pre class="code">
//interface.iol

type LoginRequest: void {
	.name: string
}

type OpMessage: void{
	.sid: string
	.message?: string
}

interface PrintInterface {
	RequestResponse: login(LoginRequest)(OpMessage)
	OneWay: print(OpMessage), logout(OpMessage)
}
</pre>

The interface file contains the declaration of operations and data types. Since the `sid` subtype (`OpMessage.sid`) will be used as a variable of the correlation set, it is defined as a non-optional subtype (defaulted to `[1,1]`) and must be present in any message sent and received by all correlated operations. 

<pre class="code">
//server.ol

cset {
	sid: OpMessage.sid
}

main
{
	login( request )( response ){
		username = request.name;
		response.sid = csets.sid = new;
		// code 
	}
}
</pre>

At Lines 3-5 we declare the server's correlation set. `cset` is the scope containing correlation variable declarations. A correlation variable declaration links a list of aliases. A correlation alias is a path (using the same syntax for variable paths) starting with a message type name, indicating where the value for comparing the correlation variable can be retrieved within the message.

In our example the correlation variable `sid` is linked to the alias `OpMessage.sid`.

At Line 11, the `csets` prefix is used to assign a value to the correlation variable `sid`. The same value is assigned to `response.sid` (via chained assignment), which is passed as a response to the client. 

Jolie provides the primitive `new` which returns a *fresh* value to a correlation variable. `new` guarantees to return a value never returned by one of its previous calls.

<pre class="code">
//client.ol

main
{
	login@PrintService( request )( response );
	opMessage.sid = response.sid;
	// if user wants to print
		opMessage.message="my Message";
		print@PrintService( opMessage );
	// else he wants to logout
		logout@PrintService( opMessage )
}
</pre>

Finally, at Line 6, the client assigns the `sid` value to its variable `opMessage.sid`. It will be used in any other message sent to the server to correlate client's messages to its session on the server.

The files of the example above can be downloaded from the following link:

<div class="download"><a href="documentation/basics/code/sessions_code.zip">Sessions Code Example</a></div>

---

## Correlation variables and aliases

Correlation variable declaration links a correlation variable to a list of aliases. Aliases ensure loose coupling between the names of the correlation variables and the data structures of incoming messages.

Let us consider the following scenario: a chat server allows its users to log in and choose the channel (identified by an integer) they want to join. Once subscribed into a channel a user can send a message, log out from the server or switch channel, by sending another subscription request.

Such a scenario can be modelled by means of four message type definitions (one for each operation), as shown in the snippet below:

<pre class="code">
// inteface.ol

type LoginType: void {
	.name: string
}

type SubscriptionType: void {
	.channel: int
	.sid: string
}

type MessageType: void {
	.message: string
	.sid: string
}

type LogType: void {
	.sid: string
}

interface ChatInterface {
	RequestResponse: 
		login( LoginType )( LogType )
	OneWay: 
		subscribe( SubscriptionType ), 
		sendMessage( MessageType ), 
		logout( LogType )
}

// server.ol

cset {
	sid: SubscriptionType.sid
		 MessageType.sid
		 LogType.sid
}
</pre>

At Line 29 the correlation variable `sid` is linked to aliases `SubscriptionType.sid`, `MessageType.sid`, `LogType.sid`. Each time the server will receive a correlated-operation request, it will correlate any client to its corresponding session by checking the aliased value of `sid`.

---

## Multiple correlation variables

More than one correlation variable can be used in order to identify a session. Let us consider a correlation set composed by two correlation variables: `studentId` and `examId`.

<pre class="code">
//interface.iol

include "types/Binding.iol"

type Exam: void {
	.professor: Binding
	.studentId: string
	.examId: string
}

type Exams: void {
	.exam*: Exam
}

type JoinRequest: void {
	.student: Binding
}

type Question: void{
	.studentId: string
	.examId: string
	.question: string
}

type Answer: void{
	.studentId: string
	.examId: string
	.question: string
}

type Score: void{
	.studentId: string
	.examId: string
	.score: int
}

interface StudentInterface {
	OneWay: 
		ok( Score ),
		wrong( Score )

	RequestResponse: 
		ask( Question )( Answer )
}

interface ProfessorInterface {
	OneWay: 
		requestQuestion( Exam )
		forwardAnswer( Answer )

	RequestResponse:
		receiveQuestion( void )( Question )
}

interface ExamInterface{					
	OneWay:	
		openExam( Exam ),
		join( JoinRequest ),
		ok( Score ),
		wrong( Score )
	
	RequestResponse:	
		getExams( string )( Exams )
}
</pre>
<pre class="code">
// server.ol

include "interface.iol"

outputPort Student { Interfaces: StudentInterface }
outputPort Professor { Interfaces: ProfessorInterface }
inputPort Exam { Interfaces: ExamInterface }

cset 
{
	studentId:
		Exam.studentId
		Question.studentId
		Answer.studentId
		Score.studentId,

	examId:
		Exam.examId
		Question.examId
		Answer.examId
		Score.examId
}

main
{
	[ getExams( studentId )( global.exam.( studentId ) ) { 
		nullProcess } 
	]{ nullProcess }

	[ openExam( exam ) ] {
		Professor << exam.professor;
		global.exams.( exam.studentId ).( exam.examId ) << exam;

		join( joinRequest );
		undef( global.exam.( exam.studentId ).( exam.examId );
		Student << joinRequest.student;

		requestQuestion@Professor( exam );
		receiveQuestion@Professor( )( question );		
		ask@Student( question )( answer );
		forwardAnswer@Professor( answer );
		[ ok( score ) ] {
			ok@Student()
		}
		[ wrong( score ) ] {
			wrong@Student()
		}
	}
}

</pre>

In the example above, each time the operation `openExam` is invoked, a new session is instantiated and the exam is added in the list of the available exams of a student, identified by his studentId (Line 19). Then the process waits for the student to join and take part in the exam. After join, the exam starts and it is removed from available exams. Each message exchanged between the Exam service, the Professor and the Student contains both studentId and examId, used as correlation variables. 

`getExams` returns the list of all exams available for a student. Professor and Student ports are dynamically bound.

---

## Multiple correlation sets

Multiple correlation sets can be used in order to manage distributed scenarios.

We report an example of a chat service supporting the management of chat rooms. Chat rooms are identified by name, like in IRC servers. The service allows users to:

- create new chat rooms;
- publish a message in a chat room;
- retrieve published messages from existing chat rooms;
- close chat rooms.

When a client requests the creation of a chat room, the service checks that no other room with the same name exists. Then, it sends an *administration token* back to the invoker. Any client can publish messages in an open chat room. The initial creator can close the chat room at any point by using the administration token.

<pre class="code">
// chat.iol

type CreateRoomRequest:void {
	.name:string
	.description:string
}

type CloseRoomMessage:void {
	.adminToken:string
	.reason:string
}

type SendMessage:void {
	.roomName:string
	.content:string
}

interface ChatInterface {
OneWay: publish(SendMessage), 
		close(CloseRoomMessage)
RequestResponse: create(CreateRoomRequest)(string)	
}
</pre>
<pre class="code">
// server.iol
include "chat.iol"
include "console.iol"
include "security_utils.iol"

execution { concurrent }

cset { 
	name: 	CreateRoomRequest.name
			SendMessage.roomName 
}

cset { 
	adminToken: CloseRoomMessage.adminToken 
}

inputPort ChatInput {
Location: "socket://localhost:8000/"
Protocol: sodep
Interfaces: ChatInterface
}

main {
	create( createRoomRequest )( csets.adminToken ) {
		csets.adminToken = new
	}; run = 1;
	while( run ) {
		[ publish( message ) ] {
			println@Console( "[" + csets.name + "]: " + message.content )()
		}
		[ close( closeMessage ) ] {
			run = 0;
			println@Console(	"Chat room " + csets.name + 
								" closed. Reason: " + closeMessage.reason )()
		}
	}
}
</pre>

Two csets are defined, one for chat-management operations and the other for publishing messages.

The first instruction is an input on operation `create`. We call this input instruction a *session start*, since its execution will start a new chat (instantiating the correlation variable `name`). After invocation, the service enters a loop containing a choice of two inputs with operations `publish` (for publishing in the chat room) and `close` (for closing the chat room).

---

## Correlation sets syntax

Correlation sets are declared in the deployment part of a program using the following syntax:

<pre class="syntax">
cset {
	correlationVariable_1: alias_11 alias_12, ...
	correlationVariable_2: alias_21 alias_22, ... 
}
</pre>

The fact that correlation aliases are defined on message types makes correlation definitions statically strongly typed. A static checker verifies that each alias points to a node that will surely be present in every incoming message of the referenced type; technically, this means that the node itself and all its ancestors nodes are not optional in the type.

For services using `sequential` or `concurrent` execution modalities, for each operation used in an input statement in the behaviour there is exactly one correlation set that links all its variables to the type of the operation. Since there is *exactly one* correlation set referring to an operation, we can unambiguously call it the correlation set for the operation.

Whenever a service receives a message through an input port (and the message is correctly typed with relation to the port's interface) there are three possibilities, defined below.

- The message correlates with a behaviour instance. In this case the message is received and given to the behaviour instance, which will be able to consume it through an input statement for the related operation of the message.
- The message does not correlate with any behaviour instance and its operation is a starting operation in the behavioural definition. In this case, a new behaviour instance is created and the message is assigned to it. If the starting operation has an associated correlation set, all the correlation variables in the correlation set are atomically assigned (from the values of the aliases in the message) to the behaviour instance before starting its executing.
- The message does not correlate with any behaviour instance and its operation is not a starting operation in the behavioural definition. In this case, the message is rejected and a `CorrelationError` fault is sent back to the invoker.