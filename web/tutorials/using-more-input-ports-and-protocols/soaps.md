# Adding an input port with protocol SOAPS
Protocol [soaps](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/protocols/ssl/soaps.html) uses protocol soap over https and it can be useful when developing a Web Service over a secure communication. `https` is a standard protocol, an exampole of its usage has been already commented in the previous section. Here we add an extra input port which allows to expose a soap port, like we did in section [soap](https://docs.jolie-lang.org/v1.10.x/tutorials/using-more-input-ports-and-protocols/soap.md), over https.

In the following picture we show how to add an inputPort which provides a `soaps` protocol in addition to those with `http/json`, `http/soap`, `sodep` and `https` already discussed in the previous sections.

![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/more_inputports_and_protocols_soaps.png)

As it happened for the addition of the other protocol input ports, also in the case of a soaps protocol input port, the behaviour of the service is always the same, and you don't need to modify it.

## Adding the port
The first step is adding the inputPort to the code. In our example is:
```jolie
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

```

Note that protocol `soaps` requires parameters for identifying the wsdl document to use (`wsdl`) and the related port (`wsdl.port`) as we did for protocol `soap`. Here we generated a new wsdl document, in order to provide the correct location for the soaps port. As we did for the soap protocol example, we exploit tool [jolie2wsdl](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/web-services/jolie2wsdl.html),
```jolie
jolie2wsdl --namespace example.jolie.org --portName AdvancedCalculatorPortSOAPS --portAddr https://localhost:8005 --outputFile AdvanceCalculatorSOAPS.wsdl AdvancedCalculatorService.ol
```
In this case we saved the wsdl document within file `AdvancedCalculatorSOAPS.wsdl` that is the file name specified in parameter `wsdl`. 
Moreover, similarly as we did for protocol `https`, protocol `soaps` requires a keystore as a reference in order to provide a security certificate to clients.  In this example, we previously generated a key store using the tool [`keytool`](https://dzone.com/articles/keytool-commandutility-to-generate-a-keystorecerti). Then, we specified the key store file as a parameter of the protocol `ssl.keyStore`, together with the password to access it `ssl.keyStorePassword`. 


## The complete example

The complete example follows and it may be consulted at this [link]
(https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/more_inputports_and_protocols/soaps)

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
             wsdl = "AdvancedCalculator.wsdl",
             wsdl.port = "AdvancedCalculatorPortSOAPServicePort",
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
As it si possible to note, here we just added the port `AdvancedCalculatorPortSOAPS`, thus enabling the service to receive on port `8005` using protocol `soaps`.

## Running the service and invoking it
Since we are extending the example [Using more than one dependency](https://docs.jolie-lang.org/v1.10.x/tutorials/using-more-than-one-dependency/), here we need to run two services in two separate shells:
```jolie
jolie AdvancedCalculatorService.ol
jolie CalcularService.ol
```
As we did for protocol soap example, we can use  [SoapUI](https://www.soapui.org/) as a tool for creating a client. It is sufficient to import the wsdl file and then fill the request with the value you prefer. In the following picture we prepared a request for the operation `factorial`.

![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/soapsgui.png)