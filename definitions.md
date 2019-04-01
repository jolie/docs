# Definitions

This section is devoted to present some basic definitions we give to some fundamental terms like _service_, 
_microservices_ and _macroservices_. Please, do not consider these definitions as absolute definitions, but take them as
the results we obtained by approaching service science and microservices from a linguistic point of view.

## What is a service and what is a microservice?
n the context of the programming language Jolie:

_A service is the single unit of programmable software_

Such a statement means that in Jolie, it is not possible to develop something different from a service. 
There are no classes, nor functions, nor procedures, just services. 

## Service = Server + Business Logic 
Out of the context of Jolie, a service is always obtained as a mix of libraries and code
which are targeted to basically obtain a server joint with some business logic 
which represent the functionalities to serve. Thus, we can say that the following equation could be considered valid:

SERVER + BUSINESS LOGIC = SERVICE

In the linguistic paradigm proposed with Jolie, such an equation is not more valid just because servers simply do not exist. 
Only services exist. It is not possible to program a server because you can program only services. 

## What is a service?
So, if there are no servers but only services, what is a service? As it happens for object orientation 
where classes are logical definitions and objects are the instances of classes in a running environment, 
here we call the logical definition of a service with the term _service_ and its running instance with the term 
_microservice_.

CLASS --> OBJECT : SERVICE --> MICROSERVICE

For each service there could be more than one microservices, 
but each microservice is just the running instance of a service. 

## Services exchange messages 
The only structured way for exchanging data among services are messages. There are no other way. 
A message is just a limited portion of data transmitted in a limited portion of time.
A service can both receive messages and send messages. In a Service Oriented Architecture a service which receives 
and sends messages is usually called **service orchestrator** (e.g. WS-BPEL orchestrator). Such a difference in the 
linguistic paradigm does not exist, an orchestrator is just a servicelike all the other services. 
In particular, in Jolie message exchange is enabled by means of _ports_. 
Messages are received by means of _inputPorts_ and they are sent by means of _outputPorts_. 

## Services can have a behaviour 
The behaviour defines the business logic to be executed when a message is received.  
In the behaviour it is possible to compute the received data and/or send messages to other services. 
In Jolie the behaviour is expressed in scope _main_. A behaviour can define different operations. 
Different business logics can be joint to different operations. 
In particular, in Jolie multiple operations can be expressed in the same behaviour by using the non deterministic operator:

```jolie
main { 
[ op1( req1 )( res1 ) {
    businessLogic1
}]  

[ op2( req2 )( res2 ) {
    businessLogic2
}]  

...

[ opn( reqn )( resn ) {
    businessLogicn
}]  
} 
```

## Interfaces
Services declare interfaces. The operations of the behaviour must be declared in a machine readable interface. 
The interface defines all the available operations of a given service.
Interfaces are used as a concrete contract for interacting with a service. 
In Jolie interfaces are also equipped with message type declarations.

```jolie
type MyRequestType: void {
    .msg: string 
}

type MyResponseType: void {
    .resp_msg: string 
}

interface myInterface {
RequestResponse:
     myOperation( MyRequestType )( MyResponseType ) 
}
```

# Sessions
Services execute sessions for serving requests. A session is a running instance of a service operation. 
Sessions are independently executed and their data are independently scoped. 
If we suppose to send three messages to a microservice which implements the following service 
we will receive three different messages for each request message.

main {
   test( request )( response ) {
      response = request
   }
}

if we concurrently send three request messages with content "1", "2", "3", we will receive three 
related reply messages with the same content.


## A definition of service and microservice
Here we summarize a definition of service starting from the basic concepts highlighted above. 

_A service is a unit of programmable software able to exchange messages with other services whose behaviour 
is triggered by incoming messages and it is defined by a set of computation logics called operations 
which are declared within a machine readable interface. A running instance of a service is called microservice
whose inner instances of triggered operations are called sessions. 
Sessions are executed independently and their variables are independently scoped_



