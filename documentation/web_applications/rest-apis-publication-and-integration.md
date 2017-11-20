*ATTENTION: This page is under construction*

This page comprises some of the main configuration parameters for the [HTTP protocol](/documentation/protocols/http.html) useful to create, structure, and interact with REST APIs. For a more comprehensive reference on HTTP protocol, its configuration parameters, and its best practices, please refer to [Process-aware web programming with Jolie](https://arxiv.org/pdf/1410.3712.pdf).

## HTTP Methods

*section under construction, please for the moment refer to page [HTTP GET/POST Requests](/documentation/web_applications/web_get_post.html) for examples on how to use basic GET/POST HTTP methods*

## From REST Resources to Jolie Operations

Many REST API providers give access to their resorces via a complex url structure. Assuming that we want to evoke the operatione sum that is accessable at the following address
`http://localhost:8000/operation/v1/sum`  we know that the operation sum it is expressed by the Jolie interface and the path will be expressed at port level by setting an `alias` in the following way

<pre><code class="language-jolie code">
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
</code></pre>

In a similar way we can use as alias to pass a variable parameter to GET operation let us assume that we want to access a specific user information with the following information

<pre><code class="language-jolie code">

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
</code></pre>

Using `%!{}` to mark the name of the variable that set to the value desired.

## Web Servers and CRUD

*In this section we explain how to use the `default` parameter to capture any REST request and how to extract the request data in a microservice behaviour.*

## Integrating HTTP Cookies with Jolie Sessions

*In this section we show how to integrate HTTP cookie-based sessions with Jolie [correlation-based sessions](/documentation/basics/sessions.html).*
