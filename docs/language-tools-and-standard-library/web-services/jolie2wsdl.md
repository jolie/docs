# jolie2wsdl

Jolie2wsdl is the counterpart of [wsdl2jolie](https://jolielang.gitbook.io/docs/web-services/wsdl2jolie) tool. It supports the creation of a WSDL document starting from a Jolie Interface.

## The syntax

The syntax of jolie2wsdl follows:

```jolie
jolie2wsdl [ -i include_file_path ] --namespace [target_name_space] --portName [name_of_the_port] --portAddr [address_string] --outputFile [output_filename]  filename.ol
```

where:

* `-i include_file_path` must be set if the jolie service includes `.iol` files belonging to Jolie standard library \(e.g., `console.iol`\). For example this path, in a Linux environment, is `/opt/jolie/include`;
* `--namespace target_name_space` name of WSDL namespace used by jolie types
* `--portName name_of_the_port` name of the port that is exposing the inferface callable via SOAP
* `--portNane name_of_the_port` address of the listening port 
* `--outputFile output_filename` is the file name  where the generated WSDL document is stored \(`MyWsdl.wsdl` is the default value\).
* `filename.ol` is the jolie service file whose input port must be transformed into a soap one

## Jolie interface guidelines

When programming a Jolie interface to be transformed into a WSDL document, its recommended to follow these guidelines:

Native types in operation declaration are not permitted. For example, the following declaration is forbidden:

```jolie
interface MyInterface {
    RequestResponse:
        myOp( string )( int )
}
```

All complex types must have a void value in the root. Hence, the following declaration are not permitted:

```jolie
type Type1: int {
    .msg: string
}

type Type2: string {
    .msg: string
}

interface MyInterface {
    myOp( Type1 )( Type2 )
}
```

Thus, the right types and interface declaration for our example may be:

```jolie
type Type1: void {
    .msg: int
}

type Type2: void {
    .msg: string
}

interface MyInterface {
    RequestResponse:
        myOp( Type1 )( Type2 )
}
```

