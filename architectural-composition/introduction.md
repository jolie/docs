# Introduction

In the Basics section we have shown how a behaviour can compose other behaviours abstracting from its deployment. In Architectural Composition section we show how composition can be obtained from the opposite perspective.

_Architectural composition_ is a different kind of composition that a deployment definition can obtain abstracting from the specific behavioural definitions of the involved services.

Architectural composition can be roughly divided in two main categories.

The first deals with structuring the execution contexts in which services operate. For instance, a service may execute other sub-services in the same execution engine in order to gain advantages in terms of resource control. Other examples can be _wrapping_ and _hiding_ an entity in a microservice architecture.

The second category deals with the topology of the connections between services in a microservice architecture.

Jolie supports mechanisms for both categories, whose main representatives are introduced in this section.

