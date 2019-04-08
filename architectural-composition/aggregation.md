# Aggregation

The _Aggregation_ is an architectural operator between an inputPort and a set of outpurPorts which allows for composing services in a way that the API of the aggregated services are merged with those of the aggregator. It is a generalisation of network proxies that allow a service to expose operations without implementing them in its behaviour, but delegating them to other services. Aggregation can also be used for programming various architectural patterns, such as load balancers, reverse proxies, and adapters.

The syntax for aggregation extends that given for input ports.

```text

inputPort id {
    Location: URI
    Protocol: p
    Interfaces: iface_1, ..., iface_n
    [ Aggregates: outputPort_1, outputPort_2, ... ]
}
```

Where the `Aggregates` primitive expects a list of output port names.

![](../.gitbook/assets/aggregation.png)

If we observe the list of the operations available at the inputPort of the aggregator, we will see the list of all the aggregated operations together with those of the aggregator. 

## How Aggregation works
We can now define how aggregation works. Given IP as an input port, whenever a message for operation OP is received through IP, we have three scenarios:

* OP is an operation declared in one of the interfaces of IP. In this case, the message is normally received by the program.
* OP is not declared in one of the interfaces of IP and is declared in the interface of an output port \(OP\_port\) aggregated by IP. In this case the message is forwarded to OP\_port port as an output from the aggregator.
* OP is not declared in any interface of IP or of its aggregated output ports. Then, the message is rejected and an `IOException` fault is sent to the caller.

We can observe that in the second scenario aggregation _merges_ the interfaces of the aggregated output ports and makes them accessible through a single input port. Thus, an invoker would see all the aggregated services as a single one.

Remarkably, aggregation handles the request-response pattern seamlessly: when forwarding a request-response invocation to an aggregated service, the aggregator will automatically take care of relaying the response to the original invoker.

As an example let us consider the case of two services, the printer and fax, aggregated into one service which also add another operation called _faxAndPrint_. The code may be consulted [here](https://github.com/jolie/examples/tree/master/04_architectural_composition/06_aggregation/01_aggregation_and%20orchestration).

![](../.gitbook/assets/aggregation_example.png)

The service _printer_ offers two operations called _print_ and _del_. The former allows for the printing of a document whereas the latter allows for its deletion from the queue. On the other hand the service _fax_ offers just one operation called _fax_. The aggregator, aggregates on its inputPort called _Aggregator_ both the printer and fax services as it is shown below where we report the ports declaration of the aggregator service:

```jolie
include "printer.iol"
include "fax.iol"

type FaxAndPrintRequest: void {
	.fax: FaxRequest
	.print: PrintRequest
}

interface AggregatorInterface {
	RequestResponse:
		faxAndPrint( FaxAndPrintRequest )( void ) throws Aborted
}


outputPort Printer {
Location: "socket://localhost:9000"
Protocol: sodep
Interfaces: PrinterInterface
}

outputPort Fax {
Location: "socket://localhost:9001"
Protocol: sodep
Interfaces: FaxInterface
}

inputPort Aggregator {
Location: "socket://localhost:9002"
Protocol: sodep
Interfaces: AggregatorInterface
Aggregates: Printer, Fax
}
```
It is worth noting that the inputPort _Aggregator_ actually offers all the operations available at outputPorts _Printer_ and _Fax_ which are connected with service _printer_ and _fax_ respectively. Moreover, the same inputPort declares also to make available the operations defined into interface _AggregatorInterface_ where one operation is defined: _faxAndPrint_. As a result, the following operations are available at the inputPort _Aggregator_:

* _print_: which is executed by service _printer_;
* _del_: which is executed by service _printer_;
* _fax_: which is executed by service _fax_;
* _faxAndPrint_: which is executed by the aggregator

In particular, let us notice that the operation _faxAndPrint_ actually orchestrates the operations _print_ and _fax_ in order to provide a unique operation which executes both of them. 


## Aggregation and embedding

We give an example where three services - `A`, `B`, and `C` - are aggregated by a service `M`, which also embeds `C`.

```text
outputPort A {
    Location: "socket://someurlA.com:80/"
    Protocol: soap
    Interfaces: InterfaceA
}

outputPort B {
    Location: "socket://someurlB.com:80/"
    Protocol: xmlrpc
    Interfaces: InterfaceB
}

outputPort C {
    Interfaces: InterfaceC
}

embedded {
    Java: "example.serviceC" in C
}

inputPort M {
    Location: "socket://urlM.com:8000/"
    Protocol: sodep
    Aggregates: A, B, C
}
```

The code for aggregating services abstracts their actual deployment and remains the same either it is an embedded service \(C\) or an "external" one \(A,B\); this abstraction is achieved by setting the aggregation definition on output ports, which uncouples from it both the implementation and the location of the target service.

![](../.gitbook/assets/aggregation_1.png)

**Fig.1** The aggregator `M` exposes the union of all the interfaces of the services it aggregates \(`A`, `B`, `C`\). Service `C` executes inside the virtual machine of `M`, by embedding. Interfaces are represented with dotted rectangles

The obtained architectures is graphically represented in Fig.1, where we assume that the aggregated interfaces are singletons.

The grey arrows represent how messages will be forwarded. E.g., an incoming message for operation `op3` will be forwarded to the embedded service `C`.


## The forwarder

Aggregation can be used for system integration, e.g., bridging services that use different communication technologies or protocols. The deployment snippet below creates a service that forwards incoming SODEP calls on TCP port 8000 to the output port `MyOP`, converting the received message to SOAP.

```text
outputPort MyOP {
    Location: "socket://someurl.ex:80"
    Protocol: soap
    Interfaces: MyInterface
}

inputPort MyInput {
    Location: "socket://localhost:8000"
    Protocol: sodep
    Aggregates: MyOP
}
```

