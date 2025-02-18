# Building a file uplaoder service
This documentation describes the functionality of a Jolie service that allows implementing a file upload service via console. The service is configured to receive HTTP requests containing files and their filenames, saving the content as a binary file.

The code of the service follows:

```jolie
from console import Console
from file import File


type TestRequest {
    file: raw
    fname: string
  
}


interface MyInterface {
  RequestResponse:
    test( TestRequest )( void )
}

service MyService ( ) {

  embed Console as Console
  embed File as File

  execution: concurrent

  inputPort TestFileUpload {
      location: "socket://localhost:9000"
      protocol: http {
        osc.test.multipartHeaders.file.filename = "fname"
      }
      interfaces: MyInterface
  } 
  main {
    test( request )( response ) {
      println@Console( "filename " + request.fname )()
      

      wr << { 
        filename = request.fname
        content << request.file
        format = "binary"
      }
      writeFile@File( wr )()
    }
  } 

}

```



## The inputPort `TestFileUpload`

```jolie
inputPort TestFileUpload {
    location: "socket://localhost:9000"
    protocol: http {
        osc.test.multipartHeaders.file.filename = "fname"
    }
    interfaces: MyInterface
} 
```
The `TestFileUpload` inputPort is configured to listen for HTTP requests on port 9000 of the localhost. The HTTP protocol configuration specifies that the multipart header of the file should use the fname field as the filename. Thus the filename will be saved into node `fname`.
In `MyInterface` is defined the operation where the file will be received `test`.

## The request type

```jolie
type TestRequest {
    file: raw
    fname: string 
}
```
The `TestRequest`` type represents the structure of the upload request. It contains two fields:

- __file__: the raw content of the file.
- __fname__: the name of the file.

## main

```jolie
main {
    test( request )( response ) {
        println@Console( "filename " + request.fname )()

        wr << { 
            filename = request.fname
            content << request.file
            format = "binary"
        }
        writeFile@File( wr )()
    }
} 
```

The main scope implements the service logic. When a test request is received:

- It prints the filename to the console.
- Prepares a `wr` value with the filename, file content, and format set to binary.
- Writes the file content to the filesystem using the writeFile function from the File library.

## curl example
A culr example invocation is:

```
curl --trace - -F "file=@./micro.png;filename=micro.png"  http://localhost:9000/test
```