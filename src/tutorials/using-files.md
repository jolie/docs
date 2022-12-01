# Using files

Using files in jolie is very simple. There standard library [`file.iol`](https://jolielang.gitbook.io/docs/standard-library-api/file) provides a set of useful operations for managing files. In this tutorial we show:

* how to read from a file;
* how to write to a file;
* how to send the content of a file from a service to another.

## Reading a file

In this simple example, whose code can be checked [at this link](https://github.com/jolie/examples/tree/master/Tutorials/using-files/reading-a-file), we show how to read the content of a file and print out it on the console. In the following we present a jolie script which reads from file `test.txt` and prints its content on the console using `println@Console`.

```jolie
include "file.iol"
include "console.iol"

main {
    request.filename = "test.txt"
    readFile@File( request )( response )
    println@Console( response )()
}
```

Note that it is important to include `file.iol` service from the standard library, then it is sufficient to use operation `readFile@File` for reading from the file. The operation `readFile@File` requires the filename. The content is then stored into variable `response` and it can be easily printed out using `println@Console`.

## Writing a file

As for the reading of a file, writing a file uses the standard library `file.iol` and in particular we exploit the operation `writeFile@File`. In the following we show a script which creates a file called `test.txt` and writes the string `this is a test message`. The full code of the example may be consulted [at this link](https://github.com/jolie/examples/tree/master/Tutorials/using-files/writing-a-file)

```jolie
include "file.iol"

main {
    with( request ) {
        .filename = "test.txt";
        .content = "this is a test message"
    }
    writeFile@File( request )()
}
```

Note that the operation `writeFile@File` requires at least two parameters: the filename and the content of the file.

## Communicating the content of a file

Now, let's step forward creating a simple system where a server receives the content from a source file read by the client, and appends it to a receiving file. The full example can be checked [at this link](https://github.com/jolie/examples/tree/master/Tutorials/using-files/communicating-file-content).

The interface of the server follows:

```jolie
interface ServerInterface {
    RequestResponse:
        setFileContent( string )( void )
}
```

Note that it is very simple and it just defines a single operation which is able to receive a string. The code of the server is:

```jolie
include "ServerInterface.iol"
include "file.iol"

execution{ concurrent }

inputPort Server {
    Location: "socket://localhost:9000"
    Protocol: sodep
    Interfaces: ServerInterface
}

constants {
    FILENAME = "received.txt"
}

main {
    setFileContent( request )( response ) {
        with( rq_w ) {
            .filename = FILENAME;
            .content = request;
            .append = 1
        }
        writeFile@File( rq_w )()
    }
}
```

The server is waiting to receive a message on operation `setFileContent`, once received it appends the message into the file `received.txt`. Note that the appending capability is enabled setting the parameter `append` of the operation `writeFile@File` to `1`.

On the other hand, the client reads a content from a file and sends it to the server:

```jolie
include "ServerInterface.iol"
include "file.iol"

outputPort Server {
    Location: "socket://localhost:9000"
    Protocol: sodep
    Interfaces: ServerInterface
}

main {
    f.filename = "source.txt"
    readFile@File( f )( content )
    setFileContent@Server( content )()
}
```

## Communicating raw contents

Let's now concluding this tutorial showing how to manage also binary files. So far indeed, we dealt only with text files where their content is always managed as a string. In general, we could require to manage any kind of files. In the following we show hot to read, communicate and write the binary content of a file. We propose the same scenario of the section above where there is a client which reads from a file and sends its content to a server, but we show how to deal with binary files. The full code of the example may be consulted [at this link](https://github.com/jolie/examples/tree/master/Tutorials/using-files/communicating-raw-files). The interface of the server changes as it follows:

```jolie
type SetFileRequest: void {
    .content: raw
}

interface ServerInterface {
    RequestResponse:
        setFile( SetFileRequest )( void )
}
```

Note that the request type of operation `setFile` has a subnode called `.content` whose native type is set to `raw`. `raw` is the native typed used in jolie messages for sending binaries. Let us now see how the client works:

```jolie
include "ServerInterface.iol"
include "file.iol"

outputPort Server {
    Location: "socket://localhost:9000"
    Protocol: sodep
    Interfaces: ServerInterface
}

main {
    with( f ) {
        .filename = "source.pdf";
        .format = "binary"
    }
    readFile@File( f )( rq.content )
    setFile@Server( rq )()
}
```

Note that the approach is the same of that we used for string contents with the difference that we specify also the parameter `format="binary"` for the operation `readFile@File`. Such a parameter enables jolie to intepreting the content of the file as a stream fo bytes which are represented as the native type `raw`. It is worth noting that the content of the reading is directly stored into the variable `rq.content`, this is why we just send variable `rq` with operation `setFile`.

On the server side the code is:

```jolie
include "ServerInterface.iol"
include "file.iol"

execution{ concurrent }

inputPort Server {
    Location: "socket://localhost:9000"
    Protocol: sodep
    Interfaces: ServerInterface
}

constants {
    FILENAME = "received.pdf"
}

main {
    setFile( request )( response ) {
        with( rq_w ) {
            .filename = FILENAME;
            .content = request.content;
            .format = "binary"
        }
        writeFile@File( rq_w )()
    }
}
```

Also in this case we enable the usage of binaries setting the parameter `format="binary"` for operation `writeFile`. Note that in this example the file read is a pdf file.

