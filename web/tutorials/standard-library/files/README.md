# Using files

Using files in jolie is very simple. There standard library [`file`](https://docs.jolie-lang.org/v1.10.x/language-tools-and-standard-library/standard-library-api/file.html) provides a set of useful operations for managing files. In this tutorial we show:

* how to read from a file;
* how to write to a file;
* how to send the content of a file from a service to another.

## Reading a file

In this simple example, whose code can be checked [at this link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/using-files/reading-a-file), we show how to read the content of a file and print out it on the console. In the following we present a jolie script which reads from file `test.txt` and prints its content on the console using `println@console`.

```jolie
from file import File
from console import Console

service Example {

    embed Console as console
    embed File as file
    main {

        readFile@file( { filename = "test.txt"} )( response )
        println@console( response )()
    }

}
```

Note that it is important to import ```jolie from file import File```and embed   ```jolie   embed File as file``` the into the  service from the standard library then it is sufficient to use operation `readFile@file` for reading from the file. The operation `readFile@file` requires the filename. The content is then stored into variable `response` and it can be easily printed out using `println@console`.

## Writing a file

As for the reading of a file, writing a file uses the standard library `file` and in particular we exploit the operation `writeFile@file`. In the following we show a script which creates a file called `test.txt` and writes the string `this is a test message`. The full code of the example may be consulted [at this link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/using-files/writing-a-file)

```jolie
from file import File

service Example{
    embed File as file 

    main{
        writeFile@file( {
            filename = "test.txt"
            content = "this is a test message"
        } )()
    }
}
```

Note that the operation `writeFile@file` requires at least two parameters: the filename and the content of the file.

## Communicating the content of a file

Now, let's step forward creating a simple system where a server receives the content from a source file read by the client, and appends it to a receiving file. The full example can be checked [at this link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/using-files/communicating-file-content).
The example uses the following file structure

```
.
+-- ServerInterface.ol
+-- server.ol
+-- client.ol
```

The interface of the server follows can be found in ServerIterface.ol:

```jolie
interface ServerInterface {
    RequestResponse:
        setFileContent( string )( void )
}
```

Note that it is very simple and it just defines a single operation which is able to receive a string.The code of the server is  :

```jolie

from .ServerInterface import ServerInterface
from file import File

constants {
    FILENAME = "received.txt"
}


service ExampleServer {

 
embed File as file

inputPort server {
    Location: "socket://localhost:9000"
    Protocol: sodep
    Interfaces: ServerInterface
}


execution:concurrent

main {
    setFileContent( request )( response ) {
        writeFile@file( {
            filename = FILENAME
            content = request
            append = 1
        } )()
    }
}

}
```

The server is waiting to receive a message on operation `setFileContent`, once received it appends the message into the file `received.txt`. Note that the appending capability is enabled setting the parameter `append` of the operation `writeFile@file` to `1`.

On the other hand, the client reads a content from a file and sends it to the server:

```jolie
from .ServerInterface import ServerInterface
from file import File

service ExampleClient{

    embed File as file

    outputPort server {
        Location: "socket://localhost:9000"
        Protocol: sodep
        Interfaces: ServerInterface
    }

    main {
        
        readFile@file( {filename = "source.txt"} )( content )
        setFileContent@server( content )()
    }

}
```

## Communicating raw contents

Let's now concluding this tutorial showing how to manage also binary files. So far indeed, we dealt only with text files where their content is always managed as a string. In general, we could require to manage any kind of files. In the following we show hot to read, communicate and write the binary content of a file. We propose the same scenario of the section above where there is a client which reads from a file and sends its content to a server, but we show how to deal with binary files. The full code of the example may be consulted [at this link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/using-files/communicating-raw-files). Like in previous example the following file structure is used.

```
.
+-- ServerInterface.ol
+-- server.ol
+-- client.ol
```

The interface of the server changes as it follows:

```jolie
type SetFileRequest: void {
    .content: raw
}

interface ServerInterface {
    RequestResponse:
        setFile( SetFileRequest )( void )
}
```

Note that the request type of operation `setFile` has a subnode called `.content` whose native type is set to `raw`. `raw` is the native type used in jolie messages for sending binaries. Let us now see how the client works:

```jolie
from .ServerInterface import ServerInterface
from file import File


constants {
    FILENAME = "received.pdf"
}


service ExampleServer {

embed File as file    

inputPort server {
    Location: "socket://localhost:9000"
    Protocol: sodep
    Interfaces: ServerInterface
}


execution: concurrent 
main {
    setFile( request )( response ) {

        writeFile@file(  {
            .filename = FILENAME;
            .content = request.content;
            .format = "binary"
        })()
    }
}


}
```

Note that the approach is the same of that we used for string contents with the difference that we specify also the parameter `format="binary"` for the operation `readFile@file`. Such a parameter enables jolie to intepreting the content of the file as a stream fo bytes which are represented as the native type `raw`. It is worth noting that the content of the reading is directly stored into the variable `rq.content`, this is why we just send variable `rq` with operation `setFile`.

On the server side the code is:

```jolie
from .ServerInterface import ServerInterface
from file import File



service ExampleClient{

    embed File as file

    outputPort server {
        Location: "socket://localhost:9000"
        Protocol: sodep
        Interfaces: ServerInterface
    }

    main {
        
        readFile@file( {
            filename = "source.pdf"
            format = "binary"
        } )( rq.content )
        
        setFile@server( rq )()
    }

}
```

Also in this case we enable the usage of binaries setting the parameter `format="binary"` for operation `writeFile`. Note that in this example the file read is a PDF file.
