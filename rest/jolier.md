# jolier
`jolier` is a tool distributed with jolie which permits to easily deploy a jolie microservice as a REST service. jolier requires three parameters to work together with two other optional parameters. Morevoer, it requires a mapping file called _rest_template.json_ to be read at the boot for creating the mapping between the rest calls and the target operations. If you type the command in a shell without any argument, the following message will be prompt to the console:
```
Usage: jolier <service_filename> <input_port> <router_host> [-easyInterface] [-debug]
```

The required parameters are:
* **service_filename**: it is the path to the target service to be executed as a REST service;
* **input_port**: it is the input port of the target service which must be exposted as a REST service. It is important to note that the location of the target port must be set to **`"local"`**;
* **router_host**: it is the location where _jester_ will listen for incoming requests;
* **[-easyInterface]**: it specifies if skipping the _rest_template.json_ file and creating a standard map of the target operations. See the section below for details;
* **[-debug]**: it enables debug messages for _jester_ in order to facilitate error identification.

## Defining the rest calls mapping
The mapping of the rest templates is defined within file `rest_templates.json`. It is a json file structured as key value map, where the key reports the name of the target operation whereas the value reports the related call information to be used in the rest call. Here we presen an example of a key value pair:

```
{
    "getOrders":"method=get, template=/orders/{userId}?maxItems={maxItems}"
}
```
`getOrders` is the name of the target operation in the jolie service, whereas `"method=get, template=/orders/{userId}?maxItems={maxItems}"` contains the information for mappin the rest call. In particular, there are two information: `method` and `template`. `method` defines the http method to be used in the rest call (post, get, put or delete) whereas `template` defines how to place the request data within the url path.

In the example above, the operation `getOrders` of the target service will be invoked using a method `get` and finding the parameters `userId` and `maxItems` within the url. The parameter `userId` will be placed as part of the path, whereas the parameter `maxItems` as a parameter of the query.

It is worth noting that when we define a rest mapping, some restrictions to the target message types must be considered.

## Restrictions on rest calls mapping
* when method `get` is specified, all the parameters of the request must be specified within the url. Thus the target request message type cannot have structured type defined, but it can only be defined as a flat list of nodes. As an example the follwong type is sound with the template above: 
```
type GetOrdersType: void {
    .userId: string
    .maxItems: int
} 
```
whereas the following one is not correct w.r.t. template `/orders/{userId}?maxItems={maxItems}`
```
type GetOrdersType: void {
    .userId: string {
        .maxItems: int
   }
}
```
* when `template` is not defined, the request will be completely read from the body of the message which must match the stype structure of the target operation
* in case of methods `post`, `put` and `delete` it is possible to place part of the parameters inside the url and the rest of them in the body. In this case the request type of the target operation must contain all of them and they must be defined as a list of flat nodes.

## The parameter -easyInterface
When defined, the rest call mapping file is not necessary but all the operations will be converted into methods post and the request types will be reported in the body as they are defined in the target jolie interface.

## Example
At this [link](https://github.com/jolie/examples/tree/master/05_other_tools/03_jolier) it is possible to find a simple jolie service which can be deployed as a rest service. As it is possible to note, the jolie service called, `demo.ol` is a standard jolie service without any particular change or addition. It has an input port called `DEMO` where the interface `DemoInterface` is available. Four operations are defined in the interface: `getOrders`, `getOrdersByIItem`, `putOrder` and `deleteOrder`.

```
{
    "getOrders":"method=get, template=/orders/{userId}?maxItems={maxItems}",
    "getOrdersByIItem":"method=post",
    "putOrder":"method=put",
    "deleteOrder":"method=delete"
}
```

