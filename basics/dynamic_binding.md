# Dynamic Binding

## Dynamic binding

Jolie allows output ports to be dynamically bound, i.e., their locations and protocols \(called _binding informations_\) can change at runtime. Such a feature is very important because it allows for the creation of dynamic systems where components (microservices) can be bound at runtime.

![](../../.gitbook/assets/dynamicbinding.png)


## Dynamic binding in Jolie
Technically, changes to the binding information of an output port is local to a behaviour instance: output ports are considered part of the local state of each instance. Dynamic binding is obtained by treating output ports as variables. For instance, the following would print the location and protocol name of output port `Printer`:

```text
// Printer.iol
interface PrinterInterface {
    OneWay: printText( string )
}

//dynamic_binding_example.ol

include "console.iol"
include "Printer.iol"

outputPort P {
    Location: "socket://127.0.0.1:80"
    Protocol: sodep
    Interface: PrinterInterface
}

main
{
    println@Console( P.location )();
    println@Console( P.protocol )()
}
```

Binding information may be entered at runtime by making simple assignments:

```text
include "Printer.iol"

outputPort P {
    Interfaces: PrinterInterface
}

main
{
    P.location = "socket://127.0.0.1:80/";
    P.protocol = "sodep"
}
```


## Example: programming a chat
We show a usage example of dynamic binding and binding transmission by implementing a a simple chat service. It is composed by a *Chat Registry* which is in charge to manage all the open chats and participants, and a *User* service which is in charge to manage a single participant connected to a chat. There are no limits to the users that can be connected to a chat. In the following diagram we report an example architecture where three users are connected to the *Chat Registry* service.

![](../../.gitbook/assets/chat_example.png)

The code can be consulted at this [link](https://github.com/jolie/examples/tree/master/02_basics/8_dynamicbinding).

Note that both the *Chat Registry* and each *User* service exhibit an inputPort for receiving messages. The outputPort of the *Chat Registry* which points to the *User* service is not bound to any service, but it needs to be bound dynamically depending on the users connected to a chat.

The *Chat Registry* offers two operations: *addChat* and *sendMessage*. The former operation permits to a user to connect to a chat, whereas the latter is exploited by the user to send messages to all the participants of a chat. The *User* service is composed by two components: _user_service.ol_ and _user.ol_. The former one is in charge to receive messages from the *Chat Registry* whereas the latter just manages the console for enabling human interactions.

Dynamic binding is exploited in the implementation of the *sendMessage* operation in the *Chat Registry* where every time a message is received the outputPort *User* is bound to each registered user for forwarding messages.

```text
[ sendMessage( request )( response ) {
        /* validate token */
        if ( is_defined( global.tokens.( request.token ) ) ) {
            /* sending messages to all participants using dynamic binding */
            chat_name = global.tokens.( request.token ).chat_name;
            foreach( u : global.chat.( chat_name ).users ) {
                /* output port dynamic rebinding */
                User.location = global.chat.( chat_name ).users.( u ).location;
                /* message sending */
                if ( u != global.tokens.( request.token ).username ) {
                  with( msg ) {
                      .message = request.message;
                      .chat_name = chat_name;
                      .username = global.tokens.( request.token ).username
                  };
                  setMessage@User( msg )
                }
            }
        } else {
            throw( TokenNotValid )
        }
    }]
```


## Compatibility of the interfaces
It is worth noting that, in case of dynamic binding, the interfaces defined in the output port must be compatible with those defined into the  receiving input port. The following rules must be respected for stating that there is compatibility between two interfaces:

* all the operations defined in the interfaces at the output ports must be declared also in the interfaces at the input port (it does not matter in which interface an operation is defined, it is important that it is defined).

* all the types of the messages defined for the operations of the output port, must be compatible with the the correspondat type of the same operation at the receiving input port.

* a sending message type is considered compatible with the correspondant receiving one, when all the message it represents can be received without producing a *TypeMismatch* on the receiver part.
