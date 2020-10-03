# Rest Services

This section is devoted in illustrating how to create REST services with Jolie. Differently from standard Jolie services which are agnostic to protocols, in a REST approach we must take into account how the underlying HTTP protocol works. In a REST service indeed, only the four basic http methods can be used for defining actions on a service, they are: GET, POST, PUT and DELETE. The consequence of such a strong limitation on the possible actions to be used, is that the resulting programming style must provide expressiveness on data instead of verbs. Such a characteristic has the main consequence to focus the programming style to the resources: we are not free to program all the actions we would like, but we are free to program all the resources we would like.

## A Jolie router for mapping rest methods into Jolie operations

The main idea behind the creation of a REST service with Jolie is the introduction of a specific http router, called _jester_ between the caller and the Jolie service to expose as a REST service. The http router is in charge to convert all the rest calls into the corresponding Jolie operations.

![](../../.gitbook/assets/rest.png)

_jester_ is distributed together with Jolie and it is possible to use it in your projects. Details about _jester_ can be found in the section [Jester](https://github.com/jolie/docs/tree/995bf15f2ee50877e8722867c19c5c8871b48116/rest/jester.md). Here we just point out that _jester_ requires a mapping between the operation of the target services and the http methods to expose together with the resource templates.

```text
target operation ---> http method, rest resource template
```

Such a kind of mapping must be provided to _jester_ in the form of a json file. In the section [jolier](https://github.com/jolie/docs/tree/995bf15f2ee50877e8722867c19c5c8871b48116/rest/jolier.md) we will explain how to correctly define a mapping file for _jester_.

## The tools for enabling the deployment of a Jolie service as a REST service

In the following sections we will show how some tools which come together with the jolie installation can facilitate the deployment of a jolie service as a REST service. The tools are:

* **jolier**: like the command `jolie`, `jolier` automatically executes a jolie service as a REST service transparently embedding _jester_
* **jolie2openapi**: it generates an [openapi](https://swagger.io/docs/specification/about/) definition of a jolie interface
* **openapi2jolie**: it generates a jolie client which enable to invoking a rest service described by an openapi definition 

