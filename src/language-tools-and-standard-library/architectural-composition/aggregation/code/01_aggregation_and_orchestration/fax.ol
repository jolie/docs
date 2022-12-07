from .FaxInterface import FaxInterface
from console import Console

service Fax {
	execution: concurrent

	embed Console as Console

	inputPort FaxInput {
		location: "socket://localhost:9001"
		protocol: sodep
		interfaces: FaxInterface
	}

	main
	{
		fax( request )() {
				println@Console( "Faxing to " + request.destination + ". Content: " + request.content )()
		}
	}
}
