# Javascript

Embedding a JavaScript Service enables to use both the JavaScript language and Java methods by importing their classes.

Let us rewrite the [_twice_ service example](https://github.com/jolie/docs/tree/f2682237d6cab2ca909d857f22b3e964ae8d11d8/technology-integration/getting-started/set_execution_modality/README.md) as a JavaScript embedded service.

```javascript
importClass( java.lang.System );
importClass( java.lang.Integer );

function twice( request )
{
    var number = request.getFirstChild("number").intValue();
    System.out.println( "Received a 'twice' request for number: " + number );
    return Integer.parseInt(number + number);
}
```

At Lines 1-2 we respectively import `java.lang.System` to use it for printing at console a message, and `java.lang.Integer` to send a proper response to the embedder. This is necessary because of JavaScript's single number type which, internally, represents any number as a 64-bit floating point number. At Line 6 the methods `getFirstChild` and `intValue`, belonging to `Value` class, are used to read the request's data. Finally at Line 8 we use the `parseInt` method of class `Integer` to return an `Integer` value to the invoker.

```jolie
include "console.iol"

type TwiceRequest:void {
    .number: int
}

interface TwiceInterface {
RequestResponse:
    twice( TwiceRequest )( int )
}

outputPort TwiceService {
Interfaces: TwiceInterface
}

embedded {
JavaScript:
    "TwiceService.js" in TwiceService
}

main
{
    request.number = 5;
    twice@TwiceService( request )( response );
    println@Console( "Javascript 'twice' Service response: " + response )()
}
```

Like embedding Jolie Services, also JavaScript Services require the specification of the local file where the JavaScript Service is defined \(i.e., `TwiceService.js`, Line 18\).

