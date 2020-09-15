# Processes

In Jolie a _process_ is a running instance of a behaviour whereas a _session_ is a process in charge to serve one or more requests. The two concepts are quite similar, thus the two terms could be used for referring the same entity. The only difference is that a process is a term which refers to an executable entity inside a Jolie engine, whereas a session is an entity which represents an open conversation among two or more services. Briefly, the _process_ can be considered as the executable artifact which animates a session. A session always starts when triggered from an external message, whereas a processalways starts when a session is trigerred or when a Jolie script is run.

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

For instance, let us recall the server program given at the end of [Communication Ports](https://github.com/jolie/docs/tree/0a77ae520bccd6139e4a296e77e7fa6f30f066db/basics/basics/communication-ports/a_comprehensive_example/README.md) section. The execution modality of the _NewsPaper_ is `concurrent` thus it can support multiple requests from both the script _author.ol_ and _user.ol_.

```jolie
include "NewsPaperInterface.iol"

execution{ concurrent }

inputPort NewsPaperPort {
  Location:"auto:ini:/Locations/NewsPaperPort:file:locations.ini"
  Protocol: sodep
  Interfaces: NewsPaperInterface
}

main {
    [ getNews( request )( response ) {
        response.news -> global.news
    }]

    [ sendNews( request ) ] { global.news[ #global.news ] << request }
}
```

## `main{}` and `init{}`

_main_ and _init_ define the behaviour scope and the initializating one respectively. All the operations of the service must be implemented within the scope _main_, whereas the scope _init_ is devoted to execute special procedures for initialising a service before it makes its behaviours available. All the code specified within the `init{}` scope is executed only once, when the service is started. The scope _init_ is not affected by the _execution modality_. On the contrary, the code defined in the scope _main_ is executed following the _execution modality_ of the service.

As an example let us consider the newspaper service reported above enriched with a simple init scope where a message is printed out on the console:

```jolie
include "NewsPaperInterface.iol"
include "console.iol"

execution{ concurrent }

inputPort NewsPaperPort {
  Location:"auto:ini:/Locations/NewsPaperPort:file:locations.ini"
  Protocol: sodep
  Interfaces: NewsPaperInterface
}

init {
     println@Console("The service is running...")()
}

main {
    [ getNews( request )( response ) {
        response.news -> global.news
    }]

    [ sendNews( request ) ] { global.news[ #global.news ] << request }
}
```

When run the service will print out the following message in the console:

```text
The service is running...
```

## Global variables

Jolie also provides _global variables_ to support sharing of data among different processes. These can be accessed using the `global` prefix:

```jolie
global.myGlobalVariable = 3 // Global variable
myLocalVariable = 1 // Local to this behaviour instance
```

In the example reportes at this [link](https://github.com/jolie/examples/tree/master/02_basics/7_global) it is shown the difference between a global variable and a local variable. The server is defined as it follows:

```jolie
include "ServiceInterface.iol"
include "console.iol"

execution{ concurrent }

inputPort Test {
  Location: "socket://localhost:9000"
  Protocol: sodep
  Interfaces: ServiceInterface
}

main {
    test( request)( response ) {
        global.count++;
        count++;
        println@Console("global.count:" + global.count )();
        println@Console("count:" + count )();
        println@Console()()
    }
}
```

In the body of the request-response _test_ the global variable _global.count_ and the local variable _count_ are incremented by one for each received message, then their value are printed out on the console. If we call such service ten times the output is:

```text
global.count:1
count:1

global.count:2
count:1

global.count:3
count:1

global.count:4
count:1

global.count:5
count:1

global.count:6
count:1

global.count:7
count:1

global.count:8
count:1

global.count:9
count:1

global.count:10
count:1
```

It is worth noting that the global variable keeps its value independently from the executiing instance, thus it can be incremented each time a new session is executed. On the other hand the local variable is fresh each time.

## Synchronisation

Concurrent access to global variables can be restricted through `synchronized` blocks, similarly to Java:

```jolie
synchronized( id ){
    //code
}
```

The synchronisation block allows only one process at a time to enter any `synchronized` block sharing the same `id`.

As an example, let us consider the service reported at this [link](https://github.com/jolie/examples/tree/master/02_basics/4_synchronized)

The register service has a concurrent execution and exposes the `register` request-response operation. `register` increments a global variable, which counts the number of registered users, and sends back a response to the client. A _sleep_ call to time service, simulates the server side computation time.

_regInterface.ol_

```jolie
type register: void {
    .message: string
}

interface RegInterface {
    RequestResponse: register( void )( response )
}
```

_server.ol_

```jolie
include "regInterface.iol"
include "time.iol"

inputPort Register {
    Location: "socket://localhost:2000"
    Protocol: sodep
    Interfaces: RegInterface
}

execution { concurrent }

init
{
    global.registered_users=0;
    response.message = "Successful registration.\nYou are the user number "
}

main
{
    register()( response ){
        /* the synchronized section allows to access syncToken scope in mutual exclusion */
        synchronized( syncToken ) {
            response.message = response.message + ++global.registered_users;
            sleep@Time( 2000 )()
        }
    }
}
```

The client executes five parallel calls to the service in order to register five different users.

```jolie
main
{
    {
        register@Register()( response1 );
        println@Console( response1.message )()
    }
    |
    {
        register@Register()( response2 );
        println@Console( response2.message )()
    }
    |
    {
        register@Register()( response3 );
        println@Console( response3.message )()
    }
    |
    {
        register@Register()( response4 );
        println@Console( response4.message )()
    }
    |
    {
        register@Register()( response5 );
        println@Console( response5.message )()
    }
}
```

If executed, it is possible to observe that the parallel calls of the client are sequentialized by the service thanks to the primitive _synchronized_ which implements a mutual access of the scope _syncToken_.

