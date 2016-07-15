## Redirection

Redirection allows the creation of a *master service* acting as a single communication endpoint to multiple service, called resources. The master service receives all the messages meant for the system that it handles. This is obtained by binding an input port of the master service to multiple output ports, each one identifying a service by means of a *resource name*.

Invokers send messages to the master service specifying also the intended resource name. 

The main advantages of such an approach are:

- the possibility to provide a unique access point to the system clients. In this way the services of the system could be relocated and/or replaced transparently to the clients;
- the possibility to provide transparent communication protocol transformations between the invoker and the master and the master and the rest of the system;

<div class="doc_image">
	<img src="documentation/architectural_composition/img/redirection_1.jpg" />
	<p><b>Fig.1</b> Service <code>M</code> redirect messages to services <code>A</code>, <code>B</code>, and <code>C</code> depending on the target destination of the message (<code>M/A</code>, <code>M/B</code>, or <code>M/C</code>)</p>
</div>

For a better understanding of the second advantage, consider Fig.1. Let us suppose that resource A uses a protocol p\_A and a client C, using a different protocol p\_C, needs to interact with A. By invoking the master service M, C can simply interact with A through M (M/A) using p\_C, leaving to M the task to translate the message in protocol p\_A, before forwarding it to A.

The syntax of redirection is:

<pre class="syntax">
inputPort id {
	Location: URI
	Protocol: p
	Redirects:
		sid_1 => OP_id_1,
		//...
		sid_i => OP_id_i,
		//...
		sid_N => OP_id_N
}
</pre>

where `sid_i => OP_id_i` associates a resource name `sid_i` to an output port identifier `OP_id_i`.

The example in Fig.1 is implemented by the code below:

<pre class="code">
outputPort ServiceA {
	Location: "socket://www.a_location.com/"
	Protocol: soap
	Interfaces: A_interface
}

outputPort ServiceB {
	Location: "socket://www.b_location.com/"
	Protocol: sodep
	Interfaces: B_interface
}

outputPort ServiceC {
	Location: "socket://www.b_location.com/"
	Protocol: http
	Interfaces: C_interface
}

inputPort MasterInput {
	Location: "socket://masterservice.com:8000/"
	Protocol: sodep
	Redirects:
		A => ServiceA,
		B => ServiceB,
		C => ServiceC
}
</pre>

Once set, calling a master service for one of its resources is done by declaring the resource name in the location used by the invoker, followed by the resource name separator `!/`, as shown at Line 2

<pre class="code">
outputPort A{
	Location: "socket://masterservice.com/8000/!/A"
	Protocol: sodep
	Interfaces: A_interface
}
</pre>

## Dynamic Redirection

Redirection can be changed dynamically by simply modifying the outputPort location via dynamic port binding.

<pre class="code">
include "console.iol"
include "ui/ui.iol"
include "ui/Swing_ui.iol"

outputPort SubService {
Location: "socket://localhost:2000/"
Protocol: soap
}

outputPort SumService {
Location: "socket://localhost:2001/"
Protocol: soap
}

inputPort MyService {
Location: "socket://localhost:2002/"
Protocol: sodep
Redirects: 	
	Sub => SubService,
	Sum => SumService	
}

main
{	
	keepRunning = true;
	while ( keepRunning ) {
		showInputDialog@SwingUI( "available commands: " +
			"relocateSum, relocateSub, exit." )( command );
		if ( command == "relocateSum" ) {
			showInputDialog@SwingUI( "The current service location is: " +
				SumService.location + 
				"nInsert the new 'SumService' location" )( location );
			SumService.location = location;
			println@Console( "New location set for SumService: " + 
				SumService.location )()
		};
		if ( command == "relocateSub" ) {
			showInputDialog@SwingUI( "The current service location is: " +
				SubService.location + 
				"nInsert the new 'SubService' location" )( location );
			SubService.location = location;
			println@Console( "New location set for SubService: " +
				SubService.location )()
		};
		if ( command == "exit" ) {
			keepRunning = false
		}
	}
}
</pre>