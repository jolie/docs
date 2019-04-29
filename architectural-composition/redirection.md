# Redirection

Redirection allows for the creation of a service, called _proxy_, acting as a single communication endpoint for multiple services, called _resources_. Similarly to an aggregator which exploits [aggregation](aggregation.md), a proxy receives all the messages meant for the system that it handles, but it transparently exposes the resource names of the redirected services. Redirection is syntactically obtained by binding an input port of the proxy service to multiple output ports, each one identifying a service by means of a _resource name_.



Invokers send messages to the master service specifying also the intended resource name.

The main advantages of such an approach are:

* the possibility to provide a unique access point to the system clients. In this way the services of the system could be relocated and/or replaced transparently to the clients;
* the possibility to provide transparent communication protocol transformations between the invoker and the master and the master and the rest of the system;

![](../.gitbook/assets/redirection_1.jpg)

**Fig.1** Service `M` redirect messages to services `A` , `B` , and `C` depending on the target destination of the message \(`M/A` , `M/B` , or `M/C` \)

For a better understanding of the second advantage, consider Fig.1. Let us suppose that resource A uses a protocol p\_A and a client C, using a different protocol p\_C, needs to interact with A. By invoking the master service M, C can simply interact with A through M \(M/A\) using p\_C, leaving to M the task to translate the message in protocol p\_A, before forwarding it to A.

The syntax of redirection is:

```text

inputPort id {
    Location: URI
    Protocol: p
    Redirects:
        sid_1 => OP_id_1,
        //...
        sid_i => OP_id_i,
        //...
        sid_N => OP_id_N
}
```

where `sid_i => OP_id_i` associates a resource name `sid_i` to an output port identifier `OP_id_i`.

The example in Fig.1 is implemented by the code below:

```text
outputPort ServiceA {
    Location: "socket://www.a_location.com/"
    Protocol: soap
    Interfaces: A_interface
}

outputPort ServiceB {
    Location: "socket://www.b_location.com/"
    Protocol: sodep
    Interfaces: B_interface
}

outputPort ServiceC {
    Location: "socket://www.b_location.com/"
    Protocol: http
    Interfaces: C_interface
}

inputPort MasterInput {
    Location: "socket://masterservice.com:8000/"
    Protocol: sodep
    Redirects:
        A => ServiceA,
        B => ServiceB,
        C => ServiceC
}
```

Once set, calling a master service for one of its resources is done by declaring the resource name in the location used by the invoker, followed by the resource name separator `!/`, as shown at Line 2

```text
outputPort A{
    Location: "socket://masterservice.com/8000/!/A"
    Protocol: sodep
    Interfaces: A_interface
}
```

## Dynamic Redirection

Redirection can be changed dynamically by simply modifying the outputPort location via dynamic port binding.

```text
include "console.iol"
include "ui/ui.iol"
include "ui/Swing_ui.iol"

outputPort SubService {
Location: "socket://localhost:2000/"
Protocol: soap
}

outputPort SumService {
Location: "socket://localhost:2001/"
Protocol: soap
}

inputPort MyService {
Location: "socket://localhost:2002/"
Protocol: sodep
Redirects:     
    Sub => SubService,
    Sum => SumService    
}

main
{    
    keepRunning = true;
    while ( keepRunning ) {
        showInputDialog@SwingUI( "available commands: " +
            "relocateSum, relocateSub, exit." )( command );
        if ( command == "relocateSum" ) {
            showInputDialog@SwingUI( "The current service location is: " +
                SumService.location + 
                "nInsert the new 'SumService' location" )( location );
            SumService.location = location;
            println@Console( "New location set for SumService: " + 
                SumService.location )()
        };
        if ( command == "relocateSub" ) {
            showInputDialog@SwingUI( "The current service location is: " +
                SubService.location + 
                "nInsert the new 'SubService' location" )( location );
            SubService.location = location;
            println@Console( "New location set for SubService: " +
                SubService.location )()
        };
        if ( command == "exit" ) {
            keepRunning = false
        }
    }
}
```

