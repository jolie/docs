# Protocols

A protocol defines how data to be sent or received should be, respectively, encoded or decoded, following an isomorphism.

Protocols are referred by name. Examples of valid \(supported\) protocol names are:

* `http`
* `https`
* `soap`
* `sodep` \(a binary protocol specifically developed for Jolie\)
* `xmlrpc`

For a thorough description of the protocols supported by Jolie and their parameters see [Protocols](../protocols/introduction/) section.

Let us consider the following input port declaration:

```text
inputPort SumInput {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: SumInterface
}
```

`SumInput` is an inputPort, and it exposes the operations defined in `SumInterface` interface. Such operations can be invoked at the TCP/IP socket `localhost`, on port `8000`, and by encoding messages with the `soap` protocol.

Finally, let us define the `SumServ` outputPort, which is used to invoke the services exposed by `SumInput`:

```text
outputPort SumServ {
    Location: "socket://localhost:8000/"
    Protocol: soap
    Interfaces: SumInterface
}
```

