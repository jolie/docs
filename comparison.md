# What makes a technology microservice oriented? 

When approaching a new programming language or framework that claims to be working within a new programming paradigm one should approach this claim with extreme care. The same level of care should also be shown when approaching a (micro)services technology; we all know one of the "mantra" of MSA is that they should be technology independent, but ask yourself would you drill holes in a concrete wall with a penknife?

So what things one should look in a (micro)service-oriented language; a good starting point could be: is your technology able to define clearly the following trademark elements (micro)service paradigm.

* Interface: Interfaces are an essential part of (micro)service-oriented architecture they determine what the service does. They are not only a logical abstraction; they are the way service producers can transfer functional knowledge to any client. In this way do not need to know anything about the (micro)service implementation they can consume the interface and be ready to evoke any of the service operations

* Operation: One may be tempted to consider an operation as an object method or a function, as well if the share some concept like the definition of a method/function/operation signature, they differ on the fact that a client can call an operation without sharing any artefacts with the server. In the same way, the server should be able to process the request without any knowledge of the client's nature.

* Messages/Type: The messages contain all the information data used by the operations, in terms of the payload content sent or received by any specific operation. Messages are the only way the client and server should exchange data; the handling of the message content should be independent of the protocol used to free the programmer to know details about a specific. Any credible service-oriented language should have some built-in message check to free the programmer from developing extra code to check the validity of the sent or received messages.     

* Port: So far we have talked about some general logical aspect of (micro)services programming, The concept of port binds together all functional elements with the deployment aspect of the service. This separation should be evident also in the coding of our services, the development of the behaviour should be agnostic from deployment issues 

* Binding: In a microservice based should be able to express the binding between Interfaces and ports easily. Any change in binding should not affect the coding of the behaviour. 

* Protocol: The protocol express how the message is sent not what message contains, by saying that a microservices technology should be protocol agnostic, the logic on how the message is constructed or processed should be not affected if the protocol changes

## NodeJs
NodeJs is accredited to be a "microservice" technology based on the fact that can "construct non-blocking, event-driven I/O software", so the question comes natural, so if I implement an event-driven software in C++ does it make C++ a microservice language? 
We don't think so, in the same way, C was not a OO language as well if you could design OO artefacts.

### Interface or lack of it

ECMAScript/NodeJS does not contemplate the possibility to define an interface this has some considerable on how we code our service let's start with a simple example in Jolie 
'''
interface MySimple {
 RequestResponse:
  myOp(MyOpRequest)(MyOpResponse)
}  
'''
Now let's look how  
