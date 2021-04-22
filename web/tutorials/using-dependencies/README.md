# Using dependencies
One of the key features of Jolie, is declaring the dependencies of a service by means of statement `outputPort`.  
An outputPort defines a target endpoint connected with a service and it allows to exchange messages with it.
In this tutorial we are going to show how to use dependencies.  We will develop a new service which offers some advanced arithmetic operations, 
that uses the four basic arithmetical operations supplied by the `CalculatorService` described in the tutorial _Getting Started_.
Before illustrating the code, let us depict what we are going to build in the following picture:


![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/using_dependencies_01.png)

The `AdvancedCalculatorService` will be a new service available for a client together with the `CalculatorService`. The `AdvancedCalculatorService` will exploit the operations offered by the `CalculatorService` in order to supply its own operations.

## the interface of the AdvancedCalculatorService
In the following we report the interface of the `AdvancedCalculatorService`:
```jolie
type FactorialRequest: void {
    term: int
}
type FactorialResponse: void {
    factorial: long 
}

type AverageRequest: void {
    term*: int 
}
type AverageResponse: void {
    average: double
}

type PercentageRequest: void {
    term: double
    percentage: double
}
type PercentageResponse: double

interface AdvancedCalculatorInterface {
    RequestResponse:
        factorial( FactorialRequest )( FactorialResponse ),
        average( AverageRequest )( AverageResponse ),
        percentage( PercentageRequest )( PercentageResponse )
}
```
The service offers three operations: `factorial`, `average` and `percentage` whose meaning is quite intuitive. 

## Implementation of the AdavancedCalculatorService
In the following we report the actual definition of the `AdvancedCalculatorService`:

```jolie
from AdvancedCalculatorServiceInterfaceModule import AdvancedCalculatorInterface
from CalculatorInterfaceModule import CalculatorInterface

service AdvancedCalculatorService {

    execution{ concurrent }

    outputPort Calculator {
         location: "socket://localhost:8000"
         protocol: http { format = "json" }
         interfaces: CalculatorInterface
    }

    inputPort AdvancedCalculatorPort {
         location: "socket://localhost:8001"
         protocol: http { format = "json" }
         interfaces: AdvancedCalculatorInterface
    }

    main {
        [ factorial( request )( response ) {
            for( i = request.term, i > 0, i-- ) {
                req_mul.factor[ #req_mul.factor ] = i
            }
            mul@Calculator( req_mul )( response.factorial )            
        }]

        [ average( request )( response ) {
            sum@Calculator( request )( sum_res )
            div@Calculator( { dividend = double( sum_res ), divisor = double( #request.term ) })( response.average )
        }]

        [ percentage( request )( response ) {
            div@Calculator( { dividend = request.term, divisor = 100.0 })( div_res )
            mul@Calculator( { factor[0] = div_res, factor[1] = request.percentage })( response )
        }]
    }
}
```
It is worth noting that in the first lines we import both the interfaces of the `AdvancedCalculatorService` and the `CalculatorService`. We will use the former one for defining the inputPort of the `AdvancedCalculatorService`, whereas we will use the latter one for defining the outputPort towards the `CalculatorService`. Both the declarations can be found before the definition of scope `main`. 

Note that the `location` of an outputPort defines the target location of the service to be invoked; the protocol must correspond to that defined into the corresponding inputPort; and, finally, the interface is used to declare all the available operations that can be used with that dependency. It is not mandatory that the interface defined into an outputPort must be the same of that defined in the corresponding inputPort, but it is important that all the operations in that of the outputPort are defined into the target inputPort too.

### The behaviour
The behaviour contains the code of the three operations where each of them exploits at least one operation of the `CalculatorService`. Operation `factorial` uses `mul@Calculator`, operation `average` uses `sum@Calculator` and `div@Calculator`, finally operation `percentage` uses `div@Calculator` and `mul@Calculator`. 

The primitive we use for invoking a _RequestResponse_ (in this case a RequestResponse of the `CalculatorService`) is called _SolicitResponse_. It is a synchronous primitive which sends a message and waits for its response before continuining. Its syntax is quite simple: it requires the name of the operation to be invoked, followed by `@` and the name of the outputPort operation which defines the dependency (in this case the name of the outputPort is `Calculator`). Let us discuss here, what happens in operation `average`: the first thing is to make the sum of all the received terms. Luckily, the type of the request message of operation `average` is equal to that of operation `sum` at the `CalculatorService`, thus we can just send the same message (`sum@Calculator( request )( sum_res )`). Then, we just divide the summation by the number of received terms. We use the operation `div` for achieving such a result. 

**Tips:** character `#`, when used before a variable path, plays the role of operator _size_ and it returns the number of the elements of the related vector. In the example, we read the statement `#request.term` as _the number of elements of vector term within the node request_.

## Running the example
In order to run the example, we need to launch both `CalculatorService` and `AdvancedCalculatorService`. Thus, we need to open two shells and run the following commands, one for each shell:

1. `jolie CalculatorService.ol`
2. `jolie AdvancedCalculatorService.ol`

In a third shell, try to run the following clients:

- `curl 'http://localhost:8001/factorial?term=5'`
- `curl 'http://localhost:8001/average?term=1&term=2&term=3'`
- `curl 'http://localhost:8001/percentage?term=50&percentage=10'`

## The complete example
The complete example can be found [at this link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/using_dependencies)


