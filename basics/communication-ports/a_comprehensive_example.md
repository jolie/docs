# A Comprehensive Example

Let us consider the following scenario for a comprehensive example on communication ports.

`PercentInterface` defines the `percent` request-response operation. Both request and response messages are typed.

```text
//percentInterface.iol

type percent_request: void {
    .part: int
    .total: int
}

type percent_response: void {
    .percent_value: double
}

interface PercentInterface {
    RequestResponse: percent( percent_request )( percent_response )
}
```

The client declares the `outputPort` to communicate with the server and invokes the `percent` operation.

```text
//Client.ol

include "console.iol"
include "percentInterface.iol"

outputPort PercService {
    Location: "socket://localhost:2000"
    Protocol: sodep
    Interfaces: PercentInterface
}

define valid_request {
    request.total = 10;
    request.part = 3
}

define typeMismatch_request {
    request.total = 10.0;
    request.part = 3
}

main
{
    install( TypeMismatch =>
                println@Console( "TypeMismatch: " + main.TypeMismatch )()
        );
    //valid_request;
    typeMismatch_request;
    percent@PercService( request )( response );
    println@Console( "n"+"Percentage value: "+response.percent_value )()
}
```

The server declares the corresponding `inputPort` to exposes the `percent` service and implements its behaviour.

```text
//Server.ol

include "console.iol"
include "percentInterface.iol"

inputPort PercService {
    Location: "socket://localhost:2000"
    Protocol: sodep
    Interfaces: PercentInterface
}

main
{
    install( TypeMismatch =>
                println@Console( "TypeMismatch: " + main.TypeMismatch )()
    );
    percent( request )( response ){
        response.percent_value = double( request.part )/request.total
    }
}
```

The programs can be downloaded from the link below:

[Communication Ports Code Example](https://github.com/jolie/docs/tree/24acbcbc99f476d137eac12e1f9766e2f30e3fff/docs/basics/code/communication_ports_code.zip)

Once extracted, the two programs may be run in two separate shells. Make sure to start `server.ol` before `client.ol`.

Note the presence of two definitions, respectively at Lines 12-15 and Lines 17-18 in client's source code. Both of these procedures set the values of `request.total` and `request.part` in the request message. By switching the comment from Line 27 to 28 and viceversa the invocation of `percent` operation is successful or returns a `TypeMismatch` error.

