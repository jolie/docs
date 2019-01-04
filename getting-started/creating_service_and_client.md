# Creating a Service and a Client

Now we want to create a service which is able to double a number, and we want also to create a client which uses that service.
![](../.gitbook/assets/create_service_and_client.png)

## Service's code

```text
inputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    RequestResponse: twice
}

main
{
    twice( number )( result ) {
        result = number * 2
    }
}
```

The server's behaviour starts with an input on operation `twice`, storing the received message in variable `number`. Thereafter, it stores in variable `result` the value of `number` multiplied by 2. Finally, `result` value is sent back to the initial invoker of `twice`.

## Client's code

```text
include "console.iol"

outputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    RequestResponse: twice
}

main
{
    twice@TwiceService( 5 )( response );
    println@Console( response )()
}
```

Complementary to the server's behaviour, the client's behaviour consists in invoking the operation `twice` exposed by the server, passing the number 5 as the invocation value. After sending the request to the server, the operation will wait for a response, storing it in the variable `response`. Finally, the result is printed on screen.

The two programs must be run in two separate shells. Note that it is important to start `service.ol` before `client.ol`, since the server must be ready to receive an invocation before the client tries to reach it.

A complete example can be downloaded here: [Creating a service and a client](https://github.com/jolie/examples/tree/master/01_getting_started).

## Important: enabling the communication by using ports

In order to enable a communication between a service and a client we need to specify the input and the output endpoints. In Jolie we do this by using primitives _input ports_ and _output ports_. The inputPort is used for defining a listener endpoint whereas the outputPort is used for sending messages to an inputPort. In our case, the inputPort will be defined on the service side whereas the outputPort will be defined on the client side.

### Service inputPort

```text
inputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    RequestResponse: twice
}
```

### Client outputPort

```text
outputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    RequestResponse: twice
}
```

Ports are based upon the three fundamental concepts of _location_, _protocol_ and _available operations_. The former two define the concrete binding information between a Jolie program and other services. The last, instead, defines the list of the available operations at the given port.

In particular, a location, e.g. a TCP/IP address, expresses the communication medium that a service uses for exposing its interface or contacting another service. A protocol defines how data to be sent or received should be encoded \(output\) or decoded \(input\).
