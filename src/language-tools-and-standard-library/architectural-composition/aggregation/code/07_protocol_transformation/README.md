# Protocol Transformation

In this example we show how aggregation also provides protocol conversion.
The input port of the aggregator is set to receive messages in protocol sodep, whereas
services fax and printer receives in protocols http/SOAP and http/JSON respectively.
The aggregator automatically converts the messages.

To start the example, launch the following commands (in order) in separate shells.

- jolie printer.ol
- jolie fax.ol
- jolie aggregator.ol
- jolie client.ol

Try again without running fax.ol

*Note* that you can enable debug property into protocol definition of the ports in order to see
the http exchanged messages.
