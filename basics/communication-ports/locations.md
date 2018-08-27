# Locations

A location expresses the communication medium, along with its configuration parameters, a service uses for exposing its interface \(input port\) or invoking another service \(output port\).

A location must indicate the communication medium the port has to use and its related parameters in this form: `medium[:parameters]`, where _medium_ is a medium identifier and the optional _parameters_ is a medium-specific string.

Jolie currently supports four media:

* `socket` \(TCP/IP sockets\).
* `btl2cap` \(Bluetooth L2CAP\);
* `rmi` \(Java RMI\);
* `localsocket` \(Unix local sockets\);

An example of a valid location is: `"socket://www.mysite.com:80/"`, where `socket://` is the location medium and the following part represents its parameters.

For a thorough description of the locations supported by Jolie and their parameters see [Locations](https://github.com/jolie/docs/tree/24acbcbc99f476d137eac12e1f9766e2f30e3fff/docs/locations/introduction/README.md) section.

