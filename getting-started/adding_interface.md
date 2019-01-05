#Adding Interfaces
In the previous lesson we shown that it is possible to specify the list of the available operations within a port definition. Such a definition is quite coarse because it does not allow to specify the types of the exchanged messages.

Using **interfaces** it is possible to specify the message types of each exchanged message. In the following we define the interface for the service _twice_.

```jolie
interface TwiceInterface {
	RequestResponse: twice( int )( int )
}
```

The primitive *interface* allows for the definition of an interface (in the example _TwiceInterface_).
In the example the interface contains only an operation called _twice_ which receives an integer and return an integer.

The interface can now be attached to a port by exploiting the keyword *Interfaces*.
The declarations of the ports on our example now becomes like it follows:

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

where *twiceInterface.iol* is the name of the file where there is the definition of the interface.
A more detailed explanation about interfaces can be found at the section [Interfaces](../basics/communication-ports/interfaces.md).
