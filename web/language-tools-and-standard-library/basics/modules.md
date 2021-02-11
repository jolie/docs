# Module System and Import Statement

The Jolie module system is a mechanism that allows developers to share and reuse Jolie code from different files. 

A Jolie module can be accessed and used through the `import` statement.

## Definitions

The terminology for the module system differs among programming languages, thus it is useful to have a concrete definition before we delve into one for Jolie. 

The Jolie module system is built upon three different components, namely: _packages_, _modules_, and _symbols_:

- a symbol is a named definition declared in a file. Symbols are either `type` definitions, `interface` definitions, or `service` definitions. As in other languages, the access to Jolie symbols can be restricted with the usual access modifiers prefixing of the symbol definition. Symbols without an access modifier are considered `public` by default, while `private` ones are inaccessible from the importer;

- a module corresponds to a Jolie file and it contains a set of symbols. To make a Jolie module directly executable (e.g., runnable with the command `jolie myFile.ol`), we need to have specified just _one_ `service` which itself contains the block `main { ... }`. This single service (and `main` procedure) is the execution target/entry-point of the Jolie interpreter. Drawing a parallel, programmers define a `main` method in a Java class when that unit is the entry-point of execution: hence, the method is implemented in applications that define a specific execution flow, while libraries frequently omit a `main` method as they are modules imported and used by other projects. When there are more and one service per module, the interpreter prohibits direct the execution of modules and requires the definition of the `--service` parameter (explained below);

- a package is a directory that contains one or more Jolie modules. The `import` mechanism uses the package name &mdash; i.e., the directory name &mdash; to traverse and locate the target module in the file system.

## Import Statement

The syntax of the `import` statement is

```jolie
from moduleSpecifier import importTarget_1 [as alias_1], ..., importTarget_n [as alias_n]
```

The importing module is defined by the moduleSpecifier. Users can use a dot `.` as path separator between packages and modules. Each identifier before the last one defines the packages where the importing module resides, while the last identifier represents the importing module name. Hence, the import fragment `from A.B.C.d` would read "look into folder A, then B, then C, open module (the file) d and import the following symbols (omitted)". When prefixed with a `.` module lookups are resolved from the location of the importing file, rather than the working directory from which the Jolie interpreter have been launched. E.g.,

```jolie
from A import AInterface // import AInterface definition from module A.
from .B import BType as BLocalType // import BType definition as BLocalType from module B in the same package.
```

The second part of the import statement, importTarget, is a list of symbol names defined in the target module, with an optional qualified name to bind to the local execution environment denoted by using 'as' keyword. E.g., 

```jolie
from package.module import symbolA // Absolute import
from .module import symbolB as localB // Relative import
```

Jolie also supports the importing of all the (public) symbols defined in a given module, with the wildcard keyword `*`, e.g., `from myPackage.myModule import *` &mdash; wildcard-imported symbols cannot be aliased, as they are imported in bulk.


## Service Definition

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

### Service execution target

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


## Debugging the import system

The import statement executes in three stages: 

- modules lookup;
- modules parsing;
- symbol binding. 

For each import statement, the Jolie interpreter resolves the import as specified in the module path, performing a lookup to the importing source.

The source code of the imported target is then parsed and the symbol definitions are bound to the local execution environment.

Any errors that occur during the execution of an import statement, such as modules/symbols not found or illegal accesses of symbols terminate the execution of the interpreter.

### Module Lookup strategies

During the module lookup, the Jolie interpreter uses the module path to identify and attempt to locate the imported module, resolving it following either an absolute or a relative (when the path is prefixed by a `.`) location strategy.  

### Absolute paths

For absolute paths, the interpreter performs the lookup within the directory of execution of the Jolie interpreter and the system-level directories where the modules of the Jolie standard library reside.

Let us illustrate the followed procedure to define the priorities of module lookup with a concrete example.

To do that, we first define some labels to represent the relevant parts of the module path used in the lookup:
- let `PATH` represent the whole module path, e.g., `p1.p2.mod`;
- let `HEAD` represent the prefix of the path, e.g,, `p1` in `p1.p2.mod`;
- let `TAIL` represent the suffix of the path, e.g., `p2.mod` in `p1.p2.mod`.

The first thing the absolute-path lookup does is looking for the module within the execution directory of the Jolie interpreter.
Hence, let `WorkingDir` represent the absolute path of the execution directory, we first lookup modules within `WorkingDir` in the following order:

1. we look for the module following the nesting structure of the `PATH` under the `WorkingDir`;
2. if the above attempt fails, we look for a packaged version of Jolie services &mdash; which are files with the extension `.jap` &mdash; contained within the `lib` subdirectory of the `WorkingDir`. Specifically, we look for a `.jap` file named `HEAD.jap` which, if found, is inspected following the nesting structure of the `TAIL`;
3. if the above attempt fails, we apply the procedures 1. and 2. to the system-level directories (e.g., from the `packages` directory of the $JOLIE_HOME folder)

### Relative paths

Relative paths (denoted by the `.` prefix) are resolved starting from the location of the importer.

Besides the first `.`, which signifies the usage of a location-relative resolution strategy, any following `.` indicates the traditional _upward traversal_ of directories.
Let us label `ImporterDir` the directory of the importer module, then:

- a relative path import of the shape `.mod` would look for the module `mod` inside `ImporterDir`;
- a relative path import of the shape `..mod` would look for the module `mod` in the parent directory of `ImporterDir`;
- a relative path import of the shape `...mod` would look for the module `mod` in the parent of the parent directory of `ImporterDir`, and so on.

Reiterating the concept with the example path used in the previous section:

- the relative path `.p1.p2.mod` would be resolved by looking for the module `mod` within the nested directories `ImporterDir`, `p1`, and `p2`;
- a relative path import of the shape `..p1.p2.mod` would be resolved by looking for the module `mod` from the parent of `ImporterDir`, followed with the nested folders `p1` and `p2`.
