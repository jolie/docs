# Type Mismatching

In Jolie, whenever a message is sent or received through a port, its type is checked against what specified in the port's interface. An invoker sending a message with a wrong type receives a `TypeMismatch` fault.

The `TypeMismatch` fault can be handled by exploiting the [fault handling](https://jolielang.gitbook.io/docs/basics/fault_handling/basics.md), as shown in the following example:

```text
scope ( myScope ) 
{
    install( 
        TypeMismatch => println@Console( myScope.TypeMismatch )()
    );
    // code
}
```

## Type mismatching in one-way operations

A `TypeMismatch` check is performed both when a message is sent and received in one-way operations. In the former case the sender checks if the type of the output message matches with the one declared operation's interface. In case of mismatch, the `TypeMismatch` fault is raised and the message is not sent. In the latter case, the receiver checks the type of the incoming message and, if its type does not match, the message is not received and a `TypeMismatch` warning is printed at console.

In case a `TypeMismatch` is raised by the receiver, no fault is sent back to the invoker as a response. Thus, in case a mismatching-typed message is correctly sent by the invoker, it is discarded by the receiver, keeping its behaviour unaffected, while the invoker is not notified with a fault message.

## Type mismatching in request-response operations

Message type declaration can be used for both request and response messages in a request-response operation. Moreover, it is possible to declare types for the fault messages by means of the following syntax:

```text
op_name ( request_type )( response_type ) throws fault_name ( fault_type )
```

`TypeMismatch` fault in request-response operations leads to four different scenarios, summed in the table below:

|  | Fault raised in REQUEST messages | Fault raised in RESPONSE messages |
| :--- | :--- | :--- |
| **SENDER side** | The message is not sent;a `TypeMismatch` exception is raised. | a `TypeMismatch` exception is raised. |
| **RECEIVER side** | The message is discarded;a warning message is sent to console;a `TypeMismatch` fault message is sent to the sender | a `TypeMismatch` exception is raised.a `TypeMismatch` fault is sent to the sender. |

