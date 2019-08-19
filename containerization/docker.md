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

### Creating a docker image
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
### Running the docker container starting from the image
Once the image is created, the container is ready to be run. Just execute the following command for starting it:

```
docker run -d --name hello-cnt -p 8000:8000 hello
```
where `-d` runs the container detached from the shell, `hello-cnt` is the name of the container and `-p 8000:8000` maps the internal port of the container to the hosting machine port. In this particular case the port is always `8000`. Finally, `hello` is the name of the image.

Once executed the container is running and the jolie microservice can be easily invoked by a client. As an example wyou can try to invoke the service `helloservice.ol` using the follwing client:

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





