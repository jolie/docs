from .FaxInterface import FaxRequest
from .PrinterInterface import PrintRequest

type FaxAndPrintRequest {
	fax: FaxRequest
	print: PrintRequest
}

interface AggregatorInterface {
	RequestResponse:
		faxAndPrint( FaxAndPrintRequest )( void ) throws Aborted
}
