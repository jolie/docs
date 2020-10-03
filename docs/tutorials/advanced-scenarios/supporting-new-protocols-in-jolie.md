# Implementing new port protocols in Jolie

## Introduction

This is a step by step guide on how to implement a protocol in the programming language Jolie.

One of the distinguishing features of Jolie is that protocols used for communication can be easily changed in a program without requiring the refactoring of the code. As an example of that, see the code below, where code written in the main block invokes the operation twice, using either the `http` and `sodep` protocols, just by changing one line in the deployment.

We start the tutorial by cloning the Jolie repository and compile the interpreter. Then, we will create a new protocol by cloning and modifying an existing one. Finally, we will identify which parts must be specifically changed to start implementing our own protocol.

## Cloning and compiling the Jolie interpreter

Before starting to develop a new protocol for the Jolie language, we need to have installed Git, Maven, and the Java Development Kit.

We can clone the Jolie repository from Github and compile it with the following commands.

```bash
git clone https://github.com/jolie/jolie
cd jolie
mvn install
```

Once compiled, we suggest to install the `Jolie` command in the system, to ease testing our implementation. To do so, we can either link the Jolie executable to the systems bin files or install Jolie as described on the homepage. A quick way of to link the Jolie executable to the systems bin files is to run the `dev-setup.sh` file found in the Jolie `scripts` folder.

```bash
cd jolie/scripts
sh dev-setup.sh
```

To make sure we installed the `jolie` command correctly, we can run the command below, which prints the version of interpreter.

```bash
jolie --version
```

## Project Structure

The new protocol we are going to implement is essentially a new sub-project in the Jolie repository.

To prepare the structure of the project, we will not start from scratch but rather copy and modify a protocol already present. To do that, first access the folder where the Jolie repository was cloned. Then, let us open the folder named `extensions`. Here, we find the folder named `sodep` and we make a copy, naming the new folder e.g., `mysodep`. The choice to use `sodep` in our tutorial comes from the fact that its implementation is relatively small and just consists of three files, described below.

### pom.xml

The file `pom.xml` is the file used by maven to compile the project. Any protocol written in Jolie uses the following parent block, groupId, version, and packaging:

```markup
<parent>
  <groupId>org.jolie-lang</groupId>
  <artifactId>distribution</artifactId>
  <relativePath>../../pom.xml</relativePath>
  <version>1.0.0</version>
</parent>
<groupId>org.jolie-lang</groupId>
<artifactId>mysodep</artifactId>
<version>${jolie.version}</version>
<packaging>jar</packaging>
```

Note that only the `artifactId` changes from protocol to protocol. Here, we replaced the original `sodep` with `mysodep`.

```markup
    <name>mysodep</name>
    <description>mySodep protocol for Jolie</description>
```

In the build block, the `manifestEntries` block contains information on the name of the protocol factory.

```markup
<manifestEntries>
  <X-JOLIE-ProtocolExtension>
    mysodep:jolie.net.MySodepProtocolFactory  
  </X-JOLIE-ProtocolExtension>
</manifestEntries>
```

Here, change the `sodep` part to the name of your protocol \(`mysodep`\), and change `SodepProtocolFactory` to the name of the new protocol factory \(`mySodepProtocolFactory`\). The `artifactItem` and `outputDirectory` should not be changed.

The last part of the `pom.xml` file is the implementation of dependencies. All protocols will have Jolie as a dependency, as written below.

```markup
<dependencies>
    <dependency>
        <groupId>${project.groupId}</groupId>
        <artifactId>jolie</artifactId>
        <version>${jolie.version}</version>
    </dependency>
</dependencies>
```

### Protocol Factory implementation

We proceed to rename the file `SodepProtocolFactory.java` into `MySodepProtocolFactory.java` \(used by Jolie to create an instance of the protocol\). As expected, the name of the protocol factory is the same as the one present in the related pom.xml file.

In the protocol factory file, change every occurrence of `SodepProtocol` to `mySodepProtocol` and `SodepProtocolFactory` to `mySodepProtocolFactory`.

### Protocol implementation

The last file that we need to change is `SodepProtocol.java`, which contains the actual implementation of the protocol, i.e, where data structures are encoded and decoded for communication.

Similarly to what we did before, we need to rename the file from `SodepProtocol.java` into `MySodepProtocol.java` and replace any occurrence of `sodep` to `mysodep` in the file. Specifically, there are at least 3 items that need to be changed.

* The class name

  public class mySodepProtocol extends ConcurrentCommProtocol

* The name method

  ```jolie
  public String name()
  {
    return "mysodep";
  }
  ```

* The SodepProtocol method

  ```jolie
  public MySodepProtocol( VariablePath configurationPath )
  {
    super( configurationPath );
  }   
  ```

## First compilation and execution

We can now check that the new protocol \(although implementing the same behaviour as sodep\) can be compiled and used in a Jolie program.

To do so, navigate to the directory of `mysodep`, where the `pom.xml` file is. From here, run

```text
mvn install
```

to compile the extension. This will create an executable named `mysodep.jar` in the target folder and copy it into the folder `jolie/dist/extensions`.

NOTE! To recompile the entire Jolie project, integrate your extension into the main Jolie `pom.xml` file, found in the repository root. This is done by adding the following line to the 'module' section of the `pom.xml` file.

```markup
<module>extensions/mysodep</module>
```

Now that the implementation of `mysodep` is ready and compiled, we can use it in Jolie programs. As an example, we use the new protocol `mysodep` in the programs below \(a client and a server\).

```jolie
include "console.iol"
interface TwiceInterface {
    RequestResponse: twice( int )( int )
}
outputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: mysodep
    RequestResponse: twice
}
main
{
    twice@TwiceService( 5 )( response )
    println@Console( response )()
} 

interface TwiceInterface {
    RequestResponse: twice( int )( int )
}
inputPort TwiceService {
    Location: "socket://localhost:8000"
    Protocol: mysodep
    RequestResponse: twice
}
main
{
    twice( number )( result ) {
        result = number * 2
    }
}
```

## Writing your own protocol

In this section, we will use the new protocol, `mysodep`, to take a closer look at how a protocol is implemented in Jolie.

### Protocol Factory implementation

Any protocol factory needs to have two methods implemented to create output ports and input ports, respectively.

```java
public CommProtocol createOutputProtocol( VariablePath configurationPath, URI location )
  throws IOException
{
  return new mySodepProtocol( configurationPath );
} 

public CommProtocol createInputProtocol( VariablePath configurationPath, URI location )
  throws IOException
{
  return new mySodepProtocol( configurationPath );
}
```

### Protocol implementation

In general, the protocol needs to implement four methods: `name`, `recv`, `send`, and `threadSafe`.

The method `name` labels the protocol and it is used by the Jolie interpreter to identify it.

```java
public String name()
{
  return "mysodep";
}
```

The method `recv`, handles incoming messages to be decoded into Jolie `CommMessage`s \(CommMessage is the internal representation of messages in Jolie\).

```java
public CommMessage recv( InputStream istream, OutputStream ostream )
    throws IOException
{
  // ...
}
```

The method `send` handles outgoing messages by encoding a `CommMessage` into bits.

```java
public void send( OutputStream ostream, CommMessage message, InputStream istream )
    throws IOException
{
    // ...
}
```

The method `isThreadSafe` is used by the Jolie interpreter to optimise the execution of protocols. In the case of `sodep`, the method does not need to be implemented, since the protocol extends the `SequentialProtocol` class.

```java
public final boolean isThreadSafe()
{
    // ...
}
```

## Adding Dependencies to the project

If our protocol implementation used some dependencies, they can be added in the `pom.xml` dependency block. For instance, if our protocol needs the `http` library in the Jolie project, like the existing protocol `soap`, then we can add the following lines the dependencies block in the `pom.xml` file.

```markup
<dependency>
  <groupId>${project.groupId}</groupId>
  <artifactId>http</artifactId>
  <version>${jolie.version}</version>
</dependency>
```

That is, `<groupId\>project name</groupId\>`, `<artifactId\>dependency name</artifactId\>`, `<version\>version of dependency</version>`.

Finally, to make the dependencies available at runtime, we add the annotation `@AndJarDeps("path/to/dependency.jar\")` into the protocol factory class declaration. As an example, the `SoapProtocolFactory` class shows the following dependencies.

```java
@AndJarDeps({
    "jaxws/javax.annotation-api.jar",
    "jaxws/javax.xml.soap-api.jar",
    "jaxws/jaxb-api.jar",
    "jaxws/jaxb-core.jar",
    // ...
    "jaxws/streambuffer.jar",
    "jaxws/woodstox-core-asl.jar"
})
```

