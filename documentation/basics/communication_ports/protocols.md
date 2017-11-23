### Protocols

A protocol defines how data to be sent or received should be, respectively, encoded or decoded, following an isomorphism. 

Protocols are referred by name. Examples of valid (supported) protocol names are:

- `http`
- `https`
- `soap`
- `sodep` (a binary protocol specifically developed for Jolie)
- `xmlrpc`

For a thorough description of the protocols supported by Jolie and their parameters see [Protocols](/documentation/protocols/introduction.html) section.

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

<pre><code class="language-jolie code">inputPort SumInput {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: SumInterface
}
</code></pre>

`SumInput` is an inputPort, and it exposes the operations defined in `SumInterface` interface. Such operations can be invoked at the TCP/IP socket `localhost`, on port `8000`, and by encoding messages with the `soap` protocol.

Finally, let us define the `SumServ` outputPort, which is used to invoke the services exposed by `SumInput`:

<pre><code class="language-jolie code">outputPort SumServ {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: SumInterface
}
</code></pre>

---