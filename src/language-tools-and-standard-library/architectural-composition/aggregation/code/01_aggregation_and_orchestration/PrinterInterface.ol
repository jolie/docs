type JobID {
	jobId: string
}

type PrintRequest {
	content: string
}

type PrintResponse: JobID

interface PrinterInterface {
RequestResponse:
	print( PrintRequest )( PrintResponse ),
OneWay:
	del( JobID )
}
