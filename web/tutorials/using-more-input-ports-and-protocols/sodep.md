# Adding an input port with protocol SODEP
Protocol [sodep](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/protocols/sodep.html) is a binary protocol released together with Jolie engine. It is an efficient protocol we suggest to use everytime you need to integrate a jolie service with another jolie service.

In the following picture we show how to add an inputPort which provides a sodep protocol in addition to those with `http/json` and `http/soap` already discussed.

![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/more_inputports_and_protocols_sodep.png)

As it happened for the addition of soap protocol input port, also in the case of a sodep protocol input port the behaviour of the service is always the same, and you don't need to modify it.

## Adding the port
The first step is adding the inputPort to the code. In our example is:
```jolie
inputPort AdvancedCalculatorPortSOAP {
        location: "socket://localhost:8003"
        protocol: sodep 
        interfaces: AdvancedCalculatorInterface
}

```

No other actions are required.

## The complete example

The complete example follows and it may be consulted at this [link]
(https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/more_inputports_and_protocols/sodep)

```jolie
from AdvancedCalculatorServiceInterfaceModule import AdvancedCalculatorInterface
from CalculatorInterfaceModule import CalculatorInterface

interface ChuckNorrisIface {
    RequestResponse: random( undefined )( undefined )
}

service AdvancedCalculatorService {

    execution{ concurrent }

    outputPort Chuck {
        location: "socket://api.chucknorris.io:443/"
        protocol: https {
            .osc.random.method = "get";
            .osc.random.alias = "jokes/random"
        }
        interfaces: ChuckNorrisIface
    }

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

    inputPort AdvancedCalculatorPortSOAP {
         location: "socket://localhost:8002"
         protocol: soap {
             wsdl = "AdvancedCalculator.wsdl",
             wsdl.port = "AdvancedCalculatorPortSOAPServicePort"
         }
         interfaces: AdvancedCalculatorInterface
    }

    inputPort AdvancedCalculatorPortSODEP {
        location: "socket://localhost:8003"
        protocol: sodep 
        interfaces: AdvancedCalculatorInterface
    }

    main {
        [ factorial( request )( response ) {
            for( i = request.term, i > 0, i-- ) {
                req_mul.factor[ #req_mul.factor ] = i
            }
            mul@Calculator( req_mul )( response.factorial )  
            random@Chuck()( chuck_res )
            response.advertisement = chuck_res.value          
        }]

        [ average( request )( response ) {
            {
                sum@Calculator( request )( sum_res )
                div@Calculator( { dividend = double( sum_res ), divisor = double( #request.term ) })( response.average )
            }
            |
            {
                random@Chuck()( chuck_res )
                response.advertisement = chuck_res.value
            }
        }]

        [ percentage( request )( response ) {
            {
                div@Calculator( { dividend = request.term, divisor = 100.0 })( div_res )
                mul@Calculator( { factor[0] = div_res, factor[1] = request.percentage })( response_mul )
                response.result = response_mul
            }
            |
            {
                random@Chuck()( chuck_res )
                response.advertisement = chuck_res.value
            }
        }]
    }
}
```

## Running the service and invoking it
Since we are extending the example [Using more than one dependency](https://docs.jolie-lang.org/v1.10.x/tutorials/using-more-than-one-dependency/), here we need to run two services in two separate shells:
```jolie
jolie AdvancedCalculatorService.ol
jolie CalcularService.ol
```

In this case the client is another jolie script that must be run in a separate shell:

```jolie
from AdvancedCalculatorServiceInterfaceModule import AdvancedCalculatorInterface
from console import *
from string_utils import StringUtils

service SodepClient {
    outputPort AdvancedCalculatorService {
        location: "socket://localhost:8003"
        protocol: sodep
        interfaces: AdvancedCalculatorInterface
    }

    inputPort ConsoleInputPort {
        location: "local"
        interfaces: ConsoleInputInterface
    }

    embed Console as Console
    embed StringUtils as StringUtils

    init {
        registerForInput@Console()()
    }

    main {
        println@Console("Select the operation to call:")()
        println@Console("1- factorial")()
        println@Console("2- percentage")()
        println@Console("3- average")()
        print@Console("? ")()

        in( answer )
        if ( (answer != "1") && (answer != "2") && (answer != "3") ) {
            println@Console("Please, select 1, 2 or 3")()
            throw( Error )
        }

        if ( answer == "1" ) {
            println@Console( "Enter an integer")()
            in( term )
            factorial@AdvancedCalculatorService( { term = int( term ) } )( factorial_response )
            println@Console( "Result: " + factorial_response.factorial )()
            println@Console( factorial_response.advertisement )()
        }
        if ( answer == "2" ) {
            println@Console( "Enter a double")()
            in ( term )
            println@Console( "Enter a percentage to be calculated")()
            in ( percentage )
            percentage@AdvancedCalculatorService( { term = double( term ), percentage = double( percentage ) } )( percentage_response )
            println@Console( "Result: " + percentage_response.result )()
            println@Console( percentage_response.advertisement )()
        }
        if ( answer == "3" ) {
            println@Console("Enter a list of integers separated by commas")()
            in( terms )
            split@StringUtils( terms { regex = ","} )( splitted_terms )
            for( t in splitted_terms.result ) {
                req_average.term[ #req_average.term ] = int( t )
            }
            average@AdvancedCalculatorService( req_average )( average_response )
            println@Console( "Result: " + average_response.average )()
            println@Console( average_response.advertisement )()
        }
    }
 }
```

Note that in this client the corresponding sodep outputPort is defined. In the behaviour, a simple choice is offered to the user on the console for selecting the operation to invoke. Depending on the choice, the user is asked to insert the specific parameters required by the operation, then the message is sent to the AdvamcedCalculatorService. In the following we report an example of an execution:

```jolie
jolie sodep_client.ol 


Select the operation to call:
1- factorial
2- percentage
3- average
? 1
Enter an integer
3
Result: 6
Chuck NOrris is an incredible sitar player.

```