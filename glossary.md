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

**così però andiamo ad introdurre il concetto che una connessione esiste solamente quando c'è anche una rete che permette alle due porte di parlarsi, a noi servirebbe un concetto un pelo più astratto per quando si va a fare il design di un'architettura, ossia io disegno due porte che per me sono connesse ma poi mi aspetto che sotto la rete sia predisposta a realizzare tale connessione. Proposta: ...when messages sent through the former potentially reach the latter.**

**Oppure teniamo così la definizione di connection ma ne introduciamo un'altra più astratta per rappresentare quello che intendo io. Se ci rifacciamo al tema dei circuiti potremmo utilizzare il termine Tracks (o qualcosa di simile)**

**FM: sono d'accordo. Vorrei un concetto solo, ho cambiato un pelo questo. Ti torna?**

This typically happens when the output port has the same location and protocol as the target input port, but
network or container configurations might alter this. As such, knowing the connections in a system requires looking both at 
the involved Jolie programs and how they are deployed in the system.

## Behaviour

A code block in Jolie. A behaviour can perform computation and communicate with other services by using primitives for sending and receiving messages.

**Non userei il termine block che mi richiama una sottoporzione di programma**
**FM: cosa useresti? Comunque e' corretto che il behaviour e' una porzione. Il programma intero si chiama appunto programma.
Il behaviour della procedura `main` e' quello che definisce il comportamento del servizio. E' sempre un behaviour come gli altri (e.g., il codice delle altre procedure fatte con define). Ma siccome sta in quel posto speciale, e' quello che definisce il comportamento del servizio. Ho aggiunto questa spiegazione.
**

The behaviour contained in the `main` procedure of a service defines the logic that the service will execute.

## Procedure

**FM: non sarebbe male trovare un buon termine qui, per ora ho messo procedure. Il problema e' che "definition" e' troppo generico.**

A named behaviour, which can be invoked by other behaviours. Procedures in Jolie have a call stack and support general recursion, but they are parameterless (the state is shared among all procedure calls).

## Process

A running instance of a behaviour, equipped with its own private state and message queues.

## Conversation

A series of related message exchanges between two or more services.

## Program

A complete, executable Jolie program.

## Service

The unit of reusable applications in Jolie. All components are services.

Services communicate with each other by exchanging messages.
That is the only way that they have for exchanging data with each other.
Service share no memory, although shared memory is sometimes used under the hood by Jolie to
optimise some message exchanges (for example by using shared memory channels among services living in
the same **VM [change this term later]**).


## Service definition [da definire bene; nome da migliorare.]

The definition of a service, as code.
A service definition includes at least its entry-point behaviour (in the main procedure).


## Service runtime [da definire bene; nome da migliorare]

The runtime support that executes a service definition. That is, a service is obtained by executing a service definition with the service runtime.

## Embedding

**FM: ho spostato embedding in fondo per ora, poi vediamo come rientra nel discorso globale quando abbiamo finito con il service runtime/environment/whatever it is.**

A service can _embed_ other services. We call the service embedding the others the _embedder_ service, and the others _embedded_ services.
Embedding produces a hierarchy, where the embedder is the parent service of
its embedded services. This hierarchy handles termination: whenever an embedder service terminates, all its embedded services
are recursively terminated. The hierarchy is also useful for enhancing performances: services in the same
VM can communicate using fast shared memory communication channels.
