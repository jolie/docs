# Jocker
[Jocker](https://github.com/jolie/jocker) is a Jolie service which provides a Jolie interface of the [HTTP docker APIs](https://docs.docker.com/engine/api/v1.29/). Thanks to Jocker it is possible to interact with a docker server just as it is a Jolie service. At [this link](https://github.com/jolie/jocker/blob/master/InterfaceAPI.iol) it is possible to check the API supported by Jocker.

Jocker is available as a docker container, just type the following commands for activating a Jocker instance:
```
docker pull jolielang/jocker
docker run -it -p 8008:8008 --name jocker -v /var/run:/var/run jolielang/jocker
```
Note that Jocker is listening on the container internal port `8008`, thus if you need to change it, just configure properly the container when running it using the parameter `-p 8008:8008`.

Once installed, it is possible to call it as a usual Jolie service.
