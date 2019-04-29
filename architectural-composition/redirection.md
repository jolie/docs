# Redirection

Redirection allows for the creation of a service, called _proxy_, acting as a single communication endpoint for multiple services, called _resources_. Similarly to an [aggregator](aggregation.md), a proxy receives all the messages meant for the system that it handles, but it transparently exposes the resource names of the redirected services. Redirection is syntactically obtained by binding an input port of the proxy service to multiple output ports, each one identifying a service by means of a _resource name_.

![](../.gitbook/assets/redirection.png)

The main advantages of redirection are:

* the possibility to provide a unique access point to the system clients. In this way the services of the system could be relocated and/or replaced transparently to the clients;
* the possibility to provide transparent communication protocol transformations between the invoker and the master and the master and the rest of the system;

## The syntax
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

## Example
In the following example we show a simple redirection scenario where a proxy provides a common endpoint for two services, _Sum_ and _Sub_, which performrs addiction and substraction respecitvely. At this [link](https://github.com/jolie/examples/tree/master/04_architectural_composition/07_redirection/01_static_redirection) it is possible to check the complete code.

![](../.gitbook/assets/redirection_example.png)

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

