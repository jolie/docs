# Services

A service is the key element of a jolie program, it is the minimal artifact that can be designed and developed with Jolie. In Jolie everything is a service, a composition of services is a service. An application written in Jolie is always a composition of services. There is no possibility to develop something different.

A service is always described by a **service definition** where the code is specified. Service definitions can be organized in [Modules](../modules/README.md).

The `service` is a component that includes blocks that define its deployment and its behaviour. More precisely, a service node contains a collection of Jolie components, like named procedures and communication ports, and may specify a typed value used to parameterise its execution &mdash; this value can be passed either from the execution command used to launch the Jolie interpreter as well as by an importer that wants to use the service internally (e.g., see embedding below)). The syntax of `service` definition is the following:

```jolie
[public | private] service ServiceName ( parameterName : parameterType) {
    // service related component..
    main {
        // ...
    }
}
```

The following example reports a service which provides a simple operation for multiplying a parameter with a numeric constant `8`.

```jolie
interface MyServiceInterface {
    RequestResponse: multiply ( int )( int )
}

service MyService() {

    execution: concurrent

    inputPort IP {
        location: "socket://localhost:8000"
        protocol: sodep
        interfaces: MyServiceInterface
    }

    main {
        multiply ( number )( result ) {
            result = number * 8
        }
    }
}
```

This service exposes one [inputPort](../ports/README.md) where it offers the operation `multiply`. Note that the interface has been defined outside the scope `service` but it is referenced within it input port `IP`. Interface declarations indeed are independently defined w.r.t. services, and they can only be referenced when used. The statement `execution:concurrent` specifies the [execution modality](../processes-and-sessions/processes/README.md) to be used when running the service.

## Parameterized services

To better understand how `service`s and their parameters interact, let us modify the previous example by giving the possibility to specify the constant used for the multiplication, the location of the service and its protocol. In the following we report the Jolie module that specifies a type (for the parameter), an interface of a service and a `service` using it:

```jolie
type MyServiceParam {
    factor: int
    location: string
}

interface MyServiceInterface {
    RequestResponse: multiply ( int )( int )
}

service MyService( p: MyServiceParam ) {

    execution: concurrent

    inputPort IP {
        location: p.location
        protocol: sodep
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

### Passing parameters from command line

It is possible to pass parameters to a service from command line, just storing the parameter values into a json file and padding it using argument `--params`. Let us considering the following json file, named `params.json`, to be passed to the service defined in the previous section:

```json
{
    "location":"socket://localhost:8000",
    "factor": 2
}
```

The command line for running the service passing the parameters in `params.json` is:

```bash
jolie --params params.json my-service.ol
```

where we suppose that `my-service.ol` is the file where `MyService` has been stored.

## Embedding a service

Services can be embedded within other services in order to run a **cell** (or Multi service). The primitive which allows for embedding a service is primitive `embed`. In the following example service `ConfigurationService` is embedded within service `MainService`:

```jolie
service ConfigurationService {
    inputPort IP {
        location: "local"
        requestResponse: getDBConn( void )(string)
    }

    main {
        getDBConn ( req )( result ) {
            result = "SUPER_SECRET_CONN"
        }
    }
}

service MainService {

    embed ConfigurationService( ) as Conf

    main {
        getDBConn@Conf( )( res )
    }
}
```

More details about embedding can be found at section [Embedding](../../architectural-composition/embedding/README.md)

## Private services

In order to limit the service from being accessed by public, like types and interfaces, Jolie provides the ability to specify scope of access via `public` and `private` keywords. The service is defined as `public` by default when omitted. The access limitation for service helps us write secure and maintainable Jolie code. Below shows the code snippet for a Jolie module that can be execute only through command line interface. These two services, namely `ConfigurationService` and `MainService`, cannot be imported and used externally.

```jolie
private service ConfigurationService {
    inputPort IP {
        location: "local"
        requestResponse: getDBConn( void )(string)
    }

    main {
        getDBConn ( req )( result ) {
            result = "SUPER_SECRET_CONN"
        }
    }
}

private service MainService {

    embed ConfigurationService( ) as Conf

    main {
        getDBConn@Conf( )( res )
    }
}
```

## Service execution target

While having a single service is mandatory to directly run a given Jolie module, we can instruct the Jolie interpreter to target a custom-named service &mdash; and by extension, use the same instruction to select the target of execution of one of the services within a given module.

To select a custom-named Jolie module for execution, we use the interpreter parameter `-s` or the equivalent `--service` followed by the name of the target service, e.g.,    `jolie --service myService`.

Specifically, if the targeted module has only one service definition, the `--service` parameter is discarded and the service is executed.
Contrarily, when a module includes multiple service definitions, the Jolie interpreter requires the definition of the `--service` parameter, reporting an execution error both if the parameter or the correspondent service definition in the module is missing.

In the example below, we show a module where two services are defined. Service `MyService` require parameters to be executed, whereas service `MainService` does not require them, but it embeds service `MyService` by passing parameters in statement `embed`.

```jolie
from console import Console

type MyServiceParam {
    factor: int
    protocol: string
}

interface MyServiceInterface {
    RequestResponse: multiply( int )( int )
}

service MyService ( p: MyServiceParam ) {
    inputPort IP {
        location: "local"
        protocol: p.protocol
        interfaces: MyServiceInterface
    }

    main {
        multiply ( number )( result ) {
            result = number * p.factor
        }
    }
}

service MainService {
    embed Console as Console
    embed MyService( { .protocol = "sodep", .factor = 2 } ) as Service

    main {
        multiply@Service( 3 )( res ) // res = 6
        println@Console( res )()
    }
}
```

In order to run it, the following command line must be used:

```bash
jolie --service MainService script.ol

```
