# Communication

Communication ports define how to enable communications with other microservices. There are two kinds of [ports](../communication-ports/README.md):

* input ports
* output ports

Input ports deal with exposing input operations to other microservices. Output ports define how to invoke the operations of other microservices. Ports allow Jolie programmers to combine communication media \([sockets](../../locations/socket.md), [localsockets](../../locations/localsocket.md), [bluetooth](../../standard-library-api/bluetooth.md)\) and data formats \([http](../../protocols/http.md), [https](../../protocols/ssl/https.md), [soap](../../protocols/soap.md)\), which is the concrete binding information between the communicating microservices.

In addition to the concrete binding, Jolie ports include [interfaces](../interfaces/README.md) to express [data type](../interfaces/data_types.md) information for each operation supported by a given port.
