# Java

The creation of a Java service allows developers to implement the behaviour of their Jolie services in Java, as a matter of fact, many services of the Jolie standard library \(like `Console`\) are Java Services.

## Quick Start

In this section we will cover how to quickly get started implementing your first Java service.

### Requirements

- Jolie (version: ^1.13)
- Java (version: ^21)
- npm
- Maven

### Setting up the project with `create-jolie`

First we will setup our project by using the `create-jolie` tool. To do this we will navigate to the directory that we wish our project to be located, and then run the command:

    npm init jolie

to initiate a guided setup process. For the most part we can just use the default options given to us, but two important prompts are:

- **Project template**, where you should choose *Service*, and
- **Implementation language**, where you should choose *Java*.

### Making a Java service with `jolie2java`

Let's say we want to make our own `MyConsole` Java service, so we use `create-jolie` to get started with a project looking like the following:

- `src/main/java/org/jolie_lang/example`
    - `spec/MyConsoleInterface.java`
    - `MyConsole.java`
- `my-console.ol`
- `pom.xml`
- `package-lock.json`
- `package.json`

We can then edit the `MyConsoleInterface` interface of the `my-console.ol` file such that it looks something like the following:

```jolie
interface MyConsoleInterface {
    OneWay: println( string )
}

service MyConsole {
    inputPort ip {
        location: "local"
        interfaces: MyConsoleInterface
    }   
    foreign java {
        class: "org.jolie_lang.example.MyConsole"
    }
}
```

Now, by using the command:

    npm run generate

we can have `jolie2java` update the generated `MyConsoleInterface` to reflect the changes we made in `my-console.ol`.

```java
package joliex.io;

import jolie.runtime.JavaService;

public class MyConsole extends JavaService implements MyConsoleInterface {
    public void println( String s ) {
        System.out.println( s );
    }
}
```

By implementing the `println` method of `MyConsole.java`, as shown above, we now have our first working Java service!

### Using a Java service with Jolie

Now that we have implemented our Java service we first need it to be accessible to our Jolie service, which, when using `create-jolie`, is done by using the command:

    mvn package

This will create a jar containing the Java service and place it in the **lib** folder of our project, which will allow our Jolie service to access and use it.

```jolie
from .my-console import MyConsole

service Main {
    embed MyConsole as console
    main {
        println@console( "Hello World!" )
    }
}
```

Now that Jolie has access to our Java service, we can embed the `MyConsole` service as we would any other Jolie service, as shown above.

#### Standalone Java service

Alternatively, if we want our Java service to be a standalone service that can be deployed by itself, we can achieve this by saying yes (y) to the prompt: **Do you want a launcher service (standalone service)?** during the setup process. Doing this will ensure that a *launcher service* is generated, allowing the Java service to be deployed by simply using the command:

    npm start

This command will also run `mvn package` before launching the service to ensure it is always using the newest version of the Java service (this behaviour can be changed by manually editing the **prestart** script in the **package.json** file of the project).

## Type Conversion

In order to generate the classes for every type in a given Jolie file, Jolie2Java categorizes each type into one of the following:

- Undefined
- Native
- Custom
    - Basic
    - Structure
        - Untyped
        - Typed
    - Choice

Note that aliases are categorized based on what they are an alias of, e.g. for the Jolie type:

```jolie
type Alias: T
```

the category of `Alias` is exactly that of `T`.

### Undefined

The Undefined category is exclusively used for the `undefined` type, and is translated into the predefined class `JolieValue` *(available from the jolie.jar library)*.

```java
public interface JolieValue {
    JolieNative<?> content();
    Map<String, List<JolieValue>> children();
    ...
}
```

The most important methods of `JolieValue` are shown in the snippet above, being `content` and `children`, giving access to the root content and nodes of the data tree it represents respectively.

Note that all generated classes inherit from `JolieValue`, meaning that every generated class can, in most cases, be used interchangeably with it.

### Native

The Native category consists of all the types native to Jolie, excluding `undefined`, where each is translated into a predefined class as follows:

- `bool` -> `Boolean`
- `int` -> `Integer`
- `long` -> `Long`
- `double` -> `Double`
- `string` -> `String`
- `raw` -> `ByteArray` *(available from the jolie.jar library)*
- `any` -> `JolieNative` *(available from the jolie.jar library)*

One exception is `void`, which is treated differently depending on the context, either being the primitive `void` when used as the response type in an operation, or being the absence of a parameter when used as the request type or as part of a choice type.

### Basic

The Basic category is used for all types and nodes that are defined as a refinement of a type categorized as Native.

#### Examples

When a type is itself categorized as Basic like the following:

```jolie
type BasicType: int( ranges( [1,10] ) )
```

it will be translated into it's own `record` like:

```java
public record BasicType( Integer contentValue ) implements JolieValue {...}
```

where `contentValue` is used to represent the root content as to allow it to be accessed without using the inherited `content` method that requires it to be wrapped in a `JolieNative`.

Consider now the following Jolie definition:

```jolie
type BasicNodes {
    .inline: int( ranges( [1,10] ) )
    .link: BasicType
}
```

Here the node `inline` will be translated to a field of type `Integer`, whereas the node `link` will be translated to a field of type `BasicType`.

Note that, regardless of how it is translated, the classes will always ensure that the refinement is respected.

### Structure

The Structure category is used for all custom types that have nodes, being subdivided into Untyped Structure for those with untyped nodes, i.e. using the notation `T {?}`, and Typed Structure for those with typed nodes.

#### Examples

Structures are always translated into classes, being translated into inner classes when defined inline as the type of a node, where a type like:

```jolie
type StructureType: int {
    .node: string
}
```

is translated into a class like:

```java
public final class StructureType extends TypedStructure {
    ...
    public Integer contentValue() {...}
    public String node() {...}
    ...
}
```

Here `contentValue` is the field that represent the root content of the type, being used whenever the root type isn't `any` or `void` to give an alternative to using the inherited `content` method.

#### Instantiation

In order to instantiate structure types two options are available.

```java
public final class StructureType extends TypedStructure {
    ...
    public StructureType( Integer contentValue, String node ) {...}
    ...
    public static Builder builder() {...}
    ...
}
```

One is a regular constructor with all the fields, the other being a `Builder` class accessible through the static `builder` method.

### Choice

The Choice category is used for all custom types which are defined as a choice between two or more types.

#### Examples

Consider the following Jolie type definition:

    type ChoiceType: int | SomeType | bool {?}

this will result in the generation of class like the following:

```java
public sealed interface ChoiceType extends JolieValue {
    public static record C1( Integer option ) implements ChoiceType {...}
    public static record C2( SomeType option ) implements ChoiceType {...}
    public static record C3( S1 option ) implements ChoiceType {...}
}
```

where `S1` is an inner class used to represent the inline type `bool {?}`.

#### Access

The best way to access the data of the classes generated to represent choice types is through *enhanced switch statements*:

```java
public void someOperation( ChoiceType request ) {
    switch ( request ) {
        case ChoiceType.C1( Integer r ) -> {...}
        case ChoiceType.C2( SomeType r ) -> {...}
        case ChoiceType.C3( ChoiceType.S1 r ) -> {...}
    }
}
```

#### Instantiation

The best way to instantiate the classes generated to represent choice types is by using one of its static `of` methods:

```java
public ChoiceType anotherOperation( ChoiceType request ) {
    return switch ( request ) {
        case ChoiceType.C1( Integer r ) -> ChoiceType.of1( r+1 );
        case ChoiceType.C2( SomeType r ) -> ChoiceType.of2( r );
        case ChoiceType.C3( ChoiceType.S1 r ) -> ChoiceType.of3( 
            b -> b.contentValue( true ).putAs( "field", 12 ).build()
        );
    };
}
```

(Note that, in the example above, we use a special variation of the `of3` method that takes a function from the builder to an instance of `ChoiceType.S1`, rather than just an instance.)

## Faults

Just like with types, faults also result in corresponding classes being generated.

```jolie
interface IntUtilsInterface {
    requestResponse: 
        parseInt(string)(int) throws InvalidNumberFormat(string)
}
```

Using `jolie2java` to translate the `IntUtilsInterface` interface will result in a `MyFault` class being generated, which can be used how you would any other exception class in Java (albeit with the message type being that of the corresponding fault declaration in Jolie).

```java
public Integer parseInt( String request ) throws InvalidNumberFormat {
    try {
        return Integer.parseInt( request );
    } catch ( NumberFormatException e ) {
        throw new InvalidNumberFormat( e.getMessage() );
    }
}
```

By using a generated fault class, as in the `parseInt` method above, we can handle the fault like we would a fault thrown by any other Jolie service.

```jolie
from console import Console
from .int-utils import IntUtils

service Main {
    embed Console as Console
    embed IntUtils as IntUtils
    
    main {
        install( InvalidNumberFormat => println@Console( InvalidNumberFormat )() )
        parseInt@IntUtils( "not a number" )( response )
        println@Console( response )()
    }
}
```

One thing that should be noted is that Jolie currently allows multiple faults to have the same name but different types, however, as this is planned to be phased out, `jolie2java` does not allow this and will refuse to translate jolie files that do this.

## Annotations

The new `jolie2java` tool allows you to use a number of annotations in your Jolie files to customize the result of the generation process. As Jolie does not have an actual annotation system at the moment, this is accomplished by using documentation comments, so it is important to follow the guidelines for each annotation to ensure it can be parsed by the tool. Annotations generally follow the structure **@<name>(<data>)**, with no specific rules for how to delimit multiple annotations, e.g. `///@A1(true) @A2("string")` and `///@A1(true), @A2("string")` are both valid ways of specifying multiple annotations at once.

### `@JavaName`

The `@JavaName` annotation is used to handle naming conflicts arising from names of types and nodes that can't be used in the generated Java classes. Below is an example of how one might use this annotation:

```jolie
///@JavaName("MyType")
type myType {
    .char*: string //<@JavaName("chars")
    ."@node": int //<@JavaName("node")
}
```

where `@JavaName` is used because:

- *myType* isn't allowed because we require that class names in Java be capitalized,
- *char* can't be used because it is a reserved keyword in Java, and
- *@node* can't be used because the character *@* is not allowed to be used in the names of fields or methods in Java.

There are other ways to have illegal names, but these will prompt `jolie2java` to throw an exception, providing information on which name is invalid and why.

### `@InlineLink`

The `@InlineLink` annotation is used in certain cases to either reduce memory usage or making the generated classes more convenient. Below is an example of how one might use this annotation:

```jolie
type MyRefinedType: int( ranges( [1,10] ) )
///@InlineLink(true)
type MyRefinedLink: MyRefinedType
type MyType {
    .refinedNode: MyRefinedLink //<@InlineLink(true)
}
```

where `@InlineLink` is used because:

- *MyRefinedLink* would otherwise have its own class generated for it, and
- *refinedNode* would otherwise have the type `MyRefinedType` (since we used `@InlineLink` on `MyRefinedLink`) instead of `Integer`.

Essentially, `@InlineLink` will cause `jolie2java` to treat link definitions as if they were an inline definition.

### `@GenerateBuilder`

The `@GenerateBuilder` annotation is used to specify types where the corresponding class shouldn't have a builder class generated for it. Below is an example of how one might use this annotation:

```jolie
///@GenerateBuilder(false)
type MyRequestType {
    .request: undefined
}
///@GenerateBuilder(false)
type MyResponseType {
    .response: string
}
```

where `@GenerateBuilder` is used because:

- *MyRequestType* is only ever used as a request type (meaning its builder class is never used), and
- *MyResponseType* is so simple that only the constructor is ever used.

## Invoking Embedder Operations

A Java service can invoke operations of its embedder by means of the `getEmbedder` method offered by the `JavaService` class, which returns an `Embedder` object that can be used to perform the invocations. To exemplify its usage, consider the following service:

```jolie
from queue-utils import QueueUtils

interface QueuePrinterInterface {
    requestResponse: printAll(string)(void) throws NoSuchQueue
}

service QueuePrinter {
    inputPort ip {
        location: "local"
        interfaces: QueuePrinterInterface
    }
    foreign java {
        class: "example.io.QueuePrinter"
    }
}

constants {
    queue = "example"
}

service Main {
    embed QueueUtils as QueueUtils
    embed QueuePrinter as QueuePrinter

    inputPort Queue {
        location: "local"
        aggregates: QueueUtils
    }

    main {
        new_queue@QueueUtils(queue)(_)
        push@QueueUtils({ queue_name = queue, element = "Hello" })(_)
        push@QueueUtils({ queue_name = queue, element = "World" })(_)
        printAll@QueuePrinter(queue)()
    }
}
```

Here we have a `QueuePrinter` Java service, which is supposed to print all the elements of some queue populated by other services. To handle the queues we import the `QueueUtils` service from the Jolie standard library, and embed it along with the `QueuePrinter` service in our `Main` service. In order to make the operations of the `QueueUtils` service available to our Java service we aggregate it in the local `Queue` input port.

```java
package example.io;

import java.io.IOException;
import example.io.spec.QueuePrinterInterface;
import example.io.spec.faults.NoSuchQueue;
import jolie.runtime.FaultException;
import jolie.runtime.JavaService;
import jolie.runtime.embedding.java.JolieNative.JolieString;
import jolie.runtime.embedding.java.JolieValue;

public final class QueuePrinter extends JavaService implements QueuePrinterInterface {

    private String poll( String queue_name ) throws NoSuchQueue {
        try {
            final JolieValue response = getEmbedder()
                .callRequestResponse( "poll", JolieValue.of( queue_name ) );
            return switch ( response.content() ) {
                case JolieString( String value ) -> value;
                default -> null;
            };
        } catch( IOException | FaultException e ) {
            throw new NoSuchQueue( queue_name );
        }
    }
    public void printAll( String request ) throws NoSuchQueue {
        String response;
        while( (response = poll( request )) != null )
            System.out.println( response );
    }
}
```

Here we use the utility method `poll` to call the embedder and extract the information we need from the response, such that we may use in the `printAll` method to print each element of the queue. For the sake of convenience we assume that every element in the queue is of type `string`, but we could also easily enforce this by just making a custom `Queue` Jolie service that wraps `QueueUtils`.

**Important Note**: calling the embedder should only be done from methods that implement operations declared as a `requestResponse`. The reason for this is that operations declared as a `oneWay` are executed asynchronously, and thus there are no guarantees that the embedder is still available by the time the operation is executed.

## Customizing the generation

The `jolie2java` tool is distributed together with Jolie, so if you have Jolie installed you can run the following command:

    jolie2java --help

to get the following message:

    Usage: jolie2java
        [ --translationTarget <0:services | 1:interfaces | 2:types> (default=0 ) ]
        [ --overwriteServices <true|false> (default=false ) ]
        [ --outputDirectory <path> (default="./src/main/java")]
        [ --sourcesPackage <package> (default=".spec" ) ]
        <file>

The possible arguments for the tool are:

- `--translationTarget`: specifying which part of the given Jolie file that should be translated, where
    - `0` means that it should translate every service in the file that is implemented by a Java class, signified by a `foreign java` statement, along with the interfaces they implement. This is the default behaviour.
    - `1` means that it should translate every interface declared in the file, along with every type and fault used as part of their declaration.
    - `2` means that it should translate every type defined in the file.
- `--overwriteServices`: specifying whether the Java services should be overwritten if they already exists. The default value is `false`.
- `--outputDirectory`: specifying where the files should be generated. The default value is `./src/main/java`.
- `--sourcesPackage`: specifying the package where the generated sources should be located. When generating services this can be made relative to the package of each service by prefixing the package name by `.`. The default value is `.spec`.

### When using `create-jolie`

After using the `create-jolie` tool to generate a Java service project, the `package.json` will contain a script to easily generate the file, accessible through the command:

    npm run generate

If you wish to change anything about the generation, e.g. the package of the generated sources for each service, the argument values can be manually edited in the `package.json` file.

Using `create-jolie` will also include a script, accessible through the command:

    npm run clean-generate

that will delete ALL the files in the `src/main/java` folder of the project before generating the files. This can be useful to e.g. remove generated files that are no longer used, however this will remove ALL the service files as well. This can be convenient, if you want to have a new service file that already has all the methods for a newly added interface, but if the goal is only to e.g. remove obsolete type files, the targetted folder of the script should be edited manually.
