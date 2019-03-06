# Interfaces

Jolie defines two types of operations:

* **one-way** operations, which receive a message;
* **request-response** operations, which reply or receive a message and send back a response.

Thus an interface is a collection of operation types, a list of One-Way and Request-Response operation declarations.

The basic declaration of an interface lists all the names of the its operations, grouped by type:

```text

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

```text
interface SumInterface {
    RequestResponse:
        sum( SumRequest )( int )
}
```

`SumInterface` defines a request-response operation `sum`. `SumInterface` is the same used in the declaration of `SumInput` and `SumServ`, shown at the end of ports subsection.

The type declarations of both request and response messages are explained further in the data types subsection below.

