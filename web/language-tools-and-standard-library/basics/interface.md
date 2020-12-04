# Interfaces

Jolie can be defined as a contract first language; this means that a good starting point for the development of any Jolie microservices is the definition of one or more interfaces. 
The interface is a purely logical concept that groups together operations, declaring their names and input and output message type. The interface(s) can be declared within the declarative section of any Jolie source code or in a separate file that then can be imported 

The primitive to identify an interface definition is **interface** followed by a unique alphanumerical identifier. Within the curly brackets we will at least one of the following keywords **RequestResponse** and **Oneway**.

The **RequestResponse** keyword identifies the start of the solicit response operations declaration block 



```jolie
interface MyInterface {
RequestResponse: 
    op1( Op1Request )(  Op1Response )
}
``` 

So if we would like to read this fragment of Jolie it would read *"It exists an interface MyInterface where is declared  an solicit response operation op1 that accepts a message of type Op1Request and returns a message of type Op1Response”*

The **OneWay** keyword identifies the start of the notification operations declaration block 

```jolie
interface MyInterface {
RequestResponse: 
    op1( Op1Request )(  Op1Response )
OneWay:
    op2( Op2Request)
}
``` 

Once again if we would like to read this fragment of Jolie it would read *"It exists an interface MyInterface where is declared a solicit response operation op1 that accepts a message of type Op1Request and returns a message of type Op1Response and where is declarad a notification operation op2 that that accepts Op2Request”.

To declare multiple operation each operation declaration is separated by a **,** (coma) as in the example 

```jolie
interface MyInterface {
RequestResponse: 
    op1( Op1Request )(  Op1Response ),
    op3( Op3Request )(  Op3Response )
OneWay:
    op2( Op2Request)
}
``` 

## Operations

In the previous section we have seen how to declare RequestResponse and OneWay but let us look at some aspect of the declaration 

```text
   operationName(InputMessegeType)(OutputMessegeType)
```

The **InputMessegeType**  and **OutputMessegeType** can be defined as a Complex Type or a Simple Type for example :

```jolie
interface MyMath {
RequestResponse: 
    squareRoot( double )(  double ),
    add( AddRequest )(  AddResponse )
}
``` 
The operation squareRoot accepts the simple type double and it returns the same, where the operation add need an extra type definition

type AddRequest:void{
  
    
}

interface MyMath {
RequestResponse: 
    squareRoot( double )(  double ),
    add( AddRequest )(  AddResponse )
}
``` 

