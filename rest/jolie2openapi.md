# jolie2openapi
`jolie2openapi` is a tool which converts a jolie interface into an [openapi 2.0 specification](https://swagger.io/docs/specification/2-0/basic-structure/) also knwon as Swagger. Such a tool can be used together with [jolier](jolier.md) for deploying a jolie service as a Rest service. In particular, the tool can be used for obtaining the openapi spceification to distribute.

The tool can be used as it follows:
```
Usage: jolie2openapi <service_filename> <input_port> <router_host> <output_folder> [easy_interface true|false]
```
where:
* **service_filename**:	it is the filename of the jolie service from which the interface must be extracted
* **input_port**:	it is the name of the input port whose interfaces must be converted
* **router_host**:	it is the url of the host to be contacted for using rest apis: This information will be inserted directly into the resulting openapi specification
* **output_folder**:	it is the output folder where storing the resulting json file
* **[easy_interface true|false]**:	 if true no templates will be exploited for generating the json file, the mapping will be automaticallty generated assuming all the operations mapped on method post. Default is false. 

As it happens for the tool [jolier](jolier.md), also the tool `jolie2openapi` requires to read rest calls mapping from an external file. The name of the mapping file is the same and it is `rest_templates.json`, its configuration rules can be consulted at the [related section of the tool jolier](https://jolielang.gitbook.io/docs/rest/jolier#defining-the-rest-calls-mapping)


