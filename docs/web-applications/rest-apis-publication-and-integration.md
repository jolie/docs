# REST APIs, Publication and Integration

_ATTENTION: This page is under construction_

This page comprises some of the main configuration parameters for the [HTTP protocol](https://jolielang.gitbook.io/docs/protocols/http) useful to create, structure, and interact with REST APIs. For a more comprehensive reference on HTTP protocol, its configuration parameters, and its best practices, please refer to [Process-aware web programming with Jolie](https://arxiv.org/pdf/1410.3712).

## HTTP Methods

_section under construction, please for the moment refer to page_ [_HTTP GET/POST Requests_](web_get_post.md) _for examples on how to use basic GET/POST HTTP methods_

## From REST Resources to Jolie Operations

Many REST API providers give access to their resources via a complex URL structure. Assuming that we want to evoke the operation sum that is accessible at the following address `http://localhost:8000/operation/v1/sum` we know that the operation sum it is expressed by the Jolie interface and the path will be expressed at port level by setting an `alias` in the following way

```jolie
type SumRequest:void {
 .x:int
 .y:int
}

interface SumInterface {
 RequestResponse: sum(SumRequest)(int)
}

outputPort SumService {
 Location: "socket://localhost:8000/"
 Protocol: http {
     .method = "post"
   .osc.sum.alias = "operations/v1/sum"
}
 Interfaces: SumInterface
}

main
{
 request.x = 4;
 request.y = 2;
 sum@SumService( request )( response );
 println@Console( response )()
}
```

In a similar way we can use as alias to pass a variable parameter to GET operation let us assume that we want to access a specific user information with the following information

```jolie
type UserRequest:void {
    .idAuth0:string
}

interface Auth0Interface {
 RequestResponse: user (SumRequest)(int)
}

outputPort SumService {
 Location: "socket://localhost:8000/"
 Protocol: http {
     .method = "get"
   .osc.user.alias = "api/v2/users/%!{idAuth0}";
}
 Interfaces:Auth0Interface
}

main
{

 request.idAuth0 = "dsadasrdfgrafdfas";
 user@SumService( request )( response );
 println@Console( response )()
}
```

Using `%!{}` to mark the name of the variable that set to the value desired.

## Web Servers and CRUD

_In this section we explain how to use the_ `default` _parameter to capture any REST request and how to extract the request data in a microservice behaviour._

## Integrating HTTP Cookies with Jolie Sessions

_In this section we show how to integrate HTTP cookie-based sessions with Jolie_ [_correlation-based sessions_](https://jolielang.gitbook.io/docs/basics/sessions)_._

