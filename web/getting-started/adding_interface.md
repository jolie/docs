# Adding Interfaces

In [Creating a Service and a Client](https://github.com/jolie/docs/tree/d296c3f38a034f7c3a1e794fa5b31d175c41c936/getting-started/creating-a-service-and-a-client/README.md) we have seen that it is possible to specify the list of the available operations within a port definition. Such a definition is quite coarse since it does not specify the types of the exchanged messages \(more precisely, by omitting information on types, we implicitly set the type of the operation to the `undefined` type\).

Using **interfaces** it is possible to specify the type of each exchanged message. In the following we define the interface for the service _twice_.

```jolie
interface TwiceInterface {
    RequestResponse: twice( int )( int )
}
```

The primitive `interface` let us define an interface \(in the example _TwiceInterface_\). In the example, the interface contains only an operation called _twice_, which receives an integer and returns an integer.

The interface can now be attached to a port by exploiting the keyword `Interfaces`. Let us save the interface written above \(`TwiceInterface`\) into a file called `twiceInterface.iol` \(usually, `.iol` files indicate Jolie files that provide information to be included in other Jolie programs, like interfaces and ports\). The declarations of the ports in our example now becomes the following:

## Service's code

```jolie
include "twiceInterface.iol"

inputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    Interfaces: TwiceInterface
}

main
{
    twice( number )( result )
    {
        result = number * 2
    }
}
```

## Client's code

```jolie
include "console.iol"
include "twiceInterface.iol"

outputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    Interfaces: TwiceInterface
}

main
{
    twice@TwiceService( 5 )( response );
    println@Console( response )()
}
```

A more detailed explanation about interfaces can be found at the section [Interfaces](https://github.com/jolie/docs/tree/master/language-tools-and-standard-library/basics/interfaces/README.md).

