# Using more input ports and protocols
In this tutorial we will show how to add more input ports in a service. In such a away, it is possible to enable the service to receive messages with different formats and protocols by using always the same behaviour.
In particular, we modify the service `AdvancedCalculatorService` of the tutorial [Using more than one dependency](https://docs.jolie-lang.org/v1.10.x/tutorials/using-more-than-one-dependency/) as depicted in the following diagram:


![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/more_inputports_and_protocols.png)

Besides the existing port for protocol `http`, Input ports will be incrementally added for the following protocols:

- [soap](https://docs.jolie-lang.org/v1.10.x/tutorials/using-more-input-ports-and-protocols/soap.md)
- sodep
- https
- soaps
- sodeps

