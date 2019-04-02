# Glossary

## Operation

A functionality exposed by a service.

There are two types of operations:
- _one-way_ operations, which simply receive a message;
- _request-response_, which receive a message and send back a response.

## Interface

A machine-readable and -checkable declaration of a set of operations, which defines an API.
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

We say that an output port is _connected to_ an input port when it is meant that messages sent through the former will reach the latter.

This typically happens when the output port has the same location and protocol as the target input port, but
network or container configurations might alter this. As such, knowing the connections in a system requires looking both at 
the involved Jolie programs and how they are deployed in the system.

## Behaviour

A code block in Jolie. A behaviour can perform computation and communicate with other services by using primitives for sending and receiving messages.

**Non userei il termine block che mi richiama una sottoporzione di programma**
**FM: cosa useresti? Comunque e' corretto che il behaviour e' una porzione. Il programma intero si chiama appunto programma.
Il behaviour della procedura `main` e' quello che definisce il comportamento del servizio. E' sempre un behaviour come gli altri (e.g., il codice delle altre procedure fatte con define). Ma siccome sta in quel posto speciale, e' quello che definisce il comportamento del servizio. Ho aggiunto questa spiegazione. 
**

**CG: io toglierei proprio la frase "A code block in Jolie"**

The behaviour contained in the `main` procedure of a service defines the logic that the service will execute.

## Procedure

**FM: non sarebbe male trovare un buon termine qui, per ora ho messo procedure. Il problema e' che "definition" e' troppo generico.**

**CG: a che servirebbe questo? Non mi è chiaro**

A named behaviour, which can be invoked by other behaviours. Procedures in Jolie have a call stack and support general recursion, but they are parameterless (the state is shared among all procedure calls).

## Process

A running instance of a behaviour, equipped with its own private state and message queues.

## Conversation

A series of related message exchanges between two or more services.

## Program

A complete, executable Jolie program.

## Composition
The Composition (or a service composition) is a unitary linguistic definition which joins interfaces to ports and ports to behaviours.

## Engine
The Engine is the runtime support that executes a Composition. That is, a service is obtained by executing a Composition within the Engine.

## Service

The unit of reusable applications in Jolie. All components are services.

Services communicate with each other by exchanging messages.
That is the only way that they have for exchanging data with each other.
Service share no memory, although shared memory is sometimes used under the hood by Jolie to
optimise some message exchanges (for example by using shared memory channels among services living in
the same **VM [change this term later]**).

**prosposta inclusiva delle definizioni sopra**
A service is the running instance of a composition into an engine. 


## Embedding

**FM: ho spostato embedding in fondo per ora, poi vediamo come rientra nel discorso globale quando abbiamo finito con il service runtime/environment/whatever it is.**

A service can _embed_ other services. We call the service embedding the others the _embedder_ service, and the others _embedded_ services.
Embedding produces a hierarchy, where the embedder is the parent service of
its embedded services. This hierarchy handles termination: whenever an embedder service terminates, all its embedded services
are recursively terminated. The hierarchy is also useful for enhancing performances: services in the same
VM can communicate using fast shared memory communication channels.
