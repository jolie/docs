# Mock Services
Mock services are very useful when programming because they allow to test service calls to those services that are not available in the immediate.

Since in Jolie a service interface is fully defined, it is possible to automatically generate a mock service starting from an input port with the command `joliemock`


## joliemock
`joliemock` generates a mock service wich provides a fake implementation of all the operations exhibited within an inputPort.
Usually, a developer just has only the interface of a target service, in this case it is sufficient to build an empty service with an inputPort where the target interface is declared.
As an example let us consider the following service defined in the file named `example.ol`:

```jolie
type TestRequest: void {
    field1: string 
    field2: int
    field3: void {
        field4*: long
    }
}

type TestResponse: void {
    field5: string
    field6: string 
    field7: double 
    field8*: string 
    field9: void {
        field10: string 
        field11*: string
    }
}
interface TestInterface {
    RequestResponse:
        test( TestRequest )( TestResponse )
}

inputPort PortName {
    Location: "local"
    Protocol: sodep
    Interfaces: TestInterface
}

main {
    nullProcess
}
```

In order to generate the correspondant mock service, the following command must be executed:

```text
joliemock example.ol > mock_main.ol
```
It is worth noting that the code of the mock is generated in the standard output thus it is necessary to redirect it into a file in order to save it. In the example above, the generated content is saved into the file `mock_main.ol`.

The generated mock is:

```jolie
type TestRequest:void {
  .field1[1,1]:string
  .field3[1,1]:void {
    .field4[0,*]:long
  }
  .field2[1,1]:int
}

type TestResponse:void {
  .field7[1,1]:double
  .field6[1,1]:string
  .field9[1,1]:void {
    .field11[0,*]:string
    .field10[1,1]:string
  }
  .field8[0,*]:string
  .field5[1,1]:string
}

interface TestInterface {
RequestResponse:
  test( TestRequest )( TestResponse )
}



include "console.iol"
include "string_utils.iol"
include "converter.iol"

execution{ concurrent }

inputPort PortName {
  Protocol:sodep
  Location:"local"
  Interfaces:TestInterface
}



init {
    STRING_CONST = "mock_string"
    INT_CONST = 42
    DOUBLE_CONST = 42.42
    stringToRaw@Converter("hello")( RAW_CONST )
    ANY_CONST = "mock any"
    BOOL_CONST = true
    LONG_CONST = 42L
    VOID_CONST = Void
    println@Console("Mock service si running...")()
}


        

main {
[ test( request )( response ) {
	valueToPrettyString@StringUtils( request )( s ); println@Console( s )()
	response = VOID_CONST
	response.field7[ 0 ] = 21.0
	response.field6[ 0 ] = "response.field6[ 0 ]"
	response.field9[ 0 ] = VOID_CONST
	response.field9[ 0 ].field11[ 0 ] = "response.field9[ 0 ].field11[ 0 ]"
	response.field9[ 0 ].field11[ 1 ] = "response.field9[ 0 ].field11[ 1 ]"
	response.field9[ 0 ].field11[ 2 ] = "response.field9[ 0 ].field11[ 2 ]"
	response.field9[ 0 ].field11[ 3 ] = "response.field9[ 0 ].field11[ 3 ]"
	response.field9[ 0 ].field11[ 4 ] = "response.field9[ 0 ].field11[ 4 ]"
	response.field9[ 0 ].field10[ 0 ] = "response.field9[ 0 ].field10[ 0 ]"
	response.field8[ 0 ] = "response.field8[ 0 ]"
	response.field8[ 1 ] = "response.field8[ 1 ]"
	response.field8[ 2 ] = "response.field8[ 2 ]"
	response.field8[ 3 ] = "response.field8[ 3 ]"
	response.field8[ 4 ] = "response.field8[ 4 ]"
	response.field5[ 0 ] = "response.field5[ 0 ]"
}]


}
```

The mock service can be immediately executed taking care to define the location of the inputPort which comes as `local`.

### joliemock parameters
The command joliemock accepts three parameters.

```text
joliemock <filename> [-port <portname>] [-depth <vector depth>]
```
where:
- _.port_ specifies the input port to be mocked. If it is not defined joliemock will generate starting from the first one.
- _-depth_ spceifies the number of elements to be generated for each vector. The default is 5
