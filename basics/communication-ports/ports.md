# Ports

In Jolie there are two kinds of ports:
- _input ports_: which expose input operations to other services;
- _output ports_: which define how to invoke the operations of other services.

Within each port, both input and output, it is possible to define three elements: 
- _Location_; 
- _Protocol_;
- _Interfaces_.

The Location defines _where_ the service is listening for a message (in the case of input ports) or where the message has to be sent (in the case of output ports). The Protocol defines _how_ Jolie will send or receive a message. It could defines both the transportation protocol (e.g. http) and the message format (e.g. json). Finally, Interfaces specify the list of the available operations and the related message types information. In particular, in case of an input port, an interfaces specifies the operation exhibited by the current service, whereas in the case of an output port it defines the operations which can be invoked by that service.

## The syntax of input and output ports

The syntax for input and output ports is, respectively:

```text
inputPort id {
    Location: URI
    Protocol: p
    Interfaces: iface_1, 
                ..., 
                iface_n
}
```

```text
outputPort id {
    Location: URI
    Protocol: p
    Interfaces: iface_1, 
                ..., 
                iface_n
}
```

where `URI` is a [URI](http://en.wikipedia.org/wiki/Uniform_resource_identifier) \(Uniform Resource Identifier\), defining the location of the port; `id`, `p` and `iface_i` are the identifiers representing, respectively, the name of the port, the data protocol to use, and the interfaces accessible through the port.

Details about Location, Protocol and Interfacescan be found in the next sections.
