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

## Interface as design tool

In Jolie the concept of interface is strongly coupled to the use of communication ports. Yet it can be used as a designing tool in order to define microservices application's domain. 

For instance let's think to start modelling a mathematical service. 
The example below show a possible implementation of the `MathInterface`.

<pre><code class="language-jolie code">
interface MathInterface {
    RequestResponse:
   sum(SumRequest)(SumResponse),
     cosine(cosineRequest)(cosineResponse)
}
</code></pre>

In *Jolie* it is possible to define the same operation in several `interfaces`, as a result we can separate the arithmetic operations from the trigonometric one as shown in our new version of the above example. 

<pre><code class="language-jolie code">
interface ArithmeticInterface {
    RequestResponse: 
        sum(SumRequest)(SumResponse), 
        cosine(cosineRequest)(cosineResponse)
}

interface TrigonometricInterface {
    RequestResponse: 
        cosine(cosineRequest)(cosineResponse)
}
</code></pre>

From a practical point of view a microservice can implement both interfaces and expose them on the identical port, re-thinking the interfaces as domain delimiters.
