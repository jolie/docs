# Locations

A location defines the medium on which a port sends and receive messages.

A location is always a URI in the form medium[:parameters], where medium is the medium identifier and the optional parameters is a medium-specific string

Jolie natively supports five media:

* local (Jolie in-memory communication);
* socket (TCP/IP sockets);
* btl2cap (Bluetooth L2CAP);
* rmi (Java RMI);
* localsocket (Unix local sockets).

In the following sections we explain the medium-specific properties of the locations provided by Jolie.

