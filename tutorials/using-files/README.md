# Using files
Using files in jolie is very simple. There standard library [`file.iol`](https://jolielang.gitbook.io/docs/standard-library-api/file) provides a set of useful operations formanaging files. In this tutorial we show how to read and write from/to a file and how to send the content of a file from a service to another.

## Reading a file
In this simple example, whose code can be checked [at this link](https://github.com/jolie/examples/tree/master/Tutorials/using-files/reading-a-file), we show how to read the content of a file and print out it on the console. In the following we present a jolie script which reads from file `test.txt` and prints its content on the console using `println@Console`.

```
include "file.iol"
include "console.iol"

main {
    request.filename = "test.txt"
    readFile@File( request )( response )
    println@Console( response )()
}
```
Note that it is important to include `file.iol` service from the standard library, then it is sufficient to use operation `readFile@File` for reading from the file. The operation `readFile@File` requires the filename. The content is then stored into variable `response` and it can be easily printed out using `println@Console`.
