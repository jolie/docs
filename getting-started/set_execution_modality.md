# Setting the execution modality

We are sure you noticed that in the example reported in [Creating a Service and a Client](https://github.com/jolie/docs/tree/4450f345d4069d83018ef809256a1085ad4f8928/getting-started/creating-a-service-and-a-client/README.md) the service stops after serving the first request of the client. Thus, you need to re-launch the service in order to be able to invoke it more times.

In Jolie it is possible to enable a service to process multiple requests by simply defining the execution modality. Setting th eexecution modality to `concurrent` will allow the service to process all the incoming requests concurrently.

```jolie
execution { concurrent }
```

The Twice service of the cited example now becomes:

## Server's code

```jolie
execution { concurrent }

inputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    RequestResponse: twice
}

main
{
    twice( number )( result ) {
        result = number * 2
    }
}
```

In this way you can invoke it more than once from different clients.

