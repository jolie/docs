# Interfaces

Jolie defines two types of operations:

* **one-way** operations, which receive a message;
* **request-response** operations, which reply or receive a message and send back a response.

Thus an interface is a collection of operation types, a list of One-Way and Request-Response operation declarations.

The basic declaration of an interface lists all the names of the its operations, grouped by type:

```jolie
interface identifier {
    OneWay: 
        ow_name1( t1 ), 
        ow_name2( t2 ), 
        //...,
        ow_nameN( tN )
    RequestResponse:
        rr_name1( tk1 )( tk2 ),
        rr_name2( tk3 )( tk4 ),
        //...
        rr_nameN( tkN )( tkN+1 )
}
```

The syntax presented above includes the types of the messages of each operation. One-way operations require only one message type, whilst request-responses define both request \(left argument\) and response \(right argument\) types.

As an example, let us declare the interface `SumInterface`:

```jolie
interface SumInterface {
    RequestResponse:
        sum( SumRequest )( int )
}
```

`SumInterface` defines a request-response operation `sum`. `SumInterface` is the same used in the declaration of `SumInput` and `SumServ`, shown at the end of ports subsection.

The type declarations of both request and response messages are explained further in the data types subsection below.

## Declarations of Faults: the statement `throws`

The operations of type _RequestResponse_ can reply with a fault instead of the response message. In such a case, we need to specify into the interface declaration that a request-response operation can raise a fault. In order to do that it is sufficient to list the faults after the usage of the statement _throws_ as it is shown here in the complete syntax:

```jolie
interface IfaceName {
 RequestResponse:
      Op1( ReqType1 )( ResType1 ) throws ErrX( MsgTypeX ) ... ErrY( MsgTypeY ) 
      //...
      OpN( ReqTypeN )( ResTypeN ) throws ErrW( MsgTypeW ) ... ErrZ( MsgTypeZ )
}
```

where _ErrX_, _ErrY_, _ErrW_, ..., _ErrZ_ are the fault names and _MsgTypeX_, ..., _MsgTypeZ_ are the types of the messages. Examples of its usage can be found in Section [Fault Handling](../fault-handling/).

