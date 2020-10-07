# openapi2jolie

## openapi2jolie

This tool generates a Jolie client starting from an openapi 2.0 definition. The generated client can be embedded or exposed as a service to be invoked by other jolie services using sodep protocol. The usage of the tool follows:

```text
Usage: openapi2jolie <url|filepath> <service_name> <output_folder> <protocol http|https>
```

where:

* **url\|filepath**: it defines the url or the filepath of the openapi specification to convert.
* **service\_name**: it is the name of the service client to be generated
* **output\_folder**: it is the output folder where storing the generated client
* **http\|https**: it defines the protocol to use for preparing the client

As a result the tool generates two files:

* `<service_name>Client.ol`: it is the actual client to be embedded or exposed as a jolie service
* `<service_name>Interface.iol`: it is the jolie interface obtained from the conversion

## Example

In order to show how the tool `openapi2jolie` works, let us try to generate a client for the PetStore example released by the Swagger community which can be found [here](https://petstore.swagger.io/v2/swagger.json). Run the `openapi2jolie` tool as it follows:

```text
openapi2jolie https://petstore.swagger.io/v2/swagger.json SwaggerPetStore . https
```

two files are generated:

* `SwaggerPetStoreClient.ol`
* `SwaggerPetStoreInterface.iol`

The client can be now embedded in a jolie service for invoking the rest service described the openapi at url `https://petstore.swagger.io/v2/swagger.json`. Here in the following we report a jolie script which invokes api `/user/{username}`

```jolie
include "SwaggerPetStoreInterface.iol" 
include "string_utils.iol"
include "console.iol"

outputPort SwaggerPetStoreClient {
    Location: "local"
    Protocol: sodep
    Interfaces: SwaggerPetStoreInterface
}

embedded {
    Jolie:
    "SwaggerPetStoreClient.ol" in SwaggerPetStoreClient
}

main {
    request.username = "user2"
    getUserByName@SwaggerPetStoreClient( request )( response )
    valueToPrettyString@StringUtils( response )( s )
    print@Console( s )(  )
}
```

