from .FaxInterface import FaxInterface
from .PrinterInterface import PrinterInterface
from .AggregatorInterface import AggregatorInterface
from console import Console


service Client {

	embed Console as Console

	/* the client calls the inputPort of the aggregator where it can invokes also the operations
	of service Printer and the service Fax */
	outputPort Aggregator {
		location: "socket://localhost:9002"
		protocol: sodep
		/* note that here we define all the interfaces available at the inputPort Aggregator.
		a unique interface can be defined, see next example where the tool jolie2surface is used */
		interfaces: AggregatorInterface, PrinterInterface, FaxInterface
	}

	main
	{
		/* here we call the operation of the service Printer */
		println@Console("single call to print...")()
		printRequest.content = "Hello, Printer!"
		print@Aggregator( printRequest )( jobid )
		println@Console("Printed jobid " + jobid )()

		/* here we call the operation of the service Fax */
		scope( fax ) {
			install( default => println@Console("Fax is not connected")() )
			faxRequest.destination = "123456789"
			faxRequest.content = "Hello, Fax!"
			println@Console("Faxing document...")()
			fax@Aggregator( faxRequest )()
			println@Console("Done!")()
		}

		/* here we call the operation of the service aggregator.ol */
		scope( print_and_fax ) {
			install( Aborted => println@Console("Aborted")() )
			agg_req.print -> printRequest
			agg_req.fax -> faxRequest
			println@Console("Faxing and Printing...")()
			faxAndPrint@Aggregator( agg_req )()
			println@Console("OK! ...now retry by deactivating the fax service")()
		}
	}
}
