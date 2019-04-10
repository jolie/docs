# What makes a technology microservice oriented? 

When approaching a new programming language or framework that claims to be working within a new programming paradigm one should approach this claim with extreme care. The same level of care should also be shown when approaching a (micro)services technology; we all know one of the "mantra" of MSA is that they should be technology independent, but ask yourself would you drill holes in a concrete wall with a penknife?

So what things one should look in a (micro)service-oriented language; a good starting point could be: is your technology able to define clearly the following trademark elements (micro)service paradigm.

* Interface: Interfaces are an essential part of (micro)service-oriented architecture they determine what the service does. They are not only a logical abstraction; they are the way service producers can transfer functional knowledge to any client. In this way do not need to know anything about the (micro)service implementation they can consume the interface and be ready to evoke any of the service operations

* Operation: One may be tempted to consider an operation as an object method or a function, as well if the share some concept like the definition of a method/function/operation signature, they differ on the fact that a client can call an operation without sharing any artefacts with the server. In the same way, the server should be able to process the request without any knowledge of the client's nature.

* Messages/Type: The messages contain all the information data used by the operations, in terms of the payload content sent or received by any specific operation. Messages are the only way the client and server should exchange data; the handling of the message content should be independent of the protocol used to free the programmer to know details about a specific. Any credible service-oriented language should have some built-in message check to free the programmer from developing extra code to check the validity of the sent or received messages.     

* Port: So far we have talked about some general logical aspect of (micro)services programming, The concept of port binds together all functional elements with the deployment aspect of the service. This separation should be evident also in the coding of our services, the development of the behaviour should be agnostic from deployment issues 

* Binding: In a microservice based should be able to express the binding between Interfaces and ports easily. Any change in binding should not affect the coding of the behaviour. 

* Protocol: The protocol express how the message is sent not what message contains, by saying that a microservices technology should be protocol agnostic, the logic on how the message is constructed or processed should be not affected if the protocol changes

## NodeJs
NodeJs is accredited to be a "microservice" technology based on the fact that can "construct non-blocking, event-driven I/O software", so the question comes natural, so if I implement an event-driven software in C++ does it make C++ a microservice language? 
We don't think so, in the same way, C was not a OO language as well if you could design OO artefacts.

## Interface or lack of it

ECMAScript/NodeJS does not contemplate the possibility to define an interface this has some considerable on how we code our service let's start with a simple example in Jolie 

```jolie
type MyOpRequest:void{
   .name:string
   .surname:string
   .age:int
}

type MyOpResponse:void{
   .iam:string
}
interface MySimpleInterface {
 RequestResponse:
  myOp(MyOpRequest)(MyOpResponse)
}

```
Here is my port definition 

```jolie
  inputPort myHttpPort{
     Location:"socket://localhost:8000"
     Protocol:HTTP{
          .format -> format;
          .contentType -> mime
     }
     Interfaces:MySimpleInterface
     
  }
```
Now lets look at the behaviour part
```jolie
execution{ concurrent }

main {
 [myOp(request)(response){
    response.iam = "I'am' and request.name + " " + request.surname + " and I am  " + request.age
 }]
}
```

Putting all toghether 

```jolie
type MyOpRequest:void{
   .name:string
   .surname:string
   .age:int
}

type MyOpResponse:void{
   .iam:string
}
interface MySimpleInterface {
 RequestResponse:
  myOp(MyOpRequest)(MyOpResponse)
}

  inputPort myHttpPort{
     Location:"socket://localhost:8000"
     Protocol:HTTP{
          .format -> format;
          .contentType -> mime
     }
     Interfaces:MySimpleInterface
     
  }
  execution{ concurrent }
  main{
      [myOp(request)(response){
        response.iam = "I'am "+ request.name + " " + request.surname + " and I am  " + request.age;
        mime = "application/json";
        format = "json"
     }]
  }
```

So how we can do this in NodeJs, as said before we can really define an interface so we need to start from the definition of a port. NodeJs is a modular framework based on JS, and to instantiate a HTTP we will use the *express* module

```js
var express = require('express');
```
now we can create the "port" variable
 ```js
 var myHttpPort = express();
```
and we initiate it 
 ```js
myHttpPort.listen(8000)
 ```
 now we need to write the behaviour
 
 ```js
myHttpPort.get('/myOp', function (req, res) {
  var query = request.query;
  var resVariable = {iAm: "I'am " + query.name + " " + query.surname + " and I am "  + query.age}
  
  response.send(resVariable);
});
 ```
 
Putting all toghether 
 ```js
var express = require('express');
var myHttpPort = express();

myHttpPort.get('/myOp', function (request, response) {
  var query =request.query;
  var resVariable = {iAm: "I'am " + query.name + " " + query.surname + " and I am "  + query.age}
  response.send(resVariable);
});

myHttpPort.listen(8000)

 ```
 
### TypeCheck TypeCast
 
Now with an implementation like this one can argue there is not need for interface definition , but what about type check or type casting lets us try to modify our implementation in NodeJs 

 ```js
function(request, response) {
  const errors = validationResult(request);
  if (!errors.isEmpty()) {
    return response.status(422).json({
      errors: errors.array()
    });
  }
  var query = request.query;
  var resVariable = {
    iam: "I'am " + query.name + " " + query.surname + " and I will  " + (query.age + 1)
  }
  response.send(resVariable);
});
 ```
 now the same implemntation with jolie 
```jolie
[myOp(request)(response){
   response.iam = "I'am "+ request.name + " " + request.surname + " and I am  " + (request.age +1);
   mime = "application/json";
   format = "json"
 }]
 ```
let's test them
 
 ``` 
http://localhost:8000/myop?name=John&surname=Green&age=41
 ``` 
 The result for the NodeJS implementation returns 
 ```json
{"iam":"I'am John Green and I will  411"}
 ```
  and the Jolie implementation 
```json  
{"iam":"I'am John Green and I will  42"}
 ```
Now the difference is result is given by the presence of the interface with its type definition that allows to cast when possible 

What about type checking 
 ``` 
 http://localhost:8000/myOp?name=John&surname=Green&age=Fourty-one
 ``` 
Jolie guards against type TypeMismatch intrinsically thanks to its TypeDefinition
```xml 
<myOpResponse>
<TypeMismatch>
Invalid native type for node #Message.age: expected INT, found java.lang.String
</TypeMismatch>
</myOpResponse>
```
when NodeJs will need some extra code to implement type cast and type check

 ```js
const {buildSanitizeFunction} = require('express-validator/filter');
const sanitizeBodyAndQuery = buildSanitizeFunction(['body', 'query']);
const {check,validationResult} = require('express-validator/check');



myHttpPort.get('/myOp', [check("name").exists(), 
                         check("surname").exists(), 
                         check("age").exists(),
                         check("age").isInt(), 
                         sanitizeBodyAndQuery('age').toInt()],
function(request, response) {
  const errors = validationResult(request);
  if (!errors.isEmpty()) {
    return response.status(422).json({
      errors: errors.array()
    });
  }
  var query = request.query;
  var resVariable = {
    iam: "I'am " + query.name + " " + query.surname + " and I will  " + (query.age + 1)
  }
  response.set('Content-Type', 'text/xml');
  response.send(xml(resVariable));
});
 ```
Now the end result is comparable, but the approach is complicity different in Jolie the developer is forced to define the type for each operation, this free the developer to implement control check later on.


### Service Refactoring 

Now let's imagine that we need to define an other set of operation grouped together in an new interface MySecondInterface here is the Jolie code 

 ```jolie
 type myOp1Request:void{
   .name:string
   .surname:string
}

type myOp1Response:void{
   .hello:string
}

interface MySecondInterface {
 RequestResponse:
  myOp1(myOp1Request)(myOp1Response)
}

  inputPort myHttpPort{
     Location:"socket://localhost:8000"
     Protocol:http{
          .format -> format;
          .contentType -> mime
     }
     Interfaces:MySimpleInterface,MySecondInterface

  }
  execution{ concurrent }
    main{
      [myOp(request)(response){
        response.iam = "I'am "+ request.name + " " + request.surname + " and I am  " + (request.age +1);
        mime = "application/json";
        format = "json"
     }]

     [myOp1(request)(response){
       response.hello = "Hello "+ request.name + " " + request.surname ;
          mime = "application/json";
          format = "json"
    }]
    }
 
  ```
now in NodeJs

 ```js
myHttpPort.get('/myOp1', [check("name").exists(),
                         check("surname").exists(),
                         ],
function(request, response) {
  const errors = validationResult(request);
  if (!errors.isEmpty()) {
    return response.status(422).json({
      errors: errors.array()
    });
  }
  var query = request.query;
  var resVariable = {
    hello: "hello " + query.name + " " + query.surname 
  }
  response.set('Content-Type', 'text/xml');
  response.send(xml(resVariable));
});
 ```
 There is nothing special about this but lets consider the case where all the operation in of MySecondInterface need to be exposed by a second port in Jolie in this is achieved by creating a second port and binding MySecondInterface to the second port 
 
```jolie
  inputPort mySecondHttpPort{
     Location:"socket://localhost:8001"
     Protocol:http{
          .format -> format;
          .contentType -> mime
     }
     Interfaces:MySecondInterface

  }

```
In Jolie there is not the need to change any code in the behavior because there is a clear separation between the logical and physical layer of the service
On the other hand in nodeJs 

```js
var mySecondHttpPort = express();

mySecondHttpPort.get('/myOp1', [check("name").exists(),
                         check("surname").exists(),
                         ],
function(request, response) {
  const errors = validationResult(request);
  if (!errors.isEmpty()) {
    return response.status(422).json({
      errors: errors.array()
    });
  }
  var query = request.query;
  var resVariable = {
    hello: "hello " + query.name + " " + query.surname
  }
  response.send(resVariable);
});
 
mySecondHttpPort.listen(8001)
```
The resulting change may look trivial changing myHttpPort into mySecondHttpPort , but let's consider the case where MySecondInterface would contain a bigger number of operation the developer would be forced to find all the operation involved in the change and apply the port. It goes without saying that if you want move operation from one interface to the other is the you have the problem due to the fact namePot.HTTPVerb format binds together an deployment aspect with the the way my (micro)service need to be coded this in our opinion is counter productive in a (micro)service complaint language. 

### Client Service

In Jolie it possible to export your interfaces into a separate file with extension .iol that can be feed into the client service -

```jolie

type myOpRequest:void{
   .name:string
   .surname:string
   .age:int
}

type myOpResponse:void{
   .iam:string
}

interface MySimpleInterface {
 RequestResponse:
  myOp(myOpRequest)(myOpResponse)
}

type myOp1Request:void{
   .name:string
   .surname:string
}

type myOp1Response:void{
   .hello:string
}

interface MySecondInterface {
 RequestResponse:
  myOp1(myOp1Request)(myOp1Response)
}

```
now lets look at client 

```jolie
include "simpleInterface.iol"


outputPort myHttpPort{
   Location:"socket://localhost:8000"
   Protocol:http{
        .debug= true;
        .method = "GET"
   }
   Interfaces:MySimpleInterface

}


main{
  req.name = "John";
  req.surname ="Green";
  req.age = 41;
  myOp@myHttpPort(req)(response)

}

```

Now look at the NodeJs
```javascript
var request = require('request');


var propertiesObject = { name:'John', surname :'Green', age: 41 };
var url = "http://localhost:8000/myOp"
request({url:url, qs:propertiesObject}, function(err, response, body) {
  if(err) { console.log(err); return; }
  console.log("Get response: " + body);
});
```
In this NodeJs implementation there are certain consideration to do

1. You need to know pass the full url each time you are calling your operation
2. You need to parse the body to extract the information  

This is given by the fact that nodeJs is not been though to work with service operation, it can implement call to service operation but it does remain a function based language.

### Orchestrating services 

Let us consider the following example our client need to write a minimum of logic calling two operation of the server, how would look the code in Jolie and in NodeJS let's start with a new operation in NodeJs

```javascript
myHttpPort.get('/checkAge', [
    check("age").isInt(),
    sanitizeBodyAndQuery('age').toInt()
  ],
  function(request, response) {
    const errors = validationResult(request);
    if (!errors.isEmpty()) {
      return response.status(422).json({
        errors: errors.array()
      });
    }
    var query = request.query;
    var resVariable = {
        ageOK: false
      }
    if (query.age > 21) {
      resVariable.ageOK: true
      }
    };
    response.send(resVariable);
  });
  
  myHttpPort.post('/booking', [
    check("age").isInt(),
    sanitizeBodyAndQuery('age').toInt()
  ],
  function(request, response) {
    const errors = validationResult(request);
    if (!errors.isEmpty()) {
      return response.status(422).json({
        errors: errors.array()
      });
    }
    var query = request.query;
    var resVariable = {
        ageOK: false
      }
    if (query.age > 21) {
      resVariable.ageOK: true
      }
    };
    response.send(resVariable);
  });
```
and now in Jolie

```jolie
[checkAge(request)(response){
   response.ageOK = false;
  if (request.age>21){
      response.ageOK = true
  };
  mime = "application/json";
  format = "json"
}]
 [booking(request)(reponse){
       response.booked = "Dear "+ request.name + " " + request.surname + " your booking has been confirm for " + request.date;
       mime = "application/json";
       format = "json"
      }]
```

Now lets us look to the orchetrator

```javascript
function booking(req){
   var request = require('request');
   let url = "http://localhost:8000/booking"
   request({url:url, qs:req}, function(err, response, body) {
     if(err) { console.log(err); return; }
     responseBooking = JSON.parse(body);

   });

 }

function checkAge (req){
 var request = require('request');
 var url = "http://localhost:8000/checkAge"
 request({url:url, qs:req}, function(err, response, body) {
  if(err) { console.log(err); return; }
  responseCheckAge = JSON.parse(body);
   if (responseCheckAge.ageOK === true){
     var requestBooking={
       name:'John',
       surname:'Green',
       date: new Date()
     };
     booking(requestBooking)
   }
});

}

requestCheckAge={age : 22};

checkAge(requestCheckAge);

```
and now the Jolie orchestator

```jolie
include "simpleInterface.iol"
include "time.iol"

outputPort myHttpPort{
   Location:"socket://localhost:8000"
   Protocol:http{
        .debug= true;
        .debug.showContent= true;
        .method = "GET"
   }
   Interfaces:MySimpleInterface

}


main{
  requestCheckAge.age = 22;
  checkAge@myHttpPort(requestCheckAge)(responseCheckAge);
   if (responseCheckAge.ageOK == true ){
     requestBooking.name ="John";
     requestBooking.surname = "Green";
     getCurrentTimeMillis@Time( request )( requestGetTime );
     getDateTime@Time( requestGetTime )( responseGetTime );
     requestBooking.date = responseGetTime;
     booking@myHttpPort(requestBooking)(responseBooking)
   }


}
```
Let's comperare the two way orchestrate operation in jolie we can clearly identify a sequence of  operation calls with a clear compositional  logic ,where in NodeJs the orchestration logic need to be defined as a series http call response handling functions. With in this functions we can see how the programmer need to extract the content from the body ```responseCheckAge = JSON.parse(body); ``` when in Jolie you just work with straight three variable. In NodeJs the programmer is force to define a lot of low level aspects and continuously switching paradigm between the native functional paradigm and the need to thinking to operations. 

This result in an increase in complexity and difficulty in reading the code, in Jolie the syntax il coherent with the service paradigm that help the programmer with the definition of the orchestration behavior  


  
