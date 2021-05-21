# Java Client

The creation of a Java Client allows for an easy integration with an existing Jolie service from a Java application by simply using the sodep protocol. In this case you don't need to introduce a rest interface over a http protocol, or a SOAP communication layer, you can just explott the easiest way offered by Jolie for building a service: the protocol [SODEP](../../protocols/sodep.md).

In the following picture we briefly represent how the final architecture of the Jolie Client appears.

![](../../../.gitbook/assets/jolie_client.png)

The Java client for a Jolie service can be automatically built starting from a Jolie outputPort declaration. In particular, the client takes the form of a package of classes where all the Jolie types declared in the interfaces used at the input port, are converted into classes in Java. Moreover, all the Jolie interfaces available at the given port are converted into one Java interface. An implementation of the Java interface is provided in order to easily call the Jolie service by exploiting the Jolie Java client.

There are two possible ways for generating the Java client starting from an outputPort:

* Using the tool jolie2java from command line
* Using the jolie2java-maven-plugin

## jolie2java

The tool `jolie2java` is distributed together with the jolie engine. If you have already installed jolie you can run it in a simple way just typing the following command on a console:

```text
jolie2java --help
```

You will see the following message on the console:

```text
Usage: jolie2java --format [java|gwt] --packageName package_namespace [--targetPort outputPort_to_be_encoded] [ --outputDirectory outputDirectory ] [--buildXml true|false] [--addSource true|false] file.ol
```

where all the possible arguments to the tool are specified. They are:

* `--format`: it can be `java` or `gwt` depending on the target technology. The default is `java`. **Note that the generation of the gwt classes is deprecated**
* `--packageName`: it is the name of the package which will contain all the generated classes. It is a mandatory argument.
* `--targetPort`: it is the name of the outputPort to be converted. It could be usedful where the jolie file containes more than one outputPort and we just need to convert one of them. If it is not specified all the output ports will be converted.
* `--outputDirectory`: it is the name of the output directory where the generated files will be stored. The default value is `./generated`
* `--buildXml`: it specifies if the tool must generate also the file `build.xml` which can be used by _ant_ for building the generated classes and provide a unique library file in the form of a jar file. The default is `true`.
* `--addSource`: when the generation of the file `build.xml` is enabled it specifies if adding also the sources \(files .java\) to the jar. The default is `false`. In case the argument `buildXml` is set to `false` it is ignored.

Let us now try to apply the tool `jolie2java` to the simple example at this [link](https://github.com/jolie/examples/tree/master/05_other_tools/02_jolie2java/01_jolie2java). Here there is a Jolie service which implements two operations `getTemperature` and `getWind`. The interface which describes them follows:

```jolie
type GetTemperatureRequest: string {
    .place?: void {
        .longitude: string 
        .latittude: string
    }
}

type GetWindRequest: void {
  .city: string
}

interface ForecastInterface {
RequestResponse:
  getTemperature( GetTemperatureRequest )( double ),
  getWind( GetWindRequest )( double )
}
```

The client declaration we want to convert in a Java Client is defined within the file `client.ol` which is reported below:

```jolie
include "ForecastInterface.iol"

outputPort Forecast {
Interfaces: ForecastInterface
}

main {
    nullProcess
}
```

It is worth noting that the minimal definition we require in order to generate a Java Client is the declaration of an outputPort and its related interfaces. The main scope is defined but it is empty \(`nullProcess`\) just because we need to respect the minimal requirements for a service definition, otherwise a syntax error would be triggered by the tool.

Download in a folder both the `main.ol` and the `ForecastInterface.iol` file and run the following command from the same folder.

```text
jolie2java --packageName com.test.jolie client.ol
```

As a result you will find a folder called `generated` whose content is:

```text
-- build.xml
-- com
----| 
----test
------|
------jolie
--------|
--------types
----------|
----------GetTemperatureRequest.java
----------GetWindRequest.java
--------Controller.java
--------ForecastImpl.java
--------ForecastInterface.java
--------JolieClient.java
```

The file `build.xml` can be used under [ant](https://ant.apache.org/) for building a distributable jar file. See the subsection [below](javaclient.md#create-a-distributable-jar-with-ant) for more details. The structure of the directories `com/test/jolie` corresponds to the package name given as argument to `jolie2java`.

Files `Controller.java` and `JolieClient.java` actually implement the client for sending requests to a Jolie service. The file `ForecastInterface.java` is the Java interface which corresponds to the Jolie ones available at the converted outputPort. The file `ForecastImpl.java` is the actual implementation of the `ForecastInterface.java` and it exploits the `JolieClient` class for directly invoking the operations of the Jolie service. The folder `types` contains all the classes which represent the types declared in the Jolie interface. In this example there are only two types: `GetTemperatureRequest` and `GetTemperatureRequest`.

### Some important notes to the type conversion

**Native types** are converted into Java classes as it is described below:

* int -&gt; Integer
* string -&gt; String
* double -&gt; Double
* long -&gt; Long 
* bool -&gt; Booelan
* raw -&gt; ByteArray _\(it is an class available from the jolie.jar library\)_
* undefined -&gt; Value _\(it is an class available from the jolie.jar library\)_
* any -&gt; Object

**Structured types** are converted by introducing inner classes inside the main one. For example, the type `GetTemperatureRequest` contains a subnode `place` which is mapped with an internal class called `placeType` as it is shown below where we report the first lines of the `GetTemperatureRequest.java`.

```java
public class GetTemperatureRequest implements Jolie2JavaInterface {
    public class placeType {
        private String latittude;
        private String longitude;

        public placeType( Value v ) throws TypeCheckingException {
    ...
```

**Root values**. When a Jolie type requires a root value like in type `GetTemperatureRequest` where a `string` is requested as root type, in Java it is converted introducing a private filed called `rootValue` which can be accessed by using methods `getRootValue` and `setRootValue`.

### Create a distributable jar with ant

In order to use the generated classes in a Java project it is possible to copy them by hand and then compile them. Note that you need to import also the directories which define the package name given as argument `com/test/jolie`. It is worth noting that you need to add the following libraries to your project in order to satisfy the dependencies:

* `jolie.jar`: 
* `libjolie.jar`
* `sodep.jar`
* `jolie-java.jar`

It is possible to retrieve all of them in the installation folder of Jolie. In particular, `jolie.jar` is in the installation folder, `libjolie.jar` and `jolie-java.jar` are in the folder `lib` and, finally, `sodep.jar` is in the folder `extensions`.

Alternatively, if you are confindent with [ant](https://ant.apache.org/) you can directly compile a distributable jar by exploiting the generated file `build.xml`. In this case it is sufficient to run the following command on the console from the same folder where the file `build.xml` is:

```text
ant dist
```

The command generates three folders:

* `built`: it contains the compiled Java classes
* `dist`: it contains the distributable jar of the Jolie Java client
* `lib`: it contains all the jar dependencies of the Jolie Java client

### Using the Jolie Java client in a project

Let us now to show how to use the generated client into a Java project. First of all, include the following jar files in the classpath of your project:

* `jolie.jar`: 
* `libjolie.jar`
* `sodep.jar`
* `jolie-java.jar`
* `JolieClient.jar`: it is the distributable jar of the client obtained compiling the sources with ant as described in the previous section.

In the following we show the code necessary to invoke the Jolie service of the example presented above. Here we assume that such a service is running on localhost at port 8000.

```java
import com.test.jolie.ForecastImpl;
import com.test.jolie.JolieClient;
import com.test.jolie.types.GetTemperatureRequest;
import java.io.IOException;

public class JavaApplication
{
    public static void main( String[] args ) throws IOException, InterruptedException, Exception
    {
        JolieClient.init( "localhost", 8000 );
        ForecastImpl forecast = new ForecastImpl();
        GetTemperatureRequest request = new GetTemperatureRequest();
        request.setRootValue( "Cesena" );
        System.out.println( forecast.getTemperature( request ));
    }    
}
```

* before using the client, it is necessary to initialize the location and the port of the service to invoke. The first row of the main does this: 

`JolieClient.init( "localhost", 8000 );`

* then it is necessary to instantiate the object which implements the Java interface of the service:

`ForecastImpl forecast = new ForecastImpl();`

* now it is possible to prepare the request message:

`GetTemperatureRequest request = new GetTemperatureRequest(); request.setRootValue( "Cesena" );`

* finally, it is possible to perform the invocation:

`forecast.getTemperature( request )`

### Using the jolie2java-maven-plugin

For those who are using [maven](https://maven.apache.org/) for managing their Java projecs, it is possible to use `jolie2java` within a specific maven plugin: `jolie2java-maven-plugin`. Just add the following lines to the pom of your project and the `jolie2java` tool can be used within the maven Lifecycle:

```xml
<!--dependencies-->
<dependency>
  <groupId>jolie</groupId>
  <artifactId>jolie</artifactId>
  <version>1.8.1</version>
</dependency>
<dependency>
  <groupId>jolie</groupId>
  <artifactId>libjolie</artifactId>
  <version>1.8.1</version>
</dependency>
<dependency>
  <groupId>jolie</groupId>
  <artifactId>jolie-java</artifactId>
  <version>1.8.1</version>
</dependency>
<dependency>
  <groupId>jolie</groupId>
  <artifactId>sodep</artifactId>
  <version>1.8.1</version>
</dependency>

<!-- maven plugin -->
<build>
      <plugins>
          <plugin>
              <groupId>jolie</groupId>
              <artifactId>jolie2java-maven-plugin</artifactId>
              <version>1.0.0</version>
              <configuration>
                  <joliePath>...</joliePath>
                  <outputDirectory>...</outputDirectory>
                  <packageName>...</packageName>
          <includePath>...</includePath>
              </configuration>
              <executions>
                  <execution>
                      <goals>
                          <goal>joliegen</goal>
                      </goals>
                  </execution>
              </executions>
          </plugin>
      </plugins>
  </build>
```

where the configuration parameters are:

* _joliePath_: the path where the jolie files which describe the client can be found by maven
* _outputDirectory_: the outputDirectory where the generated classes must be copied
* _packageName_: the name of the package to be used in the generated classes
* _includePath_: the path where the jolie standard library include files are stored. Default `/usr/lib/jolie/include`.

Note that the `jolie2java-maven-plugin` will be run during the `generated-sources` phase of maven, thus before the compilation one. So, take care to specify an outputDirectory inside your project which can be accessed by maven during the compilation.

