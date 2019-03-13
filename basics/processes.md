# Processes and Sessions
In Jolie a *process* is a running instance of a behaviour whereas a *session* is a process in charge to serve one or more requests. The two concepts are quite similar, thus the two terms could be used for referring the same entity. The only difference is that a process is a term which refers to an executable entity inside a Jolie engine, whereas a session is an entity which represents an open conversation among two or more services. Briefly, the *process* can be considered as the executable artifact which animates a session. A session always starts when triggered from an external message, whereas a processalways starts when a session is trigerred or when a Jolie script is run.

## Execution modality
The execution modality permits to specify the way a process must be executed whithin the engine. An process can be executed in three modalities:

* single
* sequential
* concurrent

The syntax of the _execution modality_ is:

```text
execution { single | concurrent | sequential }
```

`single` is the default execution modality \(so the `execution` construct can be omitted\), which runs the program behaviour once. `sequential`, instead, causes the program behaviour to be made available again after the current instance has terminated. This is useful, for instance, for modelling services that need to guarantee exclusive access to a resource. Finally, `concurrent` causes a program behaviour to be instantiated and executed _whenever its first input statement can receive a message_.

In the \`sequential\` and \`concurrent\` cases, the behavioural definition inside the main procedure must be an input statement, thus the executed process always animates a session. Single modality is usually exploited for running scripts because they require to be triggered by command instead of a message reception.

A crucial aspect of processes is that each of them has its own private state, determining variable scoping. This lifts programmers from worrying about race conditions in most cases.

For instance, let us recall the server program given at the end of [Communication Ports](https://jolielang.gitbook.io/docs/basics/communication-ports) section. We can simply add the deployment instruction `execution{ concurrent }` to the server's deployment to make it supporting multiple clients at the same time. Access to variables would be safe since each behaviour instance would have its private state.

```text
//Server.ol

include "console.iol"
include "percentInterface.iol"

inputPort PercService {
    Location: "socket://localhost:2000"
    Protocol: sodep
    Interfaces: PercentInterface
}

execution{ concurrent }

init {
    install( TypeMismatch =>
        println@Console( "TypeMismatch: " + main.TypeMismatch )()
    )
}

main
{
    percent( request )( response ){
        response.percent_value = double( request.part )/request.total
    }
}
```

## `init{}`

Jolie also supports special procedures for initialising a service before it makes its behaviours available. The `init{}` scope allows the specification of such procedures. All the code specified within the `init{}` scope is executed only once, when the service is started.

## Global variables

Jolie also provides _global variables_ to support sharing of data among different behaviour instances. These can be accessed using the `global` prefix:

```text
global.myGlobalVariable = 3 // Global variable
myLocalVariable = 1 // Local to this behaviour instance
```

## Synchronisation

Concurrent access to global variables can be restricted through `synchronized` blocks, similarly to Java:

```text
synchronized( id ){
    //code
}
```

The synchronisation block allows only one process at a time to enter any `synchronized` block sharing the same `id`.

## A comprehensive example

Let us consider a comprehensive example using the concepts explained in this section.

The register service has a concurrent execution and exposes the `register` request-response operation. `register` increments a global variable, which counts the number of registered users, and sends back a response to the client.

_regInterface.ol_

```text
type register: void {
    .message: string
}

interface RegInterface {
    RequestResponse: register( void )( response )
}
```

_server.ol_

```text
include "regInterface.iol"

inputPort Register {
    Location: "socket://localhost:2000"
    Protocol: sodep
    Interfaces: RegInterface
}

execution { concurrent }

init 
{    
    global.registered_users=0;
    response.message = "Successful registration.nYou are the user number "
}

main 
{
    register()( response ){
        synchronized( syncToken ) {
            response.message = response.message + ++global.registered_users
        }
    }
}
```

_client.ol_

```text
include "regInterface.iol"
include "console.iol"

outputPort Register {
    Location: "socket://localhost:2000"
    Protocol: sodep
    Interfaces: RegService
}

main 
{
    register@Register()( response );
    println@Console( response.message )()
}
```

The programs can be downloaded from the link below:

[Processes Code Example](https://github.com/jolie/docs/blob/master/files/basics/code/processes_code.zip)

Once extracted, the two programs may be run in two separate shells. Make sure to start `register.ol` before `client.ol`. Try to start more than one `client.ol` at once and see the results.

