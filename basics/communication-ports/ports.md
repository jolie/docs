# Ports

Let us recall the concepts of _input ports_ and _output ports_ seen in the [Behaviour and Deployment](https://jolielang.gitbook.io/docs/getting-started/behavior_and_deployment) section.

There are two kinds of ports: _input ports_, which expose input operations to other services, and _output ports_, defining how to invoke the operations of other services.

_Location_, _protocol_ and _interface_ are the three elements in the definition of ports.

Location and protocol define the concrete binding information between a Jolie program and other service, interfaces specify type information expected to be satisfied by the behaviour that uses the port.

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