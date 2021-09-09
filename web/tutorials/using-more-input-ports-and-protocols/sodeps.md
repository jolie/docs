# Adding an input port with protocol SODEPS
Protocol [sodeps](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/protocols/ssl/sodeps.html) uses  binary protocol `sodep` already described in this example, over `ssl`. It can be useful when secuting communication over sodep protocol. 

In the following picture we show how to add an inputPort which provides a sodeps protocol in addition to those with `http/json`, `http/soap`, `sodep`, `https` and `sodeps`  already discussed.

![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/more_inputports_and_protocols_sodeps.png)

As it happened for the addition of sodep protocol input port, also in the case of a sodep protocol input port the behaviour of the service is always the same, and you don't need to modify it.

## Adding the port
The first step is adding the inputPort to the code. In our example is:
```jolie
inputPort AdvancedCalculatorPortSODEPS {
    location: "socket://localhost:8006"
    protocol: sodeps {
        ssl.keyStore = "keystore.jks",
        ssl.keyStorePassword = "jolie!"
    }
    interfaces: AdvancedCalculatorInterface
}
```

It is worth noting that, as we did for protocol `https` also in this case we need to specify the keystore and the related password. You can use tool [`keytool`](https://docs.oracle.com/cd/E19798-01/821-1841/gjrgy/) for generating it. 

## The complete example

The complete example follows and it may be consulted at this [link]
(https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/more_inputports_and_protocols/sodeps)

```jolie
from AdvancedCalculatorServiceInterfaceModule import AdvancedCalculatorInterface
from CalculatorInterfaceModule import CalculatorInterface

interface ChuckNorrisIface {
    RequestResponse: random( undefined )( undefined )
}

service AdvancedCalculatorService {

    execution: concurrent

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

    inputPort AdvancedCalculatorPortHTTPS {
         location: "socket://localhost:8004"
         protocol: https { 
             format = "json",
             ssl.keyStore = "keystore.jks",
             ssl.keyStorePassword = "jolie!"
         }
         interfaces: AdvancedCalculatorInterface
    }

    inputPort AdvancedCalculatorPortSOAPS {
         location: "socket://localhost:8005"
         protocol: soaps {
             wsdl = "AdvancedCalculatorSOAPS.wsdl",
             wsdl.port = "AdvancedCalculatorPortSOAPServicePort",
             ssl.keyStore = "keystore.jks",
             ssl.keyStorePassword = "jolie!"
         }
         interfaces: AdvancedCalculatorInterface
    }

    inputPort AdvancedCalculatorPortSODEPS {
        location: "socket://localhost:8006"
        protocol: sodeps {
            ssl.keyStore = "keystore.jks",
            ssl.keyStorePassword = "jolie!"
        }
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

In this case the client is another jolie script that must be run in a separate shell. As we did for the example where we use protocol [`sodep`](), here we modified the output port which points to the sodeps port of the service, in order to be compliant with protocol `sodeps`.

```jolie
from AdvancedCalculatorServiceInterfaceModule import AdvancedCalculatorInterface
from console import *
from string_utils import StringUtils

service SodepsClient {
    outputPort AdvancedCalculatorService {
        location: "socket://localhost:8006"
        protocol: sodeps {
            ssl.trustStore = "truststore.jks",
            ssl.trustStorePassword = "jolie!"
        }
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
Note that the outputPort requires two more parameters: `ssl.trustStore` and `ssl.trustStorePassword` which allows to the define the trust store where checking the validity of the server certificate. To this end, it is important to [extract the certificate](https://access.redhat.com/documentation/en-us/red_hat_jboss_data_virtualization/6.2/html/security_guide/extract_a_self-signed_certificate_from_the_keystore) from the keystore of the service and [add it to the trust store](https://access.redhat.com/documentation/en-us/red_hat_jboss_data_virtualization/6.2/html/security_guide/add_a_certificate_to_a_truststore_using_keytool) of the client. In the following we report how to run the client and how it appears its console:


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