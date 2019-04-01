# Jolie concepts: an overview

We present the Jolie interpretation of some fundamental concepts behind programming microservices, like those of _service_ and _interface_.

## Services

The _service_ is the unit of reusable software in Jolie. All components are services.

Services communicate with each other by exchanging messages. That is the only way that they have for exchanging data with each other. Service share no memory, although shared memory is sometimes used under the hood by Jolie to optimise some message exchanges (for example by using shared memory channels among services living in the same execution context.

## Ports and Interfaces

A service offers an API that other services can invoke by means of access points called _input ports_. An input port must define how it can be accessed (e.g., by accepting connections on a TCP port), the transport protocol that it uses (e.g., HTTP), and the _interface_ that it exposes (which concretely defines the data types and available operations of the exposed API). Likewise, a service can invoke another service by means of _output ports_ with a compatible configuration.

For example, this is a `CalculatorIface` interface offering an operation `sum` that takes two integers called `x` and `y` and returns an integer.

```jolie
type SumRequest:void {
    .x:int
    .y:int
}

interface CalculatorIface {
RequestResponse:
     sum( SumRequest )( int ) 
}
```

Interfaces are machine-readable and -checkable. An interface acts as the contract between a service and its clients.

A service can expose this interface by using an input port as follows.

```jolie
inputPort CalculatorInput {
Location: "socket://localhost:8080" // accept connections on TCP port 8080
Protocol: http // Use the http protocol
Interfaces: CalculatorIface
}
```

Jolie is flexible regarding access points: in general, a service can have many input ports, each one exposing one or more different interfaces.

## Behaviours and Processes

A _behaviour_ defines the logic to execute when a message is received by a service. A behaviour can perform computation using the received data and/or send messages to other services. 
In Jolie the behaviour is expressed in the _main_ code block. A behaviour can define different operations, and different logics can be attached to different operations.

For example, this is a behaviour implementing the calculator service.

```jolie
main
{
    // Receive a request and response with the sum of the two subnodes x and y
    sum( request )( request.x + request.y )
}
```

Behaviours are executed by _processes_. Whenever `sum` is invoked in our example, the service would start a new (light-weight) process with its own private memory space.
