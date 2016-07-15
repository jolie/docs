## Behaviour instances

A service participates in a session by executing an instance of its behaviour. So far we have executed behaviours a single time, which means that each service we run supported only a single session. If needed again, the service must be executed manually another time.

Jolie allows to reuse behavioural definition multiple times with the *execution modality* deployment primitive, whose syntax is:

<pre class="syntax">
execution { single | concurrent | sequential }
</pre>

`single` is the default execution modality (so the `execution` construct can be omitted), which runs the program behaviour once. `sequential`, instead, causes the program behaviour to be made available again after the current instance has terminated. This is useful, for instance, for modelling services that need to guarantee exclusive access to a resource. Finally, `concurrent` causes a program behaviour to be instantiated and executed *whenever its first input statement can receive a message*.

<div class="attention"><p>In the `sequential` and `concurrent` cases, the behavioural definition inside the main procedure must be an input statement.</p></div>

A crucial aspect of behaviour instances is that each instance has its own private state, determining variable scoping. This lifts programmers from worrying about race conditions in most cases.

For instance, let us recall the server program given at the end of [Communication Ports](basics/communication_ports.html) section. We can simply add the deployment instruction `execution{ concurrent }` to the server's deployment to make it supporting multiple clients at the same time. Access to variables would be safe since each behaviour instance would have its private state.

<pre class="code">
//Server.ol

include "console.iol"
include "percentInterface.iol"

inputPort PercService {
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: PercentInterface
}

execution{ concurrent }

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

---

## `init{}`

Jolie also supports special procedures for initialising a service before it makes its behaviours available. The `init{}` scope allows the specification of such procedures. All the code specified within the `init{}` scope is executed only once, when the service is started.

---

## Global variables

Jolie also provides *global variables* to support sharing of data among different behaviour instances. These can be accessed using the `global` prefix:

<pre class="code">
global.myGlobalVariable = 3 // Global variable
myLocalVariable = 1 // Local to this behaviour instance
</pre>

---

## Synchronisation 

Concurrent access to global variables can be restricted through `synchronized` blocks, similarly to Java:

<pre class="syntax">
synchronized( id ){
	//code
} 
</pre>

The synchronisation block allows only one process at a time to enter any `synchronized` block sharing the same `id`.

---

## A comprehensive example

Let us consider a comprehensive example using the concepts explained in this section. 

The register service has a concurrent execution and exposes the `register` request-response operation. `register` increments a global variable, which counts the number of registered users, and sends back a response to the client.

*regInterface.ol*

<pre class="code">
type register: void {
	.message: string
}

interface RegInterface {
	RequestResponse: register( void )( response )
}
</pre>

*server.ol*

<pre class="code">
include "regInterface.iol"

inputPort Register {
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: RegInterface
}

execution { concurrent }

init 
{	
	global.registered_users=0;
	response.message = "Successful registration.nYou are the user number "
}

main 
{
	register()( response ){
		synchronized( syncToken ) {
			response.message = response.message + ++global.registered_users
		}
	}
}
</pre>

*client.ol*

<pre class="code">
include "regInterface.iol"
include "console.iol"

outputPort Register {
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: RegService
}

main 
{
	register@Register()( response );
	println@Console( response.message )()
}
</pre>

The programs can be downloaded from the link below:

<div class="download"><a href="documentation/basics/code/processes_code.zip">Processes Code Example</a></div>

Once extracted, the two programs may be run in two separate shells. Make sure to start `register.ol` before `client.ol`. Try to start more than one `client.ol` at once and see the results.