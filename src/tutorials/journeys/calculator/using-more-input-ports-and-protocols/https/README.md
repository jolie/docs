# Adding an input port with protocol HTTPS

Protocol [https](../https/README.md) is a very wide used secure protocol which exploits __http__ over __ssl__.  It is a standard protocol we suggest to use every time you need to secure your APIs following a standard approach.

In the following picture we show how to add an inputPort which provides a `https` protocol in addition to those with `http/json`, `http/soap`  and `sodep`, already discussed in the previous sections.

As it happened for the addition of the other protocol input ports, also in the case of a https protocol input port, the behaviour of the service is always the same, and you don't need to modify it.

## Adding the port

The first step is adding the inputPort to the code. In our example is:

```jolie
inputPort AdvancedCalculatorPortHTTPS {
    location: "socket://localhost:8004"
    protocol: https { 
        format = "json",
        ssl.keyStore = "keystore.jks",
        ssl.keyStorePassword = "jolie!"
    }
    interfaces: AdvancedCalculatorInterface
}

```

Note that protocol `https` requires a keystore as a reference in order to provide a security certificate to clients.  
In this example, we previously generated a key store using the tool [`keytool`](https://dzone.com/articles/keytool-commandutility-to-generate-a-keystorecerti). Then, we specified the key store file as a parameter of the protocol `ssl.keyStore`, together with the password to access it `ssl.keyStorePassword`.

## The complete example

The complete example follows and it may be consulted at this [link](https://github.com/jolie/examples/tree/master/Tutorials/calculator/more_inputports_and_protocols/https)

```jolie
from .AdvancedCalculatorServiceInterfaceModule import AdvancedCalculatorInterface
from .CalculatorInterfaceModule import CalculatorInterface

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

As it si possible to note, here we just added the port `AdvancedCalculatorPortHTTPS`, thus enabling the service to receive on port `8004` using protocol `https`.

## Running the service and invoking it

Since we are extending the example [Using more than one dependency](../../using-more-than-one-dependency/README.md), here we need to run two services in two separate shells:

```jolie
jolie AdvancedCalculatorService.ol
jolie CalcularService.ol
```

We can use `curl` for sending a request to the service.

```bash
curl https://localhost:8004/factorial?term=3
```

_WARNING_: If you are using a self signed certificate for the example service, use parameter `--insecure`for avoiding the validation check of the certificate, otherwise `curl` will not send any request.
