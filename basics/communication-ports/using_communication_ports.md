# Communication Primitives

Communication primitives are strictly related to the operations declared in the interfaces and the ports defined into the service. Communication primitives can be divided in two categories:

* input primitives
* output primitives

Input primitives are triggered by a message reception, whereas the output primtives enable a message sending.

### Input primitives
Input primitives can be divided in two types which also correspond to those used into the interface declaration:

* **one-way**: a message can be received from an external caller. It must correspond to a OneWay operation declared into an interface.
* **request-response**: a message can be received from an external caller, and a synchronous reply can be sent back. It must correspond to a RequestResponse operation declared into an interface.

In order to program a one-way operation inside the behaviour of a service, it is sufficient to declare the name of the OneWay operation published into an inputPort of the service followed by the name of the variable between brackets where the received message will be stored.

```text

operation_name( response )
```

On the other hand, a request-response operation requires the name of a RequestResponse operation defined into an interface followed by two variables: the former is in charge to store the receiving message whereas the latter is in charge to store the replying message. Both the variables must be defined within brackets. Since a request-response primitive is a synchronous primitive, between the request and the response message some code can be executed. The caller will wait for the termination of that code before receiving for the reply.

```text

operation_name( request )( response ){
    // code block
}
```

### Output primitives

Sending one-way operations are similar to receiving ones although their syntax indicates also the port on which they execute their output.

```text

operation_name@OutputPort_Name( request )
```

Analogously, also sending request-response operations indicate the port used to send their message. As for sending one-ways no code block is associated with the receiving operation as it simply sends a message and wait until it receives a response from the requested service.

```text

operation_name@OutputPort_Name( request )( response )
```

