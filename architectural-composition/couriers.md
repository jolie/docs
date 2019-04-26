# Couriers

## Courier processes

Courier processes allow to enrich a service aggregation with context functionalities. They are joint to an aggregation operator and they are executed in between a message reception and its forwarding to the final target service. In a courier it is possible to program any kind of behaviour and they are usually exploited for managing all those functionalities which are not directly pertinent with the target service but they are usefull for the network context like authentication and logging.

![](../.gitbook/assets/courier.png)

In the diagram above, we represent a courier process as a black square within an inputPort. A courier indeed, does not alter the connection topology of a circuit but it just enhance the capabilitites of an inputPort with a specific set of activities.

## Extended interfaces

In order to execute a code block according to the service invoked, the aggregated operations must be _extended_.

`interface extender` is the keyword used in Jolie for extending operations by overloading their types. The overloaded types contain additional fields exploited within the courier process to perform checks and, before forwarding, they are automatically removed from the message. The `interface extender` syntax follows.

```text
interface extender extender_id {
    OneWay: * | OneWayDefinition
    RequestResponse: * | RequestResponseDefinition
}
```

The `interface extender` associates an identifier \(`extender_id`\) to a collection of operations, where `OneWayDefinition` and `RequestResponseDefinition` are respectively the one-way operations definition and request-response operations definition seen in [Communication Ports](https://jolielang.gitbook.io/docs/fault-handling/basics) subsections.

```text
inputPort AggregatorPort {
    // Location definition
    // Protocol definition
    Aggregates: 
        outputPort_1 with extender_id1,
        //  ...
        outputPort_n with extender_idn
}
```

Then, in the aggregator's deployment, `extender_id` declares to extend the list of operations between curly brackets, followed by the keyword `with`.

Finally, the courier process block is defined in order to forward messages to the operations of the aggregated services:

```text
courier AggregatorPort {
    interface interface_id( request )[( response )]{
        // some code, if necessary
        // and eventually
        forward( request )[( response )]
    }
}
```

## A comprehensive example

For a better understanding of how aggregation and interface extension work, let us consider a scenario where a fax service F is part of a trusted intranet, accepting requests coming from any intranet's user.

```text
// fax.iol
type FaxRequest:void {
    .destination:string
    .content:string
}

interface FaxInterface {
OneWay:
    fax(FaxRequest)
}
```

We can deploy a service that aggregates F in order to keep it unchanged and accept requests from external networks \(e.g., the Internet\). In this way, we allow external users to invoke F's services, but we introduce security concerns too. To keep the intranet trustworthy, we want to authenticate the external users that use F's service, hence we require additional information than the one needed by F's operations.

In this scenario the "simple" message-forwarding capability of the aggregation is not sufficient. The requests coming from external users cannot be directly forwarded to the aggregated services, as they require some sort of elaboration, which is achieved by extending the operations of the aggregated services in the aggregator.

```text
include "fax.iol"
include "console.iol"

execution { concurrent }

type AuthenticationData: void {
    .key:string
}

interface extender AuthInterfaceExtender {
    OneWay:
        *(AuthenticationData)
}

interface AggregatorInterface {
RequestResponse:
    get_key(string)(string)
}

outputPort Fax {
    Location: Location_Fax
    Protocol: sodep
    Interfaces: FaxInterface
}

inputPort AggregatorInput {
    Location: Location_Aggregator
    Protocol: sodep
    Interfaces: AggregatorInterface
    Aggregates: Fax with AuthInterfaceExtender
}

courier AggregatorInput {
    [interface FaxInterface( request )] {
        if ( key == "1111" ){
            forward ( request )
        }
    }
}

main
{
    get_key( username )( key ) {
        if ( username == "username" ) {
            key = "1111"
        } else {
            key = "XXXX"
        }
    }
}
```

In the example above, the aggregator exposes the inputPort `AggregatorInput` that aggregates the `Fax` service whose operations types are extended by the `AuthInterfaceExtender`.

`AuthInterfaceExtender` adds an additional node `key` of type `string` to each type of each operation.

The input port uses the field _Interfaces_ specifying the additional operation `get_key` that the aggregator provides on its own. That operation is invoked by a client requesting the authentication `key`. The `key` is sent back accordingly to the client's `username` and must be included by the client in every `FaxInterface`'s forward operation.

