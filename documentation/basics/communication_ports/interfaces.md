## Interfaces

Jolie defines two types of operations:

- one-way operations, which receive a message;
- request-response operations, which reply or receive a message and send back a response.

Thus an interface is a collection of operation types, a list of `One-Way`'s and `Request-Response`'s operation declarations.

The basic declaration of an interface lists all the names of its operations, grouped by type:

<pre class="syntax">
interface identifier {
    OneWay: 
        ow_name1( t1 ), 
        ow_name2( t2 ), 
        ...
        ow_nameN( tN )
    RequestResponse:
        rr_name1( tk1 )( tk2 ),
        rr_name2( tk3 )( tk4 ),
        ...
        rr_nameN( tkN )( tkN+1 )
}
</pre>

The syntax presented above includes the types of the messages of each operation. `OneWay` operations require only one message type, whilst `RequestResponse` operations define both *request* (left argument) and *response* (right argument) types.

Let us declare the interface `SumInterface`:

<pre><code class="language-jolie code">
interface SumInterface {
    RequestResponse:
        sum( SumRequest )( int )
}
</code></pre>

`SumInterface` defines a `RequestResponse` operation `sum`. `SumInterface` is the same used in the declaration of `SumInput` and `SumServ`, shown at the end of [ports](ports.md).

The type declarations of both `request` and `response` messages are explained further in the [data types](data_types.md) section.
