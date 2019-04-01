# Architectural Programming

# Introduction

In the Basics section we have shown how a behaviour can compose other behaviours abstracting from its deployment. In Architectural Programming section we show how Jolie enables architectural composition through the usage of linguistic primitives.

_Architectural Programming_ can be roughly divided in two main categories.

* structuring of the execution contexts. For instance, a service may execute other sub-services in the same execution engine in order to gain advantages in terms of resource control. Other examples can be _wrapping_ and _hiding_ an entity in a microservice architecture.

* programming of the communication topology: it allows for the programming of the connections between services in a microservice architecture.

Jolie supports mechanisms for both categories, whose main representatives are introduced in this section.



