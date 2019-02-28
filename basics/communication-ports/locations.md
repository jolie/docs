# Locations

A location expresses the communication medium and the address a service uses for exposing its interface \(input port\) or invoking another service \(output port\).

A location must indicate the communication medium the port has to use and its related parameters in this form: `medium[:parameters]`
where _medium_ is a medium identifier and the optional _parameters_ is a medium-specific string. Usually the medium parameters define the address where the service is actually located.

Jolie currently supports four media:

* `socket` \(TCP/IP sockets\).
* `btl2cap` \(Bluetooth L2CAP\);
* `rmi` \(Java RMI\);
* `localsocket` \(Unix local sockets\);

An example of a valid location is: `"socket://www.mysite.com:80/"`, where `socket://` is the location medium and the following part represents the address.

For a thorough description of the locations supported by Jolie and their parameters see [Locations](https://jolielang.gitbook.io/docs/locations/introduction) section.

