# Communication

Communication ports define how to enable communications with other microservices. There are two kinds of [ports](./ports.html):

* input ports
* output ports

Input ports deal with exposing input operations to other microservices. Output ports define how to invoke the operations of other microservices. Ports allow Jolie programmers to combine communication media \([sockets](../../locations/socket.html), [localsockets](../../locations/localsocket.html), [bluetooth](../../locations/btl2cap.html)\) and data formats \([http](../../protocols/http.html), [https](../../protocols/ssl/https.html), [soap](../../protocols/ssl/soap.html)\), which is the concrete binding information between the communicating microservices.

In addition to the concrete binding, Jolie ports include [interfaces](../interfaces/) to express [data type]('../interfaces/data_types.html) information for each operation supported by a given port.

