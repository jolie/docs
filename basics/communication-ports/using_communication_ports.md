# Communication Primitives

Once defined, ports can be used for input and output communications. Below we present the syntax of one-way and request-response operations used in the behaviour part for sending \(output\) and receiving \(input\) messages.

### Input operations

Receiving one-way operations receive a message and store its content into the provided variable.

```text

operation_name( response )
```

On the other hand, request-response operations receive a message, do some processing and eventually return back a response. Therefore receiving request-response operations are associated to a scope that contains the code block executed before sending the content of the response variable - the variable provided as argument of the second pair of round brackets.

```text

operation_name( request )( response ){
    // code block
}
```

### Output operations

Sending one-way operations are similar to receiving ones although their syntax indicates also the port on which they execute their output.

```text

operation_name@OutputPort_Name( request )
```

Analogously, also sending request-response operations indicate the port used to send their message. As for sending one-ways no code block is associated with the receiving operation as it simply sends a message and wait until it receives a response from the requested service.

```text

operation_name@OutputPort_Name( request )( response )
```

