## Ports

Let us recall the concepts of *input ports* and *output ports* seen in the [Behaviour and Deployment](/documentation/getting_started/behavior_and_deployment.html) section. 

There are two kinds of ports: *input ports*, which expose input operations to other services, and *output ports*, defining how to invoke the operations of other services. 

*Location*, *protocol* and *interface* are the three elements in the definition of ports. 

Location and protocol define the concrete binding information between a Jolie program and other service, interfaces specify type information expected to be satisfied by the behaviour that uses the port.

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