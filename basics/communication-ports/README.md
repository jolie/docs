# Communication

Communication ports define how to enable communications with other microservices. There are two kinds of [ports](https://jolielang.gitbook.io/docs/basics/communication-ports/ports):

* input ports
* output ports

Input ports deal with exposing input operations to other microservices. Output ports define how to invoke the operations of other microservices. Ports allow Jolie programmers to combine communication media \([sockets](https://jolielang.gitbook.io/docs/locations/socket), [localsockets](https://jolielang.gitbook.io/docs/locations/localsocket), [bluetooth](https://jolielang.gitbook.io/docs/locations/btl2cap)\) and data formats \([http](https://jolielang.gitbook.io/docs/protocols/http), [https](https://jolielang.gitbook.io/docs/protocols/https), [soap](https://jolielang.gitbook.io/docs/protocols/soap)\), which is the concrete binding information between the communicating microservices.

In addition to the concrete binding, Jolie ports include [interfaces](https://jolielang.gitbook.io/docs/basics/communication-ports/interfaces) to express [data type](https://jolielang.gitbook.io/docs/basics/communication-ports/data_types) information for each operation supported by a given port.

