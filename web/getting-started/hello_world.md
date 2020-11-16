# Hello, World!

## Hello World

A Jolie program defines a service. A service achieves complex tasks by composing other services. An example of a very simple service is the following:

```jolie
import console.Console

service Hello {
    embed Console as C

    main {
        println@C( "Hello, world!" )()
    }
}
```

The program above reads as:

* import the service definition `Console` from the package `console`;
* define a service `Hello` that:
  * embeds and starts an instance of `Console`, called `C`;
  * sends the message `"Hello, world!"` to the `println` operation of service `C`.

We can already see some characteristics of a Jolie program:

* we can include other definitions by means of the primitive `import`;
* the entry point of a Jolie program is the `main` code block;
* we can send a message to a service with a native primitive.

The last point differs from classical programming languages and is peculiar to Jolie: the `println@Console( "Hello, world!" )()` line is a [solicit-response](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/basics/communication-ports/using_communication_ports.html) statement, which is a communication primitive.

## Running a Jolie service

Jolie programs are saved in files named with the `.ol` extension. For example, we can save the code of the service above in a file called `myFirstJolieService.ol`. Then, we can run it by executing the following command:

`jolie myFirstJolieService.ol`

which will print the string `Hello, world!`.

