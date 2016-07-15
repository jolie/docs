## Local location

An embedded service in Jolie can communicate with its embedder exploiting the `local` medium. `local` communications uses the shared memory between embedded and embedder services in order to handle message delivery in an lightweight and efficient way.

The `local` medium has no parameters and needs no protocol when used into a port definition.

An example using this medium can be found in part "Handling structured messages and embedder's operations invocation" of [Embedding Java Services](architectural_composition/embedding_java.html) subsection.

The `local` medium can be used for service internal self communications, as shown in the example below:

<pre class="code">
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
			response.move += 	"<br>" + 
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
</pre>

The operation `hanoi` receives an external http request (e.g., a GET `http://localhost:8000/hanoi?src=source&aux=auxiliary&dst=destination&n=5`) and fires the local operation `hanoiSolver` which uses the `local` location for recursively call itself and build the solution.