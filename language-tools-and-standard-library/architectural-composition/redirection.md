# Redirection

## Redirection

Redirection allows for the creation of a service, called _proxy_, acting as a single communication endpoint for multiple services, called _resources_. Similarly to an [aggregator](aggregation.md), a proxy receives all the messages meant for the system that it handles, but it transparently exposes the resource names of the redirected services. Redirection is syntactically obtained by binding an input port of the proxy service to multiple output ports, each one identifying a service by means of a _resource name_.

![](../../.gitbook/assets/redirection.png)

The main advantages of redirection are:

* the possibility to provide a unique access point to the system clients. In this way the services of the system could be relocated and/or replaced transparently to the clients;
* the possibility to provide transparent communication protocol transformations between the invoker and the master and the master and the rest of the system;

### The syntax

The syntax of redirection is:

```jolie
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
```

where `sid_i => OP_id_i` associates a resource name `sid_i` to an output port identifier `OP_id_i`.

#### How to add a resource name to a location

The resource name must be specified into the location of service to invoke within the output port. The syntax os very simple, it i sufficient to put the token `/!/` between the redirector location and the resource name. As an example let us consider the following locations:

* `socket://localhost:9000/!/A`: where `socket://localhost:9000` is the base location of the redirector port and `A` is the resource name of the target service.
* `socket://200.200.200.200:19000/!/MyService`: where `socket://200.200.200.200:19000` is the base location of the redirector port and `MyService` is the resource name of the target service.

### Example

In the following example we show a simple redirection scenario where a proxy provides a common endpoint for two services, _Sum_ and _Sub_, which performs addiction and substraction respecitvely. At this [link](https://github.com/jolie/examples/tree/master/04_architectural_composition/07_redirection/01_static_redirection) it is possible to check the complete code.

![](../../.gitbook/assets/redirection_example.png)

The redirection is obtained by simply using the `Redirects` keyword as explained above:

```jolie
outputPort SubService {
Location: Location_Sub
Protocol: sodep
}

outputPort SumService {
Location: Location_Sum
Protocol: sodep
}

inputPort Redirector {
Location: Location_Redirector
Protocol: sodep
Redirects:
    Sub => SubService,
    Sum => SumService
}
```

It is worth noting that, differently from an aggregation scenario where the client just uses a unique output port for sending messages to the target service, here the client has two output ports, one for the service _Sum_ and one for the service _Sub_.

```jolie
outputPort Sub {
  Location: "socket://localhost:9000/!/Sub"
  Protocol: sodep
  Interfaces: SubInterface
}

outputPort Sum {
  Location: "socket://localhost:9000/!/Sum"
  Protocol: sodep
  Interfaces: SumInterface
}
```

From an architectural point of view, redirection and aggregation are different. The most important element to be kept in mind is what the client is able to see on the input port of the aggregator and on the input port of the redirector. On the former case, the client is not aware of the services handled by the aggregator because it just sees a unique service which exposes all the operations, whereas in the latter case, the client is aware of the target services and it needs to treat them as separate entities with different output ports.

## Exploiting redirection for transparent protocol transformation

Redirection can be used for transparently transforming messages from a protocol to another. As an example let us consider the scenario discussed in the previous section where the redirector exposes a port using protocol `sodep` and but it internally communicates with the redirected services using protocol `http`. The complete code of the example can be found [here](https://github.com/jolie/examples/tree/master/04_architectural_composition/07_redirection/02_redirection_change_protocol).

![](../../.gitbook/assets/redirection_example_protocol_sodep.png)

