# Local

An embedded service in Jolie can communicate with its embedder exploiting the `local` medium. `local` communications uses the shared memory between embedded and embedder services in order to handle message delivery in an lightweight and efficient way.

The `local` medium needs no protocol when used into a port definition and it could be followed by an internal local label which univocally identifies the service within the embedded group.

The `local` medium can be defined in mainly two ways: statically or dynamically.

In the first case, the user can define a static location identified by a name, like "local://Calculator", "local://MyService". This is similar to e.g., traditional sockets, where a static address \(e.g., localhost\) is used to identify the location of the service.

In the second case, the user does not define a static location but only the usage of the `local` medium. At runtime, the Jolie interpreter assigns to inputPorts using that medium a unique name. To bind outputPorts, the user can use the operation as it follows, where MyOutputPort is the name of the outputPort to be bound `getLocalLocation@Runtime()( MyOutputPort.location )`.

An example using this medium can be found in part "Handling structured messages and embedder's operations invocation" of [Embedding Java Services](https://github.com/jolie/docs/tree/d208e9c15f6c4743b104c9389f25b4481639db87/locations/architectural-composition/embedding_java/README.md) subsection.

The `local` medium can be used for service internal self communications, as shown in the example below:

```jolie
include "runtime.iol"
include "string_utils.iol"

type HanoiRequest: void{
    .src: string
    .aux: string
    .dst: string
    .n: int
    .sid?: string
}

type HanoiReponse: void {
    .move?: string
}

interface LocalOperations{
    RequestResponse:
        hanoiSolver( HanoiRequest )( HanoiReponse )
}

interface ExternalOperations{
    RequestResponse:
        hanoi( HanoiRequest )( string )
}

outputPort Self{
    Interfaces: LocalOperations
}

inputPort Self {
    Location: "local"
    Interfaces: LocalOperations
}

inputPort PowerService {
    Location: "socket://localhost:8000"
    Protocol: http{
        .format = "html"
    }
    Interfaces: ExternalOperations
}

execution { concurrent }

init
{
    getLocalLocation@Runtime()( Self.location )
}

main
{
    [ hanoi( request )( response ){
        getRandomUUID@StringUtils()(request.sid);
        hanoiSolver@Self( request )( subRes );
        response = subRes.move
    }]{ nullProcess }

    [ hanoiSolver( request )( response ){
        if ( request.n > 0 ){
            subReq.n = request.n;
            subReq.n--;
            with( request ){
                subReq.aux = .dst;
                subReq.dst = .aux;
                subReq.src = .src;
                subReq.sid = .sid
            };
            hanoiSolver@Self( subReq )( response );
            response.move +=     "
" + 
                                ++global.counters.(request.sid) + 
                                ") Move from " + request.src +
                                " to " + request.dst + ";";
            with ( request ){
                subReq.src = .aux;
                subReq.aux = .src;
                subReq.dst = .dst
            };
            hanoiSolver@Self( subReq )( subRes );
            response.move += subRes.move
        }
    }]{ nullProcess }
}
```

The operation `hanoi` receives an external http request \(e.g., a GET `http://localhost:8000/hanoi?src=source&aux=auxiliary&dst=destination&n=5`\) and fires the local operation `hanoiSolver` which uses the `local` location for recursively call itself and build the solution.

