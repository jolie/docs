# Introduction

Communication ports define how communications with other microservices are supported. There are two kinds of [ports](../communication_ports/ports/). Input ports deal with exposing input operations to other microservices. Output ports define how to invoke the operations of other microservices. Ports allow Jolie programmers to combine communication media \([sockets](../locations/socket/), [localsockets](../locations/localsockets/), [bluetooth](../locations/bluetooth/)\) and data formats \([http](../protocols/http/), [https](../protocols/https/), [soap](../protocols/soap/)\), which is the concrete binding information between the communicating microservices. Communication ports define how communications with other microservices are supported. There are two kinds of [ports](../basics/communication_ports/ports/).

In addition to the concrete binding, Jolie ports include [interfaces](../basics/communication_ports/interfaces/) to express [data type](../basics/communication_ports/data_types/) information for each operation supported by a given port.

