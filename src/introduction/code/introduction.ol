// Some data types
type GreetRequest { name:string }
type GreetResponse { greeting:string }

// Define the API that we are going to publish
interface GreeterAPI {
    RequestResponse: greet( GreetRequest )( GreetResponse )
}

service Greeter {
    execution: concurrent // Handle clients concurrently

    // An input port publishes APIs to clients
    inputPort GreeterInput {
        location: "socket://localhost:8080" // Use TCP/IP
        protocol: http { format = "json" }    // Use HTTP
        interfaces: GreeterAPI     // Publish GreeterAPI
    }

    // Implementation (the behaviour)
    main {
        /*
        This statement receives a request for greet,
        runs the code in { ... }, and sends response
        back to the client.
        */
        greet( request )( response ) {
            response.greeting = "Hello, " + request.name
        }
    }
}
