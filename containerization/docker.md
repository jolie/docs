# Docker
[Docker](https://www.docker.com/) is a containerization technology. This section is devoted to show how deploy a Jolie microservice inside a Docker container.
Basically, the only thing to do is to create a __Dockerfile__ which allows for creating a Docker image that can be used for generating containers.

Before starting to show how to deploy a jolie microservice within a container docker, it is important to know that there is a Docker image which provides a container where Jolie is installed. Such an image can be found [at this link on dockerhub](https://hub.docker.com/r/jolielang/jolie). Such an image will be used in the following as base layer for deploying jolie services.

## Deploying a jolie service in a container Docker
Let us now consider an example of a very simple jolie service to be deployed into a docker container, the `helloservice.ol`:

```
interface HelloInterface {

RequestResponse:
     hello( string )( string )
}

execution{ concurrent }


inputPort Hello {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: HelloInterface
}

main {
  hello( request )( response ) {
        response = request
  }
}
```
The complete code of this example can be found [at this link](https://github.com/jolie/examples/tree/master/06_containers/01_deployment_with_docker).

## Creating a docker image
In order to create a docker image of this microservice, it is necessary to wrte down a Dockerfile. Thus, just open a text file in the same folder and name it __Dockerfile__. Then, edit it with ascript like the following one:

```
FROM jolielang/jolie
MAINTAINER YOUR NAME <YOUR EMAIL> 
EXPOSE 8000
COPY helloservice.ol main.ol
CMD jolie main.ol
```
A complete list of all the available command for teh Dockerfile script can be found [at this link](https://docs.docker.com/engine/reference/builder/). Here we briefly describe the list of the commands above:

1. `FROM jolielang/jolie`: it loads the image `jolielang/jolie`;
2. `MAINTAINER YOUR NAME <YOUR EMAIL> `: it just specifies the name and email address of the file maintainer;
3. `EXPOSE 8000`: it exposes the port `8000` to be used by external invokers. Note that the service `helloservice.ol` is programmed to listen to the location `socket://localhost:8000`. This means that the jolie microservice always listens on this port **within** the container.
4. `COPY helloservice.ol main.ol`: it copied the file `helloservice.ol` within the image renaming it into `main.ol`. Note that in case a microservice requires more than one file to work, all the files must be copied into the image by respecting the folder structure of the project.
5. `CMD jolie main.ol`: this is the command to be executed by Docker when a container will be start from the image described by this Dockerfile.

Once the Dockerfile is ready, we need to run docker for actually creating the container image. Such a task can be achieved by typing the following command on the console:

```
docker build -t hello .
```
where `docker build` is the docker command which builds a docker image starting from a Dockerfile and `hello` is the name of the image to be created. Once executed, it is possible to check if docker has created it by simply running the command which lists all the available images locally:

```
docker images
```
## Running the docker container starting from the image
Once the image is created, the container is ready to be run. Just execute the following command for starting it:

```
docker run -d --name hello-cnt -p 8000:8000 hello
```
where `-d` runs the container detached from the shell, `hello-cnt` is the name of the container and `-p 8000:8000` maps the internal port of the container to the hosting machine port. In this particular case the port is always `8000`. Finally, `hello` is the name of the image.

Once executed, the container is running and the jolie microservice can be easily invoked by a client. As an example wyou can try to invoke the service `helloservice.ol` using the follwing client:

```
include "console.iol"

interface HelloInterface {
RequestResponse:
     hello( string )( string )
}

outputPort Hello {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: HelloInterface
}


main {
  hello@Hello( "hello" )( response );
  println@Console( response )()
}
```

The container can be start and stop using the start and stop commands of docker:

```
docker stop hello-cnt
docker start hello-cnt
```
## Passing parameters to the jolie microservices using environment variables
A microservice which is more complicated with respect to the service `helloservice.ol` discussed in the previous section, could require to be initialized with some parameters before being started. A possible solution to this issue is usually passing the parameters using the environment variables of the container. The command `run` of docker indeed, allows for specifying the environment variable of the container. As an example the command `run` presented in the previous section could be re-written as it follows:

```
docker run -d --name hello-cnt -p 8000:8000 -e TESTVAR=spiderman hello
```
where we added the parameter `-e TESTVAR=spiderman` which initializes the environment variable `TESTVAR` with the value `spiderman`. Once executed, the container will be started with variable `TESTVAR` correctly initialized with the parameter value we want.

But how could we read it from a jolie service?

Reading an environment variable from a Jolie service is very simple. It is sufficient to exploit the standard library, in particular the [Runtime service](https://jolielang.gitbook.io/docs/standard-library-api/runtime). In this case we can use the operation `getEnv` which allows for reading the value of an environment variable and we could modify the previous example as it follows:

```
include "runtime.iol"

interface HelloInterface {

RequestResponse:
     hello( string )( string )
}

execution{ concurrent }


inputPort Hello {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: HelloInterface
}

init {
  getenv@Runtime( "TESTVAR" )( TESTVAR )
}

main {
  hello( request )( response ) {
        response = TESTVAR + ":" + request + ":" + args[0]
  }
}
```
The full code of this example can be consulted [here](https://github.com/jolie/examples/tree/master/06_containers/02_passing_parameters). Note that in the scope [init](https://jolielang.gitbook.io/docs/basics/processes#main-and-init) the service reads the environment variable `TESTVAR` and save it in the jolie variable with the same name `TESTVAR`. The variable `TESTVAR` is then used in the body of the operation `hello` for creating the response message. It is worth noting that at the beginning we need to include the `runtime.iol` service.

In order to try this example, just repeat the steps described at the previous section:

1. build the image with command `docker build -t hello .`. Note that the Dockerfile has not been modified.
2. run the container specifying the environment variable as specified before: `docker run -d --name hello-cnt -p 8000:8000 -e TESTVAR=spiderman hello`
3. try to run the same client for checking how the response appears.




