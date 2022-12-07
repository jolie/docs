# Getting started

This an introductory tutorial for getting confidence with the Jolie language. You will learn to:

* define an interface for a service;
* program and run a service;
* set the execution modality.

As a reference example, here we are creating a service which implements a simple basic calculator. In particular, the service will provide four basic operations for each of the basic arithmetic ones: sum, subtraction, multiplication and division.

## Define an interface for a service

Jolie enables the developer to follow a _contract first_ programming approach. This means that, before starting with the development, it is necessary to define the API of the service. In Jolie, this can be done by defining the **interface**. An interface contains a list of functionalities, called **operations**, which can be implemented by a service. In the following we report a first draft of an interface for a calculator:

```jolie
interface CalculatorInterface {
    RequestResponse:
        sum,
        sub,
        mul,
        div
}

```

This code can be read as _defines an interface called CalculatorInterface which contains four operations of type RequestResponse called sum, sub, mul and div respectively_. It is worth noting that there are two possible types for the operations: _RequestResponse_ and _OneWay_. The former represents a synchronous exchange which involves a request message and a response message, whereas the latter represents an asynchronous exchange where there is only a request message without any response.

Save this code into a specific file called `CalculatorInterfaceModule.ol`, we will import it later from the service module.

### Define message types

So far, we have just defined an interface as a list of operations without specifying anything about the signatures of the operations. In Jolie it is possible to define message types in order to specify the structure of the messages. In the following we enhance the previous definition of the interface, by adding message types.

```jolie
type SumRequest: void {
    term[1,*]: int
}

type SubRequest: void {
    minuend: int
    subtraend: int
}

type MulRequest: void {
    factor*: double
}

type DivRequest: void {
    dividend: double
    divisor: double
}

interface CalculatorInterface {
    RequestResponse:
        sum( SumRequest )( int ),
        sub( SubRequest )( int ),
        mul( MulRequest )( double ),
        div( DivRequest )( double )
}

```

Some interesting things to note:

* in Jolie there are basic data types as integers, string, double, etc. In the example we exploit `int` (integers) for all the operations with the exception of operations multiplication and division where we use type `double`. You can check the other basic types [here](../../language-tools-and-standard-library/basics/interfaces/data_types/README.md);
* the keyword `type` allows for the definition of structured data types;
* an operation message type is just a data type associated with it into the definition of the operation. As an example the request message of operation `sum` is `SumRequest` whereas the reply is just a `double`;
* a data type structure in Jolie represents a tree of nodes. As an example, type `DivRequest` contains two subnodes named `dividend` and `divisor` respectively. Both of them are `double`;
* a node in a data structure can be a vector. As an example node `term` of type `SumRequest` is a vector of `double`. `[1,*]` stands for: minimum occurrences 1 and maximum occurrences infinite. We read `term[1,*]:double` as an unbounded vector of double with at least one element;

## Program and run a service

Once we have defined the interface to implement, we are ready to define the service. Let's call the service `CalculatorService`. Edit a new module as follows:

```jolie
from CalculatorInterfaceModule import CalculatorInterface

service CalculatorService {

}
```

This code permits to import the definition of the `CalculatorInterface` from module `CalculatorInterfaceModule` stored into file `CalculatorInterfaceModule.ol` and defines a service called `CalculatorService`.

### Defining the inputPort

Unfortunately, the code above will raise an error if executed, because the service definition does not contain any listening port nor any behaviour too. Let's start by defining a listening endpoint for this service:

```jolie
rom CalculatorInterfaceModule import CalculatorInterface

service CalculatorService {

    inputPort CalculatorPort {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: CalculatorInterface
    }
}
```

Listening endpoints in Jolie are called `inputPort`. In this example we defined one inputPort named `CalculatorPort`. An inputPort always requires three parameters in order to be properly set:

* **location**: it specifies where the service is listening for messages. In the example `socket://localhost:8000` where `socket` defines the medium used for the communication;
* **protocol**: it specifies the protocol do use for interacting with the service. In this example is `http`. In particular, protocol http is parameterized setting property `format` to `json` which means that the message body of the http message is a JSON;
* **interfaces**: it specifies the interfaces available at the port. In this case the interface `CalculatorInterface` is defined. Summarizing we can read the inputPort definition of this example as follows: _start to listen on a socket of localhost at port 8000. Use protocol http for interpreting received messages and preparing responses too. Enable all the operations defined into CalculatorInterface`.

### Defining the behaviour

Now, the service is ready to receive messages on the operation specified in interface `CalculatorInterface` but we did not tell it what to do once a message is received. It is time to finalize the service by specifying the behaviour:

```jolie
from CalculatorInterfaceModule import CalculatorInterface

service CalculatorService {

    inputPort CalculatorPort {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: CalculatorInterface
    }

    main {

        [ sum( request )( response ) {
            for( t in request.term ) {
                response = response + t
            }
        }]

        [ sub( request )( response ) {
            response = request.minuend - request.subtraend
        }]

        [ mul( request )( response ) {
            response = 1
            for ( f in request.factor ) {
                response = response * f
            }
        }]

        [ div( request )( response ) {
            response = request.dividend / request.divisor
        }]
    }
}
```

Some interesting things to be noticed:

* the behaviour is set within scope `main`;
* the list of operations are specified using [input choices](../../language-tools-and-standard-library/basics/composing-statements/README.md#input-choice). This is why you see square brackets around the implementation of each operation. Briefly, when more than one operation is put within an input choice, it means they are all available but only that which receives a message is executed;
* each operation specifies a variable which contains the request message, in the example we named all of them as `request`. they specify the variable which will contain the response, in the example we named all of them as `response`;
* the code specified within curly brackets in an operation, defines the code to be executed after the reception of a request and the final sending of the response;
* once the body code of a request-response is finished, the content of the variable specified as a response will be actually sent as response message. This means that its data structure must correspond to what is defined into the interface;
* we read `for( t in request.term )` as: for each element of vector `request.term` do the code within curly brackets. Use token `t` for referring to the current element of the vector.

### Running the service

Save the previous code into a module called `CalculatorService.ol` within the same folder where you previously saved the interface module `CalculatorInterfaceModule.ol`. Run the service using the following command:

```jolie
jolie CalculatorService.ol
```

The service will start immediately waiting for a request.

### Sending a request to the service

For the sake of this example, we can use `curl` as a program for sending a message to the service. Other http clients can be used instead. Running the following clients you can check how the different operations reply:

* **sum**:

```bash
curl 'http://localhost:8000/sum?term=5&term=6&term=20'
{"$":31}
```

* **sub**:

```bash
curl 'http://localhost:8000/sub?minuend=10&subtraend=5'
{"$":5}
```

* **mul**:

```bash
curl 'http://localhost:8000/mul?factor=5&factor=2&factor=3'
{"$":30}
```

* **div**:

```bash
curl 'http://localhost:8000/div?dividend=10.8&divisor=2'
{"$":5.4}
```

### Setting the execution modality

We are quite sure that, if you strictly followed this tutorial, you were able to run only one client and then restart the service because it went down. This is not an error or a malfunction, but it is due to the fact that we did not specify any execution modality for the service `CalculatorService`. The execution modality specifies three different way to run a service: `concurrent`, `sequential` or `single`. If nothing is specified, modality `single` is set. This modality means that the service executes its behaviour once, then stops. This is why our service just executed one operation and then stopped.

In order to enable the service to continuously serve requests we need to specify the execution modality `concurrent`.
So, let's admire our first service in Jolie!

```jolie
from CalculatorInterfaceModule import CalculatorInterface

service CalculatorService {

    execution: concurrent

    inputPort CalculatorPort {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: CalculatorInterface
    }

    main {

        [ sum( request )( response ) {
            for( t in request.term ) {
                response = response + t
            }
        }]

        [ sub( request )( response ) {
            response = request.minuend - request.subtraend
        }]

        [ mul( request )( response ) {
            for ( f in request.factor ) {
                response = response * f
            }
        }]

        [ div( request )( response ) {
            response = request.dividend / request.divisor
        }]
    }

}
```

## The complete example

The complete example of this tutorial can be found at this [link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/getting_started)

## Exiting a service

Jolie provides the `exit` instruction to exit the current program by terminating the running Java virtual machine. In the example above, we could extend our service interface and behaviour with the `shutdown` operation, which closes the service using the `exit` instruction — notice that we use the full syntax of [input choices](../../language-tools-and-standard-library/basics/composing-statements/README.md#input-choice) here, which is `[ inputOperation ]{ post-operation code }`.

```jolie
    main {

        [ sum( request )( response ) {
            for( t in request.term ) {
                response = response + t
            }
        }]

        // ...

        [ shutdown()() ]{
            exit
        }
    }

}
```
