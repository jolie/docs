# Java Client
The creation of a Java Client allows for an easy integration with an existing Jolie service from a Java application by simply using the sodep protocol. In this case you don't need to introduce a rest interface over a http protocol, or a SOAP communication layer, you can just explott the easiest way offered by Jolie for building a service: the protocol [SODEP](../../protocols/sodep.md).

In the following picture we briefly represent how the final architecture of the Jolie Client appears.

![](../.gitbook/assets/jolie_client.png)

The Java client for a Jolie service can be automatically built starting from a Jolie outputPort declaration. In particular, the client takes the form of a package of classes where all the Jolie types declared in the interfaces used at the input port, are converted into classes in Java. Moreover, all the Jolie interfaces available at the given port are converted into one Java interface. An implementation of the Java interface is provided in order to easily call the Jolie service by exploiting the Jolie Java client.

##jolie2java









