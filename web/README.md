# Introduction

Welcome to the reference documentation for the [Jolie programming language](https://jolie-lang.org).

## What is Jolie?

Jolie is a _microservice-oriented programming language_: it is designed to reason effectively about the key questions of microservice development, including the following.

* What are the APIs exposed by services?
* How can these APIs be accessed?
* How are APIs implemented in terms of concurrency, communication, and computation?

## How does it look?

This is a simple service for greeting clients.

```jolie
execution { concurrent } // Handle clients concurrently

// Some data types
type GreetRequest { name:string }
type GreetResponse { greeting:string }

// Define the API that we are going to publish
interface GreeterAPI {
RequestResponse: greet( GreetRequest )( GreetResponse )
}

// An input port publishes APIs to clients
inputPort GreeterInput {
location: "socket://localhost:8080"        // Use TCP/IP
protocol: http { format = "json" }        // Use HTTP
interfaces: GreeterAPI                    // Publish GreeterAPI
}

// Implementation (the behaviour)
main
{
    /*
    This statement receives a request for greet,
    runs the code in { ... }, and sends response
    back to the client.
    */
    greet( request )( response ) {
        response.greeting = "Hello, " + request.name
    }
}
```

If you have installed Jolie \([get it here](https://www.jolie-lang.org/downloads.html)\), you can save the code above in a file called `greeter.ol` and then launch it from the terminal with the command:

```jolie
jolie greeter.ol
```

The service is now waiting for client requests. Run

```text
curl http://localhost:8080/greet?name=Jolie
```

and you will see the output

```javascript
{"greeting":"Hello, Jolie"}
```

## Microservice-orientation

More in general, Jolie brings a structured linguistic approach to the programming of services, including constructs for access endpoints \([communication ports](https://github.com/jolie/docs/tree/71815c98562e34135ed81b0c11eb00ff70523567/introduction/basics/communication-ports/README.md)\), APIs with synchronous and asynchronous operations \([interfaces](https://github.com/jolie/docs/tree/71815c98562e34135ed81b0c11eb00ff70523567/introduction/basics/interfaces/README.md)\), [communications](https://github.com/jolie/docs/tree/71815c98562e34135ed81b0c11eb00ff70523567/introduction/basics/communication-ports/using_communication_ports.md), behavioural workflows \(including a native [parallel operator](https://github.com/jolie/docs/tree/71815c98562e34135ed81b0c11eb00ff70523567/introduction/basics/composing_statements.md)\), and multiparty sessions \([correlation sets](https://github.com/jolie/docs/tree/71815c98562e34135ed81b0c11eb00ff70523567/introduction/basics/sessions.md)\). Additionally, Jolie embraces that microservice systems are often heterogeneous and interoperability should be a first-class citizen: all data in Jolie is structured as trees that can be semi-automatically \(most of the time fully automatically\) converted from/to different data formats \(JSON, XML, etc.\) and communicated over a variety of protocols \(HTTP, binary protocols, etc.\). Jolie is an attempt at making the _first language for microservices_, in the sense that it provides primitives to deal directly with the programming of common concerns regarding microservices without relying on frameworks or external libraries. Our aim is to provide a tool that aid developers in producing and managing microservice systems more effectively.

## Where do I go from here?

Check out the menu on the left.

If you want to get started, go to section Getting Started.

Section Tutorials covers practical tutorials on particular scenarios, collected by our contributors.

Section Language, Tools, and Standard Library explains how to use the language \(both basic and advanced constructs\) and its accompanying tools and libraries.

## Get in touch

If you have comments or requests on this documentation or Jolie in general, you can see how to reach us at this link: [https://www.jolie-lang.org/community.html](https://www.jolie-lang.org/community.html). We look forward to hearing from you.

Enjoy Jolie!

_The Jolie Team_

![](../.gitbook/assets/jolielogo.png)
