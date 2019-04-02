# Glossary

## Operation

A functionality exposed by a service.

There are two types of operations:
- _one-way_ operations, which simply receive a message;
- _request-response_, which receive a message and send back a response.

## Interface

A machine-readable and -checkable declaration of a set of operations.
An interface acts as the contract between a service and its clients.

## Ports

Ports are endpoints used for sending and receiving messages.
There are two kind of ports: _input ports_ and _output ports_.
The former are used for receiving messages the latter for sending messages.
An input port must define how it can be accessed (e.g., by accepting connections on a TCP port),
the transport protocol that it uses (e.g., HTTP), and the _interface_
that it exposes (which concretely defines the data types and available operations of the exposed API).
Likewise, a service can invoke another service by means of _output ports_ with a compatible configuration.

## Connection

We say that an output port is _connected to_ an input port when messages sent through the former will reach the latter.
This typically happens when the output port has the same location and protocol as the target input port, but
network or container configurations might alter this. As such, knowing the connections in a system requires looking both at 
the involved Jolie programs and how they are deployed in the system.

## Behaviour

A code block in Jolie.

A behaviour defines the logic executed by a service. It can perform computation using the received
data and/or send messages to other services.

## Process

A running instance of a behaviour, equipped with its own private state and message queues.

## Session

A conversation between two or more services.

## Program

A complete, executable Jolie program.

## Jolie Virtual Machine (o la chiamiamo Jolie Runtime in qualche modo?)

The Virtual Machine (VM) executing a Jolie program.

## Service

The _service_ is the unit of reusable software in Jolie. All components are services.

Services communicate with each other by exchanging messages.
That is the only way that they have for exchanging data with each other.
Service share no memory, although shared memory is sometimes used under the hood by Jolie to
optimise some message exchanges (for example by using shared memory channels among services living in
the same VM).

## Embedding

A service can _embed_ other services. We call the service embedding the others the _embedder_ service, and the others _embedded_ services.
Embedding produces a hierarchy, where the embedder is the parent service of
its embedded services. This hierarchy handles termination: whenever an embedder service terminates, all its embedded services
are recursively terminated. The hierarchy is also useful for enhancing performances: services in the same
VM can communicate using fast shared memory communication channels.


## Microservice 

A service with no embedded services.
