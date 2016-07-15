## Invoking web services

Jolie can be used to invoke web services.

Let us exemplify it by invoking the Global Weather Service, provided by [www.webservicex.net](http://www.webservicex.net), whose [WSDL](http://www.w3.org/TR/wsdl) document can be accessed at the URL [http://www.webservicex.net/globalweather.asmx?WSDL](http://www.webservicex.net/globalweather.asmx?WSDL).

## Request the service interface from the WSDL

To invoke a web service's operation, we need to create a compatible Jolie interface. To do that we exploit the tool [wsdl2jolie](web_services/wsdl2jolie.html), which is part of the Jolie trunk installation.

We run the command:

`wsdl2jolie http://www.webservicex.net/globalweather.asmx?WSDL > myWS_jolieDocument.iol`

that extracts from the WSDL a compatible Jolie interface to invoke the web service. The newly created interface is stored in myWS_jolieDocument.iol file. 

Let us open the interface file and delete its first line, which is the comment `Retrieving document at 'http://www.webservicex.net/globalweather.asmx?WSDL'.`.

## Call the web service

Once we stored the Jolie interface of the web service, we can invoke its operations by including its interface definition file in a Jolie program:

<pre class="code">
include "myWS_jolieDocument.iol"
include "string_utils.iol"
include "xml_utils.iol"
include "console.iol"

main
{
	with( request ) {
		.CityName = "Rimini";
		.CountryName = "Italy"
	};
	GetWeather@GlobalWeatherSoap( request )( response );
	r = response.GetWeatherResult;
	r.options.includeAttributes = true;
	xmlToValue@XmlUtils( r )( v );
	valueToPrettyString@StringUtils( v )( s );
	println@Console( s )()
}
</pre>

Since the web service returns a message formed by a single tag `<GetWeatherResult>`, which contains an XML document as a string, we have to exploit the `xml_utils.iol` library to transform the string into a Jolie value by means of the operation `xmlToValue`.

## Exposing web services

Jolie services can be exposed as web services as well.

Let us consider the following Jolie service which returns the address of a person identified by his name and his surname:

<pre class="code">
include "console.iol"
include "string_utils.iol"

execution{ concurrent }

type Name: void {
	.name: string
	.surname: string
}

type FaultType: void {
	.person: Name
}

type GetAddressRequest: void {
	.person: Name
}

type Address: void {
	.country: string
	.city: string
	.zip_code: string
	.street: string
	.number: string
}

type GetAddressResponse: void {
	.address: Address
}

interface MyServiceInterface {
RequestResponse:
	getAddress( GetAddressRequest )( GetAddressResponse ) 
		throws NameDoesNotExist( FaultType )
}

inputPort MyServiceSOAPPort {
	Location: "socket://localhost:8001"
	Protocol: soap
	Interfaces: MyServiceInterface
}

main {
	getAddress( request )( response ) {
		valueToPrettyString@StringUtils( request )( s );
		println@Console( "Received:" + s )();
		if (  request.person.name == "Homer" &&
			request.person.surname == "Simpsons" ) {
			with( response.address ) {
				.country = "USA";
				.city = "Springfield";
				.zip_code = "01101";
				.street = "Evergreen Terrace";
				.number = "742"
			}
		} else {
			with( fault.person ) {
				.name = request.person.name;
				.surname = request.person.surname
			};
			throw( NameDoesNotExist, fault )
		}
	}
}

</pre>

To expose the port `MyServiceSOAPPort` as a web service, we exploit the tool [jolie2wsdl](web_services/jolie2wsdl.html) that generates the corresponding WSDL document to be attached to the file:

`jolie2wsdl -i /opt/jolie/include service.ol MyServiceSOAPPort MyWsdlDocument.wsdl`

Once generated the WSDL file is to be attached within the declaration of the inputPort:

<pre class="code">
inputPort MyServiceSOAPPort {
	Location: "socket://localhost:8001"
	Protocol: soap {
		.wsdl = "./MyWsdlDocument.wsdl";
		.wsdl.port = "MyServiceSOAPPortServicePort"
	}
	Interfaces: MyServiceInterface
}
</pre>