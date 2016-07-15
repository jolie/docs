## Dynamic binding

Jolie allows output ports to be dynamically bound, i.e., their locations and protocols (called *binding informations*) can change at runtime. Changes to the binding information of an output port is local to a behaviour instance: output ports are considered part of the local state of each instance. Dynamic binding is obtained by treating output ports as variables. For instance, the following would print the location and protocol name of output port `Printer`:

<pre class="code">
// Printer.iol
interface PrinterInterface {
	OneWay: printText( string )
}

//dynamic_binding_example.ol

include "console.iol"
include "Printer.iol"

outputPort P {
	Location: "socket://p:80"
	Protocol: sodep
	Interface: PrinterInterface
}

main
{
	println@Console( P.location )();
	println@Console( P.protocol )()
}
</pre>

Binding information may be entered at runtime by making simple assignments:

<pre class="code">
include "Printer.iol"

outputPort P {
	Interfaces: PrinterInterface
}

main
{
	P.location = "socket://p:80/";
	P.protocol = "sodep"
}
</pre>

---

## The binding registry example

We show a usage example of dynamic binding and binding transmission by implementing a binding registry, i.e., a service that shares binding information. The registry offers a request-response operation, `getBinding`, that returns the binding information for contacting a service. We identify service by simple names. The interface of the registry is thus:

<pre class="code">
interface RIf {
	RequestResponse: getBinding( string )( Binding )
}
</pre>

where `Binding` is the type of port bindings defined in the standard Jolie library. Below we implement the registry behaviour, which supplies binding information for an inkjet printer and a laser printer (whose services we leave unspecified).

<pre class="code">
main
{
	getBinding( name )( b ){
		if ( name == "LaserPrinter" ){
			b.location = "socket://p1.com:80/";
			b.protocol = "sodep"
		} else if ( name == "InkJetPrinter" ) {
			b.location = "socket://p2.it:80/";
			b.protocol = "soap"
		}
	}
}
</pre>

Finally, we define a client that calls `getBinding` for discovering the laser printer:

<pre class="code">
outputPort Registry {
	// omitted
}

outputPort Printer {
	Interfaces: PrinterInterface
}

main
{
	getBinding@Registry( "LaserPrinter" )( Printer );
	printText@Printer( "My text" )
}
</pre>