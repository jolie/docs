# Ports

In Jolie there are two kinds of ports:

* _input ports_: which expose input operations to other services;
* _output ports_: which define how to invoke the operations of other services.

Within each port, both input and output, it is possible to define three elements:

* _Location_; 
* _Protocol_;
* _Interfaces_.

The Location defines _where_ the service is listening for a message \(in the case of input ports\) or where the message has to be sent \(in the case of output ports\). The Protocol defines _how_ Jolie will send or receive a message. It could defines both the transportation protocol \(e.g. http\) and the message format \(e.g. json\). Finally, Interfaces specify the list of the available operations and the related message types information. In particular, in case of an input port, an interfaces specifies the operation exhibited by the current service, whereas in the case of an output port it defines the operations which can be invoked by that service.

Usually we graphically represent outputPorts with red triangles and inputPort with yellow squares. As an example, in the diagram below we represent a client connected to a server by means of an outputPort defined in the client and an inputPort defined in the server.

![](../../../.gitbook/assets/creating_service_and_client.png)

## The syntax of input and output ports

The syntax for input and output ports is, respectively:

```jolie
inputPort id {
    Location: URI
    Protocol: p
    Interfaces: iface_1, 
                ..., 
                iface_n
}
```

```jolie
outputPort id {
    Location: URI
    Protocol: p
    Interfaces: iface_1, 
                ..., 
                iface_n
}
```

where `URI` is a [URI](http://en.wikipedia.org/wiki/Uniform_resource_identifier) \(Uniform Resource Identifier\), defining the location of the port; `id`, `p` and `iface_i` are the identifiers representing, respectively, the name of the port, the data protocol to use, and the interfaces accessible through the port.

## Locations

A location expresses the communication medium and the address a service uses for exposing its interface \(input port\) or invoking another service \(output port\).

A location must indicate the communication medium the port has to use and its related parameters in this form: `medium[:parameters]` where _medium_ is a medium identifier and the optional _parameters_ is a medium-specific string. Usually the medium parameters define the address where the service is actually located.

Jolie currently supports four media:

* `local` \(Jolie in-memory communication\);
* `socket` \(TCP/IP sockets\).
* `btl2cap` \(Bluetooth L2CAP\);
* `rmi` \(Java RMI\);
* `localsocket` \(Unix local sockets\);

An example of a valid location is: `"socket://www.mysite.com:80/"`, where `socket://` is the location medium and the following part represents the address.

For a thorough description of the locations supported by Jolie and their parameters see [Locations](https://github.com/jolie/docs/tree/f99116a5ee813ad79e1967682b95c2ab305c9c0e/basics/communication-ports/locations/introduction/README.md) section.

## Protocols

A protocol defines how data to be sent or received should be, respectively, encoded or decoded, following an isomorphism.

Protocols are referred by name. Examples of valid \(supported\) protocol names are:

* `http`
* `https`
* `soap`
* `sodep` \(a binary protocol specifically developed for Jolie\)
* `xmlrpc`
* `jsonrpc`

For a thorough description of the protocols supported by Jolie and their parameters see [Protocols](https://github.com/jolie/docs/tree/f99116a5ee813ad79e1967682b95c2ab305c9c0e/basics/communication-ports/protocols/introduction/README.md) section.

Let us consider the following input port declaration:

```jolie
inputPort SumInput {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: SumInterface
}
```

`SumInput` is an inputPort, and it exposes the operations defined in `SumInterface` interface. Such operations can be invoked at the TCP/IP socket `localhost`, on port `8000`, and by encoding messages with the `soap` protocol.

Finally, let us define the `SumServ` outputPort, which is used to invoke the services exposed by `SumInput`:

```jolie
outputPort SumServ {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: SumInterface
}
```

## Multiple ports

More than one input and one output ports can be defined into a service thus, enabling a service to receive messages from different location and different protocols.

![](../../../.gitbook/assets/multipleports.png)

As an example, in the following piece of service, two input ports and three outputPorts are declared:

```jolie
include "Interface1.iol"
include "Interface2.iol"
include "Interface3.iol"
include "MyInterface.iol"

execution{ concurrent }

outputPort OutputPort1 {
    Location: "socket://localhost:9000/"
    Protocol: sodep
    Interfaces: Interface1
}

outputPort OutputPort2 {
    Location: "socket://localhost:9001/"
    Protocol: sodep
    Interfaces: Interface2
}

outputPort OutputPort3 {
    Location: "socket://localhost:9002/"
    Protocol: sodep
    Interfaces: Interface3
}

inputPort InputPort1 {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: MyInterface
}

inputPort InputPort2 {
    Location: "socket://localhost:8001/"
    Protocol: sodep
    Interfaces: MyInterface
}

main {
...
}
```

