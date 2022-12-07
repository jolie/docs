/* Aggregator */
from .PrinterInterface import PrinterInterface
from .FaxInterface import FaxInterface
from .AggregatorInterface import AggregatorInterface
from console import Console

service Aggregator {

	embed Console as Console

	execution: concurrent

	/* this outputPort points to service Printer */
	outputPort Printer {
		location: "socket://localhost:9000"
		protocol: http { .fomat = "json"; .debug=false }
		interfaces: PrinterInterface
	}

	/* this outputPort points to the service Fax */
	outputPort Fax {
		location: "socket://localhost:9001"
		protocol: soap { .wsdl = "fax.wsdl"; .debug=false }
		interfaces: FaxInterface
	}

	/* this is the inputPort of the Aggregation service */
	inputPort Aggregator {
		location: "socket://localhost:9002"
		protocol: sodep
		/* the service Aggregator does not only aggregates other services, but it also provides its own operations */
		interfaces: AggregatorInterface
		/* Printer and Fax outputPorts are aggregated here. All the messages for their operations
		will be forwarded to them */
		aggregates: Printer, Fax
	}

	init
	{
		println@Console( "Aggregator started" )()
		install( Aborted => nullProcess )
	}

	main
	{
		/* this is the implementation of the operation declared in interface AggregatorInterface.
		the operation implements a composed invocation of the operations of Printer and Fax
		*/
		faxAndPrint( request )( response ) {
			scope( fax_and_print ) {
						install( IOException => comp( print ); throw( Aborted ) );
						{

								scope( fax ) {
										println@Console("Faxing document to " + request.fax.destination )();
										fax@Fax( request.fax )()
								}
								|
								scope( print ) {
										println@Console("Printing document " + request.print.content )();
										print@Printer( request.print )( del_request )
										[
													/* termination handler installed after the request message is sent */
													this => del@Printer( del_request );
													println@Console("Rolling back printing..." )();
													println@Console("Deleted job " + del_request.jobId )()
										]
								}
						}
				}

		}
	}
}
