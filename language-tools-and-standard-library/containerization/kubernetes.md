# Kubernetes

[Kubernetes](https://kubernetes.io/) is an open-source system for automating deployment, scaling, and management of containerized applications. Jolie microservices deployed inside a Docker container can be managed by Kubernetes as well. We are going to use what learnt in Docker [section](https://github.com/jolie/docs/tree/454f0b1c62f161eaacc3217f5e7347979b082a13/containerization/containerization/docker.md) to deploy an easily-scalable application, with multiple containers running the same service behind a load balancer. To run the example a Kubernetes environment is needed, the easiest way to get it is to install [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/).

## Deploying "Hello" Jolie service in a container Docker

Let's make some modifications to `helloservice.ol` used in the previous Docker example:

```jolie
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
  getenv@Runtime( "HOSTNAME" )( HOSTNAME )
}

main {
  hello( request )( response ) {
        response = HOSTNAME + ":" + request 
  }
}
```

The HOSTNAME environment variable is set by Kubernetes itself and it's printed out to show what microservice instance is answering the request.

## Creating a docker image

The Dockerfile needed to create a docker image of this microservice is the same seen in the Docker section:

```dockerfile
FROM jolielang/jolie
EXPOSE 8000
COPY helloservice.ol main.ol
CMD jolie main.ol
```

Typing the following command in the console actually creates the image:

```text
docker build -t hello .
```

## Creating a Kubernetes Deployment

This image can now be wrapped in [**Pods**](https://kubernetes.io/docs/concepts/workloads/pods/pod/), the smallest deployable units of computing that can be created and managed in Kubernetes. A [**Deployment**](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) describes in a declarative way the desired state of a **ReplicaSet** having the purpose to maintain a stable set of replica Pods running at any given time:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jolie-sample-deployment
  labels:
    app: jolie-sample
spec:
  replicas: 2
  selector:
    matchLabels:
      app: jolie-sample
  template:
    metadata:
      labels:
        app: jolie-sample
    spec:
      containers:
      - name: jolie-k8s-sample
        image: hello
        ports:
        - containerPort: 8000
        imagePullPolicy: IfNotPresent
```

To create the Deployment save the text above in **jolie-k8s-deployment.yml** file and type this command:

```text
kubectl apply -f jolie-k8s-deployment.yml
```

After a few seconds you can see your pods up and running using this command:

```text
kubectl get pods
```

## Exposing Deployment by a Service

Now we have 2 running Pods, each one listening on port 8000, but with 2 issues: 1. they're reachable only from the internal Kubernetes cluster network; 2. they're ephemeral. As explained [here](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/), a [**Service**](https://kubernetes.io/docs/concepts/services-networking/service/) is needed to expose the application in the right way. Following the [Minikube tutorial](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-service), just type:

```text
kubectl expose deployment jolie-sample-deployment --type=LoadBalancer --port=8000
```

to create such **Service**. The result can be verified with this command:

```text
kubectl get services
```

and the output should be something like this:

```text
NAME                      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
jolie-sample-deployment   LoadBalancer   10.109.47.147   <pending>     8000:30095/TCP   13s
kubernetes                ClusterIP      10.96.0.1       <none>        443/TCP
```

The last step is to make the **Service** visible from your host going through a "minikube service":

```text
minikube service jolie-sample-deployment
|-----------|-------------------------|-------------|-----------------------------|
| NAMESPACE |          NAME           | TARGET PORT |             URL             |
|-----------|-------------------------|-------------|-----------------------------|
| default   | jolie-sample-deployment |             | http://<your_IP>:<ext_port> |
|-----------|-------------------------|-------------|-----------------------------|
```

## Invoking microservices from client

Now we a stable access door to our application, and it can be invoked by a client:

```jolie
include "console.iol"

interface HelloInterface {
RequestResponse:
     hello( string )( string )
}

outputPort Hello {
Location: "socket://<your_IP>:<ext_port>"
Protocol: sodep
Interfaces: HelloInterface
}


main {
  hello@Hello( "hello" )( response );
  println@Console( response )()
}
```

Each time you make a request typing:

```text
jolie client.ol
```

your local  is hit and the **LoadBalancer** redirects the request to one of the 2 available **Pods** running the service. Printing out the HOSTNAME variable makes visible the load balancing, showing which **Pod** is serving the response:

```text
$ jolie client.ol 
jolie-sample-deployment-655f8b759d-mq8cn:hello
$ jolie client.ol 
jolie-sample-deployment-655f8b759d-bmzk7:hello
$ jolie client.ol 
jolie-sample-deployment-655f8b759d-mq8cn:hello
$ jolie client.ol 
jolie-sample-deployment-655f8b759d-bmzk7:hello
```

