# Documenting API
The documentation of the API of a service is an important phase of the development. Documentation indeed, allows external users to understand how to use the operation exposed by a service. In Jolie it is possible to add comments in the code which can be also used for documenting. Documentation can be automatically generated using the tool 'joliedoc'.

## Special comment token for documenting
In order to insert comments in the code which can be used as documentation for joliedoc, it is necessary to use some special tokens in the code:

* `/**!` ... `*/`: when inserted before a type declaration, an interface declaration or an operation declaration the text included in them will be reported in the final documenation.
* `//<`: when used alongside the definition of a subnode in a type definition, the comment will be reported as a documentation

## joliedoc
Joliedoc is very easy to use, it is sufficient to run the command `joliedoc` followed by the file name of the service to be documented.
Its usage is 
```
joliedoc <filename> [--internals]
```
where `--internals` specifies if including also all the ports (both input and output ports) that are used locally. By default it is set to false.

As a result the command `joliedoc` produces a folder called `joliedoc` which contains a set of html files. Just open the file `index.html` with a common browser for navigating the documentation.

## Example
As an example just try to run the joliedoc on the following simple service:

```
/**! This type represents a message test type */
type TestRRRequest: void {
    .field1: string  //< this is field1
    .field2: double  //< this is field2
    .field3: int {   
        .field4: raw //< this is field4
    }
}

/**! This type represents another message type */
type TestRRResponse: void {
    .field5: string //< this is field 5
}

/**! This type has a link with another type, try to click on the name of the linked type */
type TestOWRequest: TestRRRequest

/**! This is a type with ust a native type */
type FaultType: string 

/**! this is the documentation of the interface */
interface TestInterface {
    RequestResponse:
        /**! this is a simple request response operation which uses types */
        testRR( TestRRRequest )( TestRRResponse ) throws FaultTest( FaultType ),
        /**! this is a simple request response operation which uses native types */
        testRR2( string )( double ) throws FaulTest2( string )
    OneWay:
        /**! this is a simple one way operation which uses types */
        testOW( TestOWRequest ),
        /**! this is a simple one way operation which uses native types */
        testOW2( string )           
}

/**! this is another interface */
interface AnotherInterface {
    RequestResponse:
        /**! this is another test operation */
        anotherTest( string )( string )
}

include "console.iol"

outputPort AnotherService {
    Location: "socket://0.0.0.0:9000"
    Protocol: soap
    Interfaces: AnotherInterface
}


inputPort Service {
    Location: "socket://localhost:8000"
    Protocol: sodep
    Interfaces: TestInterface
}

inputPort ServiceHTTP {
    Location: "socket://localhost:8001"
    Protocol: http
    Interfaces: TestInterface
}

main {
    [ testRR( request )( response ) {
            anotherTest@AnotherService( "hello" )( res )
            println@Console( res )()
            response.field5 = res
    }]

    [ testRR2( request )( response ) {
            println@Console( request )()
    }]

    [ testOW( request ) ]
        { nullProcess }

    [ testOW2( request ) ] 
        { println@Console( request )() }
}
```
Save it into a file called `test.ol` and try to generate the documentation with the default settings:
```
joliedoc test.ol
```
