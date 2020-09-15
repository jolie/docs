# Internal Services

_Internal services are available from Jolie release 1.6.2._

Internal Services are embedded Jolie services defined directly within the embedder program, rather than in a separate file. They offer a convenient way of reusing code as in procedural programming, without breaking the principle that such code should be easily exported to an external microservice. In particular, an internal service can always be easily moved to a separate file to make it a standalone service, without requiring code changes in the behaviours of the other services that were interacting with it. This is in contrast with the [define](https://jolielang.gitbook.io/docs/basics/define) keyword, which is intended only for short configuration macros or recursive workflows.

Beside the ease of refactoring \(e.g., moving the service from internal to standalone\), internal services offer another main advantage: fast prototyping. The programmer does not have to code a fully-fledged Jolie service in a separate file, embed it, and set the appropriate communication ports. Internal services are no more than syntactic sugar, but this automation saves a lot of boilerplate coding to the developer.

The syntax for internal services is

```jolie
interface ServerInterface {
    OneWay: op1( T1 )
    RequestResponse: op2( T2 )( T3 )
}

service ServerName {
    Interfaces: ServerInterface

    init { ... }

    main {
            [ op1(x) ] { ... }
            [ op2(x)(y) { ... } ]
    }
}
```

The `service` construct specifies:

* a name `ServerName` for the service. The name will act as an output port for the owner of the internal service to call it;
* the `Interfaces` of the service \(it is possible to declare interfaces fetched in included files, just as regular services\).
* an optional `init`ialisation procedure, as for regular services;
* a `main` procedure, as for regular services;

The internal service has access to all the output ports defined in the owner. This is limited to the information statically defined therein, not the dynamic bindings set by the caller processes.

**Attention:** Every internal service has `execution { concurrent }` set by default.

This is convenient, although it contrasts with the usual execution for normal Jolie services, which is set to [single](https://jolielang.gitbook.io/docs/basics/composing_statements#statement-execution-operators)

Semantically, internal services are just syntactic sugar for embedded Jolie service, i.e., what happens at runtime is that the owner of the internal services loads them as embedded services, with the consequent access through the `Runtime` standard service and all the usual features.

## Tree as a Service

Let us see an example of Internal Services in action with a simplified implementation of the `tree` command in Jolie. In Unix and Unix-like systems, `tree` is a recursive directory listing program that produces a depth-indented listing of files.

With internal services its is very quick and easy to draft a prototype implementation of tree. The full code of the example can be checked at this [link](https://github.com/jolie/examples/tree/master/04_architectural_composition/03_internal_services/02_tree_as_a_service).

```jolie
include "console.iol"
include "file.iol"

type TreeType: void{
  .file: string
  .tab?: string
}

interface TreeInterface {
  RequestResponse: tree( TreeType )( string )
}

service TreeInternalService
{
  Interfaces: TreeInterface
  main
  {
    tree( req )( res ){
      exists@File( req.file )( reqExists );
      if ( reqExists ){
        if( !is_defined( req.tab ) ){
          res += req.file
        } else {
          res += req.tab + "├-- " + req.file
        };
        isDirectory@File( req.file )( isDir );
        if ( isDir ){
          getFileSeparator@File()( sep );
          lReq.order.byname = true;
          lReq.directory = req.file;
          list@File( lReq )( lRes );
          for (i=0, i<#lRes.result, i++) {
            bReq.file = req.file + sep + lRes.result[ i ];
            if( is_defined( req.tab ) ) {
              bReq.tab = req.tab + "|   "
            } else {
              bReq.tab = "    "
            };
            tree@TreeInternalService( bReq )( bRes );
            res += "n" + bRes
          }
        }
      } else {
        res = req.file + " does not exist"
      }
    }
  }
}

main
{
  tree@TreeInternalService( { .file = "/path/to/my/directory" } )( res );
  println@Console( res )()
}
```

Note that at line 39, the internal service _TreeInternalService_ is recursively called on operation _tree_.

