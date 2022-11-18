# Using jpm for creating new packages

WARNING: Before publishing this tutorial, we have to decide a standard name for the module containing Binding and possibly a better name for the type. It could be `from ports import PortConfiguration` instead of `from types.Binding import Binding`.

WARNING: jpm doesn't support testing a package locally yet. I've put the workflow for packages that get published on npmjs.

In this tutorial we will show how to create a package starting from an existing service, and a client that uses it.
The complete example may be checked at this [link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/jpm-jolie).

Here we want to create a package of the service `calculator` defined below:

```jolie
from .calculator-interface import CalculatorInterface

service Calculator {
  execution: concurrent

  inputPort CalculatorPort {
    location: "local"
    interfaces: CalculatorInterface
  }     

  main {
    [ sum( request )( response ) {
      for( t in request.term ) {
        response += t
      }
    } ]

    [ sub( request )( request.minuend - request.subtraend ) ]

    [ mul( request )( response ) {
      response = 1
      for ( f in request.factor ) {
        response *= f 
      }
    } ]
    
    [ div( request )( request.dividend / request.divisor ) ]
  }
}
```

The definition of the service is stored in file `main.ol` within the project folder `calculator/`.

## Creation of the package

Go to the directory of your package, `calculator/`, and do the following:

- Make sure you have JPM installed: `sudo npm install -g @jolie/jpm`
- In `calculator/`, run `jpm init`. This will initialise a file called `jpm.json`, which is the configuration file of the package.
- Edit `jpm.json` to insert your data.
- To publish your package, run `npm publish --access public`. WARNING: `jpm publish` works only after we run `npm publish --access public` for the first time. Invoking npm shouldn't be necessary.

Now go to the directory of your client, `client/`, and do the following:

- Run `jpm init`
- Run `jpm add calculator`
- Run `jolie main.ol`

Need to decide whether there should be a `main.ol` file, which is the default file from which clients import symbols from the package. Having a `main.ol` file is not necessary.
