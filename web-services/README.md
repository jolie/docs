# Web Services
Web Services represent a special category of services. They are characterized by the usage of a set of specific XML based technologies like WSDL and SOAP. A Jolie service can both invoke existing web services and being exposed as a Web Service. It is very easy to do so, it is sufficient to parameterized a Jolie port (input or output) to use the protocol [soap](../protocols/soap.md) or the protocol soaps.

![](../.gitbook/assets/webservices.png)

## Exposing a web service
In order to show how to expose a jolie service as a web service, let us consider the following Jolie service example which returns the address of a person identified by his name and his surname:

```text
include "console.iol"
include "string_utils.iol"

execution{ concurrent }

type Name: void {
    .name: string
    .surname: string
}

type FaultType: void {
    .person: Name
}

type GetAddressRequest: void {
    .person: Name
}

type Address: void {
    .country: string
    .city: string
    .zip_code: string
    .street: string
    .number: string
}

type GetAddressResponse: void {
    .address: Address
}

interface MyServiceInterface {
RequestResponse:
    getAddress( GetAddressRequest )( GetAddressResponse ) 
        throws NameDoesNotExist( FaultType )
}

inputPort MyServiceSOAPPort {
    Location: "socket://localhost:8001"
    Protocol: soap {
        .wsdl = "./MyWsdlDocument.wsdl";
        .wsdl.port = "MyServiceSOAPPortServicePort"
    }
    Interfaces: MyServiceInterface
}

main {
    getAddress( request )( response ) {
        if (  request.person.name == "Homer" &&
            request.person.surname == "Simpsons" ) {
            with( response.address ) {
                .country = "USA";
                .city = "Springfield";
                .zip_code = "01101";
                .street = "Evergreen Terrace";
                .number = "742"
            }
        } else {
            with( fault.person ) {
                .name = request.person.name;
                .surname = request.person.surname
            };
            throw( NameDoesNotExist, fault )
        }
    }
}
```
where the in the input port `MyServiceSOAPPort` we use protocol `soap`. Note that as protocol parameters we specify `.wsdl` adn `.wsdl.port` where the former defines the wsdl file to be used for interpreting the incoming soap messages, and the latter specifies the port inside the wsdl file to be joint to the jolie one. 






