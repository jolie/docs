# Containerization

Jolie programming language does not directly deal with the containerization process, but it layers upon other technology frameworks in order to deploy jolie microservices inside a container. At the present, we only investigated the integration with [Docker](https://www.docker.com/). In particular, we investigated the integration with Docker following two different approaches:

* **Deploying a Jolie microservice as a Docker container**.
* **Using Jolie as orchestration language for controlling Docker**. To this end we developed a Jolie wrapper for the Docker API which is called _Jocker_. Thanks to Jocker it is possible to call the Docker APIs using the protocol [sodep](../protocols/sodep.md).

