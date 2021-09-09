# Service Definition
A service is the key element of a jolie program, it is the minimal artifact that can be designed and developed with Jolie. In Jolie everything is a service, a composition of services is a service. An application written in Jolie is always a composition of services. There is no possibility to develop something different. 

The `service` is a component that includes blocks that define its deployment and its behaviour. 

More precisely, a service node contains a collection of Jolie components, like named procedures and communication ports, and may specify a typed value used to parametrise its execution &mdash; this value can be passed either from the execution command used to launch the Jolie interpreter as well as by an importer that wants to use the service internally (e.g., see [embedding](../architectural-composition/embedding.md)). The syntax of `service` definition is the following:

```jolie
[public | private] service ServiceName ( parameterName : parameterType) {
	// service related component..
	main {
		// ...
	}
}
```

To better understand how `service`s and their parameters interact, let us look at a concrete example of a Jolie module that specifies a type (for the parameter), an interface of a service and a `service` using it:

```jolie
type MyServiceParam {
	factor: int
	location: string
	protocol: string
}

interface MyServiceInterface {
	RequestResponse: multiply ( int )( int )
}

service MyService( MyServiceParam: p ) {
	
	execution {concurrent}
	
	inputPort IP {
		location: p.location
		protocol: p.protocol
		interfaces: MyServiceInterface
	}

	main {
		multiply ( number )( result ) {
			result = number * p.factor
		}
	}
}
```

The service `MyService` requires a value of type `MyServiceParam` for its execution. Specifically, the values in the parameter include the location and protocol of the `inputPort` and the multiplicative factor used in the `multiply` operation.

Remember to indicate the execution mode, otherwise it would be single (single execution) giving rise to an exception in a calling sequence.

## Service execution target

While having a single service is mandatory to directly run a given Jolie module, we can instruct the Jolie interpreter to target a custom-named service &mdash; and by extension, use the same instruction to select the target of execution of one of the services within a given module.

To select a custom-named Jolie module for execution, we use the interpreter parameter `-s` or the equivalent `--service` followed by the name of the target service, e.g.,  `jolie --service myService`.

Specifically, if the targeted module has only one service definition, the `--service` parameter is discarded and the service is executed.
Contrarily, when a module includes multiple service definitions, the Jolie interpreter requires the definition of the `--service` parameter, reporting an execution error both if the parameter or the correspondent service definition in the module is missing.

Note: the current version of Jolie does not support passing service argument to execution service from the command-line, thus single-service modules (or `--service`-targeted services) cannot require a parameter. 

```jolie
type MyServiceParam {
	factor: int
	protocol: string
}

interface MyServiceInterface {
	RequestResponse: multiply( int )( int )
}

service MyService ( MyServiceParam: p ) {
	inputPort IP {
		location: "local"
		protocol: p.protocol
		interface: MyServiceInterface
	}
	
	main {
		multiply ( number )( result ) {
			result = number * p.factor
		}
	}
}

service MainService {

	embed MyService( { .protocol = "sodep", .factor = 2 } ) as Service

	main {
		multi@Service( 3 )( res ) // res = 6
	}
}
```

## Embedding a service

As seen in the closing example of the previous section, the `MainService` service internally launched the execution of another service (`MyService`) by `embed`ding it. 
In this section we explain in more details how the `embed` statement works, starting from its syntax:

```
embed serviceName( passingValue ) [in existedPortName | as newPortName]
```

Above, we see that the `embed` statement takes as input a service name and an optional value.
Then, we can optionally bind an inputPort of the embedded service (which must be set as local) to an outputPort of the embedder.
To achieve that, we have two modalities:

- using the `in` keyword we bind the inputPort of the target to an _existing_ outputPort defined by the embedder;
- using the `as` keyword we create a new outputPort that has the same interface of the inputPort of the embedded service, besides being bound to it.

When that trailing part is missing, the embedded service runs without any automatic binding &mdash; however that does not mean it is not callable in other ways, e.g., through a fixed TCP/IP address like `"socket://localhost:8080"` or though a local location like `"local://A"`).

### Embedding the standard library

The Jolie standard library comes as a collection of services that users can `import` and use through the embedding mechanism. 

The following example shows the usage of the `Console` service, which exposes operations for communication between Jolie and the standard input/output:

```jolie
from console import Console

service MyService{
	
	embed Console as C
	
	main {
		print@C( "Hello world!" )()
	}
}
```

The section of the documentation dedicated to the [standard library](../standard-library-api/) reports more information on the modules, types, and interfaces available to programmers with the standard Jolie installation.
