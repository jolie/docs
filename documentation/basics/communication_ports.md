## Communication Ports

Communication ports define how communications with other microservices are supported. 
There are two kinds of [ports](communication_ports/ports.md). 
Input ports deal with exposing input operations to other microservices. 
Output ports define how to invoke the operations of other microservices. 
Ports allow Jolie programmers to combine communication media ([sockets](locations/socket.md), [localsockets](locations/localsockets.md), [bluetooth](locations/bluetooth.md)) and data formats ([http](protocols/http.md), [https](protocols/https.md), [soap](protocols/soap.md)), which is the concrete binding information between the communicating microservices. 

In addition to the concrete binding, Jolie ports include [interfaces](communication_ports/interfaces.md) to express [data type](communication_ports/data_types.md) information for each operation supported by a given port.