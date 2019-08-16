# Java Client
The creation of a Java Client allows for an easy integration with an existing Jolie service from a Java application by simply using the sodep protocol. In this case you don't need to introduce a rest interface over a http protocol, or a SOAP communication layer, you can just explott the easiest way offered by Jolie for building a service: the protocol [SODEP](../../protocols/sodep.md).

In the following picture we briefly represent how the final architecture of the Jolie Client appears.

![](../.gitbook/assets/jolie_client.png)

The Java client for a Jolie service can be automatically built starting from a Jolie outputPort declaration. In particular, the client takes the form of a package of classes where all the Jolie types declared in the interfaces used at the input port, are converted into classes in Java. Moreover, all the Jolie interfaces available at the given port are converted into one Java interface. An implementation of the Java interface is provided in order to easily call the Jolie service by exploiting the Jolie Java client.

There are two possible ways for generating the Java client starting from an outputPort:

* Using the tool jolie2java from command line
* Using the jolie2java-maven-plugin

## jolie2java
The tool `jolie2java` is distributed together with the jolie engine. If you have already installed jolie you can run it in a simple way just typing the following command on a console:

```
jolie2java --help
```
You will see the following message on the console:
```
Usage: jolie2java --format [java|gwt] --packageName package_namespace [--targetPort outputPort_to_be_encoded] [ --outputDirectory outputDirectory ] [--buildXml true|false] [--addSource true|false] file.ol
```
where all the possible arguments to the tool are specified. They are:
* `--format`: it can be `java` or `gwt` depending on the target technology. The default is `java`. **Note that the generation of the gwt classes is deprecated**
* `--packageName`: it is the name of the package which will contain all the generated classes. It is a mandatory argument.
* `--targetPort`: it is the name of the outputPort to be converted. It could be usedful where the jolie file containes more than one outputPort and we just need to convert one of them. If it is not specified all the output ports will be converted.
* `--outputDirectory`: it is the name of the output directory where the generated files will be stored. The default value is `./generated`
* `--buildXml`: it specifies if the tool must generate also the file `build.xml` which can be used by *ant* for building the generated classes and provide a unique library file in the form of a jar file. The default is `true`.
* `--addSource`: when the generation of the file `build.xml` is enabled it specifies if adding also the sources (files .java) to the jar. The default is `false`. In case the argument `buildXml` is set to `false` it is ignored.

Let us now try to apply the tool `jolie2java` to the simple example at this [link](https://github.com/jolie/examples/tree/master/05_other_tools/02_jolie2java/01_jolie2java). Here there is a Jolie service which implements two operations `getTemperature` and `getWind`. The interface which describes them follows:
```
type GetTemperatureRequest: void {
  .city: string
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
So, download in a folder both the `main.ol` and the `ForecastInterface.iol` file and run the following command from the same folder.

```
jolie2java --packageName com.test.jolie main.ol
```
As a result you will find a folder called `generated` whose content is:
-- build.xml
-- com
---- 












