# jolier
`jolier` is a tool distributed with jolie which permits to easily deploy a jolie microservice as a REST service. jolier requires three parameters to work together with two other optional parameters. Morevoer, it requires a mapping file called _rest_template.json_ to be read at the boot for creating the mapping between the rest templates and the target operations. If you type the command in a shell without any argument, the following message will be prompt to the console:
```
Usage: jolier <service_filename> <input_port> <router_host> [-easyInterface] [-debug]
```

The required parameters are:
* **service_filename**: it is the path to the target service to be executed as a REST service
* **input_port**: it is the input port of the target service which must be exposted as a REST service
* **router_host**: it is the location where _jester_ will listen for incoming requests
* **[-easyInterface]**: it specifies if skipping the _rest_template.json_ file and creating a standard map of the target operations
* **[-debug]**: it enables debug messages for _jester_ in order to facilitate error identification

