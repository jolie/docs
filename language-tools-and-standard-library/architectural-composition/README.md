# Architectural Programming

In the section "Basics" we have shown how programming the behaviour of a service. In Architectural Programming section we will show how Jolie enables architectural composition through the usage of linguistic primitives.

_Architectural Programming_ can be roughly divided in two main categories.

* **programming the execution contexts**: a service may execute services in the same execution engine in order to gain advantages in terms of resource control. The linguistic primitive which allows the programming of execution contexts is the _embedding_
* **programming the communication topology**: it allows for the programming of the connections between services in a microservice architecture. The primitives which allows for programming the communication topology are: _aggregation_, _redirection_, _collection_ and _couriers_.

