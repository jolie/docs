type FaxRequest {
	destination: string
	content: string
}

interface FaxInterface {
RequestResponse:
	fax(FaxRequest)(void)
}
