# Glossary

## Operation
A functionality exposed by a service.

## Interface
A machine-readable and -checkable declaration of a set of operations, which defines an API.
An interface acts as the contract between a service and its clients.

## Ports
Ports are endpoints used for actually sending and receiving messages.
There are two kind of ports: _input ports_ and _output ports_.
The former are used for receiving messages the latter for sending messages.

## Connection
We say that an output port is _connected to_ an input port when it is meant that messages sent through the former will reach the latter.

This typically happens when the output port has the same location and protocol as the target input port, but
network or container configurations might alter this. As such, knowing the connections in a system requires looking both at 
the involved Jolie programs and how they are deployed in the system.

## Service
A service is a software artifact which supplies API in the form of operations available at its input ports. It communicates with other services by exchanging messages and it can both receive and send them. A service is always willing to serve requests related to its available API.

## Service Dependency
A dependency of a service expressed in terms of a required binding of one outputPort used for calling another service.

## Conversation
A conversation is a series of related message exchanges between two or more services.

## Jolie Service
A definition of service in the Jolie language. A Jolie Service is the unit of programmable software in Jolie.

## Behaviour
It is the part of the Jolie Service which defines the logics to be performed when executing the service's API.

## Process
A running instance of a behaviour, equipped with its own private state and message queues.

## Ground Dependency
A Jolie Service dependency expressed in terms of another Jolie Service to be present at execution time.

## Jolie Service Composition
A Jolie Service Composition is a Jolie Service together with all its ground dependencies.

## Engine
The Engine is the runtime support that executes a Jolie Service or a Jolie Service Composition.
