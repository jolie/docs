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

We say that an output port is _connected to_ an input port when messages sent through the former will reach the latter.

**così però andiamo ad introdurre il concetto che una connessione esiste solamente quando c'è anche una rete che permette alle due porte di parlarsi, a noi servirebbe un concetto un pelo più astratto per quando si va a fare il design di un'architettura, ossia io disegno due porte che per me sono connesse ma poi mi aspetto che sotto la rete sia predisposta a realizzare tale connessione. Proposta: ...when messages sent through the former potentially reach the latter.**

**Oppure teniamo così la definizione di connection ma ne introduciamo un'altra più astratta per rappresentare quello che intendo io. Se ci rifacciamo al tema dei circuiti potremmo utilizzare il termine Tracks (o qualcosa di simile)**

This typically happens when the output port has the same location and protocol as the target input port, but
network or container configurations might alter this. As such, knowing the connections in a system requires looking both at 
the involved Jolie programs and how they are deployed in the system.

## Behaviour

A code block in Jolie.

**Non userei il termine block che mi richiama una sottoporzione di programma**

A behaviour defines the logic executed by a service. It can perform computation using the received
data and/or send messages to other services.

## Process

A running instance of a behaviour, equipped with its own private state and message queues.

## Session

A conversation between two or more services.
**e perché allora non la chiamiamo direttamente conversation? Oppure se la teniamo così dobbiamo definire cosa è una conversation**

## Program

A complete, executable Jolie program.

## Jolie Virtual Machine (o la chiamiamo Jolie Runtime in qualche modo?)

The Virtual Machine (VM) executing a Jolie program.
**il termine Virtual Machine secondo me è fuorviante perché al momento il nostro è un interprete non una virtual machine. Alla fin fine un macroservice non è altro che un ambiente che mette a disposizione la possibilità di rendere private le connessioni sopra tramite in-memory communication. Infatti un macroservice non può essere splittato su più macchine senza per questo dover rendere pubbliche le comunicazioni interne. Uo lo chiamerei macroservice proprio per questa sua proprietà di "nascondere" le comunicazioni interne che è un aspetto da programmazione e non solo da deployment**

## Service

The _service_ is the unit of reusable software in Jolie. All components are services.

Services communicate with each other by exchanging messages.
That is the only way that they have for exchanging data with each other.
Service share no memory, although shared memory is sometimes used under the hood by Jolie to
optimise some message exchanges (for example by using shared memory channels among services living in
the same VM).

## Embedding
**questa secondo me è una primitiva che viene spiegata all'interno della doc, non ha senso metterla qui. Perché la vuoi mettere? A mio avviso l'embedding gerarchico è solo uno dei modi che hai per ottenere un macroservizio, potresti anche pensare di tirare su tutti i servizi in modo flat e lasciare che si parlino tramite comunicazione interna**
A service can _embed_ other services. We call the service embedding the others the _embedder_ service, and the others _embedded_ services.
Embedding produces a hierarchy, where the embedder is the parent service of
its embedded services. This hierarchy handles termination: whenever an embedder service terminates, all its embedded services
are recursively terminated. The hierarchy is also useful for enhancing performances: services in the same
VM can communicate using fast shared memory communication channels.



## Microservice 

A service with no embedded services.
**così è una definizione molto limitante nel senso che diventa solamente una specializzazione del termine service**.

