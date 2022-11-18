# Playing with the input ports

In a Jolie service it is possible to define more than one input port depending on the different needs.
As an example, it is possible to expose the same operations using different protocols, or it is possible to differentiate
the available operations on different input ports because they serve different needs.

In this tutorial we show:

* how to expose the operations of a service with sodep
* how to expose the operations of a service with http/json
* how to expose the operations of a service with soap
* how to expose the operations of a service with sodep, http/json and soap concurrently
* how to differentiate the exposed operations on different input ports
* how to recursively call the operations of a service

# The sample service

First of all, let us design a sample service we will use in the following sections.
The sample code can be found [here](). This is a simple service which supplies three operations
for accessing some data from a database of accounts (simulated by a json file).
