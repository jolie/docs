# Adding an input port with protocol SOAP
Protocol [soap](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/protocols/soap.html) is used for exchanging structured information among Web Services. As depicted in the following picture, in Jolie it is possible to add input ports specifically for addressing SOAP messages.

![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/more_inputports_and_protocols_soap.png)

The behaviour of the service is always the same, but a new soap port is added and a soap client can now invoke the service. In the following we describe the steps to follow in order to add a soap port correclty configured.

## Adding the port
The first step is adding the inputPort to the code. In pour example is:
```
inputPort AdvancedCalculatorPortSOAP {
        location: "socket://localhost:8002"
        protocol: soap 
        interfaces: AdvancedCalculatorInterface
}

```

## Generating the wsdl definition
The port is defined but we also need to attach the corresponding wsdl definition to be used together with that port. The wsdl definition must represents the jolie interface using the WSDL XML notation. Addressing such a step manually is quite difficult, so we introduced an automatic tool for doing it: [jolie2wsdl](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/web-services/jolie2wsdl.html). It is installed together with the jolie interpreter. Its usage is quite simple, it is a command line tool which accepts some parameters. In our example, the command to run is:
```
jolie2wsdl --namespace test.jolie.org --portName AdvancedCalculatorPortSOAP --portAddr http://localhost:8002 --outputFile AdvancedCalculator.wsdl AdvancedCalculatorService.ol 
```
where:
* _namespace_: it specifies the namespace of the wsdl document
* _portName_: it specifies the name of the soap port from which extracting the wsdl documentation
* _portAddr_: it is the port address that will appear inside the wsdl definition
* _outputFile_: it is the output file where the wsdl definition will be stored.

The final result should be similar to the definition at this [link](https://github.com/jolie/examples/blob/master/v1.10.x/tutorials/more_inputports_and_protocols/soap/AdvancedCalculator.wsdl)


## Completing the configuration of the port
Now we are ready to complete the configuration of the soap port as it follows:


```
inputPort AdvancedCalculatorPortSOAP {
        location: "socket://localhost:8002"
        protocol: soap {
            wsdl = "AdvancedCalculator.wsdl",
            wsdl.port = "AdvancedCalculatorPortSOAPServicePort"
        }
        interfaces: AdvancedCalculatorInterface
}

```
This new inputPort has been defined for using protocol `soap`, and it is listening on port `8002`. It is worth noting that two parameters are required: `wsdl` and `wsdl.port`. The former one specifies the wsdl file to be used by the service for creating correct soap messages, whereas the latter specifies the wsdl `port` to be attached to the current port.

## The complete example

The complete example follows and it may be consulted at this [link]
(https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/more_inputports_and_protocols)

```
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

    main {
        [ factorial( request )( response ) {
            for( i = request.term, i > 0, i-- ) {
                req_mul.factor[ #req_mul.factor ] = i
            }The service with the new port can now be run in the same way we did without the soap port:
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
The complete example can be found [here](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/more_inputports_and_protocols/soap). Since we are extending the example [Using more than one dependency](https://docs.jolie-lang.org/v1.10.x/tutorials/using-more-than-one-dependency/), here we need to run two services in two separate shells:
```
jolie AdvancedCalculatorService.ol
jolie CalcularService.ol
```
Now the service AdvanceCalculatorService is listening on two ports: '8001' and '8002'. Where the former accepts 'http/json' messages and the latter soap messages. Now let us use an external tool for create a correct soap request. A tool you could use is [SoapUI](https://www.soapui.org/). It is sufficient to import the wsdl file and then fill the request with the value you prefer. In the following picture we prepared a request for the operation `factorial`.

![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/soapgui.png)

