# Scopes and faults

## Scopes

A `scope` is a behavioural container denoted by a unique name and able to manage faults. Remarkably, in a service behaviour, the `main` is a scope named _main_. We say that a scope terminates successfully if it does not raise any fault signal; a scope obtains this by handling all the faults thrown by its internal behaviour.

### The primitive `throw`

A fault is a signal, identified by its name, raised by a behaviour towards the enclosing scope when an error state is reached, in order to allow its recovery.

Jolie provides the statement `throw` to raise faults.

Scope and throw syntax follows.

```jolie
scope( scope_name )
{

    // omitted code

    throw( FaultName )
}
```

## Fault handlers, the primitive `install`

The `install` statement provides the installation of dynamic fault handlers within a scope. The primitive `install` joins a fault to a process and its handler is executed when the scope catches the fault.

```jolie
scope( scope_name )
{
    install ( 
        Error1 => // fault handling code,
        ...
        ErrorN => // fault handling code
    );

    // omitted code

    throw( fault_name )
}
```

A fault which is not caught within a scope, is automatically re-thrown to the parent scope. In the following example whose runnable code can be found [here](https://github.com/jolie/examples/tree/master/03_fault_handling/01_install), a simple jolie script asks the user to insert a number, if the number does not correspond to the `secret` one, a fault is raised.

```jolie
include "console.iol"

main
{
    registerForInput@Console()();
    install( WrongNumberFault =>
            /* this fault handler will be executed last */
        println@Console( "A wrong number has been inserted!" )()
    );

    /* number to guess */
    secret = 3;

    scope( num_scope )
    {
    install( WrongNumberFault =>
            /* this fault handler will be executed first, then the fault will be re-thrown */
        println@Console( "Wrong!" )();
        /* the fault will be re-thrown here */
        throw( WrongNumberFault )
        );

    print@Console( "Insert a number: " )();
        in( number );
    if ( number == secret ) {
        println@Console("OK!")()
    } else {
                /* here the fault is thrown */
        throw( WrongNumberFault )
    }
    }
}
```

It is worth noting that the fault is firstly cathed by the first handler defined within the scope _num\_scope_ which will execute the following code:

```jolie
println@Console( "Wrong!" )();
throw( WrongNumberFault )
```

It will print the string `"Wrong!"` in the console and then it will re-throw the fault to the parent scope, the scope _main_. At this point the seconf fault handler defined at the level of the main scope will be executed:

```jolie
println@Console( "A wrong number has been inserted!" )()
```

### Install statement priority

An install statement may execute in parallel to other behaviours that may throw a fault. This introduces a problem of nondeterminism: how can the programmer ensure that the correct handlers are installed regardless of the scheduling of the parallel activities? Jolie solves this issue by **giving priority to the install primitive with relation to the fault processing**, making handler installation predictable.

As an example, consider the following code which can be found also [here](https://github.com/jolie/examples/tree/master/03_fault_handling/02_install_priority):

```jolie
scope( s )
{
    throw( f ) | install( f => println@Console( "Fault caught!" )()    )
}
```

where, inside the scope `s`, we have a parallel composition of a `throw` statement for fault `f` and an installation of a handler for the same fault. The priority given to the install primitive guarantees that the handler will be installed before the fault signal for `f` reaches the scope construct and its handler is searched for.

## RequestResponse Pattern and transmission of data into a fault

Uncaught fault signals in a request-response body are automatically sent to the invoker. Hence, invokers are always notified of unhandled faults. We introduced the syntax for declaring a fault into an interface at Section [Interfaces](../interfaces/)

Here we transform the previous example script into a service in order to introduce a request-response operation \(operation _guess_\). You can find the complete code [here](https://github.com/jolie/examples/tree/master/03_fault_handling/03_fault_in_messages)

```jolie
type NumberExceptionType: void{
    .number: int
    .exceptionMessage: string
}

interface GuessInterface {
    RequestResponse: guess( int )( string ) throws NumberException( NumberExceptionType )
}
```

The interface defines the operation `guess` able to throw a `NumberException`, whose message type is `NumberExceptionType`.

```jolie
include "GuessInterface.iol"
include "console.iol"

execution{ concurrent }

inputPort Guess {
    Protocol: sodep
    Location: "socket://localhost:2000"
    Interfaces: GuessInterface
}

init {
    secret = int(args[0]);
  install( FaultMain =>
        println@Console( "A wrong number has been sent!" )()
    );
  install( NumberException =>
    println@Console( "Wrong number sent!" )();
    throw( FaultMain )
  )
}

main
{
    guess( number )( response ){
        if ( number == secret ) {
            println@Console( "Number guessed!" )();
            response = "You won!"
        } else {
            with( exceptionMessage ){
                .number = number;
                .exceptionMessage = "Wrong number, better luck next time!"
            };
                /* here the throw also attach the exceptionMessage variable to the fault */
            throw( NumberException, exceptionMessage )
        }
    }
}
```

The server implements the throw statement in the else branch of operation `guess` behaviour. If the number sent by the client is different than the `secret` one, the request-response operation will send a `NumberException` fault to the client along the fault data.

### Joining data to a fault

The syntax for joining data into a fault is a simple extension of the `throw` syntax given previously.

```jolie
scope ( scope_name )
{
    install ( FaultName => /* fault handling code */ );
    // omitted code
    throw ( FaultName, faultData )
}
```

In the server of the example above, it is obtained by the follwoing piece of code:

```jolie
with( exceptionMessage ){
    .number = number;
    .exceptionMessage = "Wrong number, better luck next time!"
};
throw( NumberException, exceptionMessage )
```

Let us check the client of the example in order to show how it handles the raise of the fault and prints the data sent from it:

```jolie
main
{
    install( NumberException=>
        println@Console( main.NumberException.exceptionMessage )()
    );
    guess@Guess( 12 )( response );
    println@Console( response )()
}
```

It is worth noting that, in order to correctly reference fault data within a fault handler, it is necessary to specify the scope path where the fault is contained. The path is always built in the follwing way:

* _name of the scope.Name of the fault.Node of the message to access_

Thus in the example, since we want to access the node `exceptionMessage`, we use the following path:

```jolie
main.NumberException.exceptionMessage )()
```

## Accessing a fault caught in a scope: the alias `default`

In some cases, we do not want to specify all the handlers of all the faults raised within a scope, but we want to specify a unique handler for all those faults without a handler. In this case it is possible to check if scopes caught faults and also to access the contents of faults thanks to alias `default`.

With syntax `scope_name.default` we access the name of the fault caught by the scope.

Used in combination with [dynamic lookup](https://jolielang.gitbook.io/docs/basics/data_structures#dynamic-look-up), with syntax `scope_name( scope_name.default ).faultMessage`, we can access the message sent with the fault, for instance `msg` in the example below.

```jolie
scope ( s ){
    install( MyFault => 
        println@Console( "Caught MyFault, message: " + s.MyFault.msg )() 
    );
    faultMsg.msg = "This is all MyFault!";
    throw( MyFault, faultMsg )
};
println@Console( "Fault message from scope s: " + s.( s.default ).msg )()
```

