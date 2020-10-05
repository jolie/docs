# Data Types

In Jolie, the messages exchanged through operations are data trees \(see section [Handling Simple Data](https://jolielang.gitbook.io/docs/basics/handling_simple_data).

A data type defines:

* the structure of a data tree;
* the type of the content of its node;
* the allowed number of occurrences of each node.

## Basic Data Types

The basic data types are the simplest kind of data type in Jolie. Their syntax is:

```jolie
T ::= { void, bool, int, long, double, string, raw, any }
```

An example of usage of such kind of data types in interface definition is:

```jolie
interface MyInterface {
    RequestResponse: myOperation( int )( string )
}
```

## Custom Data Types

Jolie supports the definition of custom data types, which are a composition of the basic ones. The simplest custom type is just an alias of a basic type `type CustomType: T`.

### Nested data types

Complex custom types can be obtained by defining nested subnodes of the root, the operator to define nesting of nodes is the `.` symbol. The syntax to define nested data types is:

```jolie
type CustomType: T {
    .aSubNode: T {
        .aSubSubNode: T {
            ...
        }
    }
    ...
    .anotherSubNode: T { ... }
}
```

Let us see some example of nested data types.

```jolie
type Coordinates: void {
  .lat: double
  .lng: double
}
```

The custom type `Coordinates` is a possible representation of a nested data type to handle coordinates. The root cannot contain any value, while the two nested subnodes are both `double`.

```jolie
type ShoppingList: void {
  .fruits: int {
    .bananas: int
    .apples: int
  }
  .notes: string
}
```

The custom type `ShoppingList` represents a list of items to be bought. In the example the subnode `fruits` contains the sum of all the fruits that should be bought, while its subnodes corresponds to which kind of fruits to buy and their quantity.

A definition of type can be used within another type definition thus to express more complex types. In the example below, fruits are expressed within a custom type and then used in type `ShoppingList`:

```jolie
type Fruits: void {
    .bananas: int
    .apples: int
}

type ShoppingList: void {
    .fruits: Fruits
    .notes: string
}
```

### Subnodes with cardinality

Since each node of a tree in Jolie is a vector, in a type declaration each node requires a cardinality to be specified. The cardinality espresses the minimum and the maximum occurencies for that node \(`[min, max]`\). Cardinality is always expressed in the form:

* `[min, max]` - an interval from `min` to `max` \(both integers\), where `max` can be equal to `*` for defining an unlimited number of occurencies \(`[min, *]`\).

Some special shortcuts can be used for expressing cardinality easily instead of the ordinary syntax with square brackets:

* `*` - meaning any number of occurrences, a shortcut for `[0, *]`.
* `?` - meaning non or one occurrence, a shortcut for `[0, 1]`.
* when no cardinality is defined, it is defaulted to the value `[1,1]`, meaning that one and only one occurrence of that subnode can be contained in the node.

Formally, given `R` as a range, which specifies the allowed number of occurrences of the subnode in a value, the complete syntax for nested data types with cardinality follows:

```jolie
type CustomType: T {
    .aSubNode[R]: T {
        .aSubSubNode[R]: T {
            ...
        }
    }
    ...
    .anotherSubNode[R]: T { ... }
}
```

Lets consider the examples below to illustrate the 3 different cardinality options in Jolie.

```jolie
type CustomType: T {
  .aSubNode[1,5]: T
}
```

_Example_. In this case cardinalities are defined by occurrences where minimal occurrence of `aSubNode` of type `T` is one and maximum occurrences of the same node are five.

```jolie
type CustomType: T {
  .aSubNode[0,1]: T
  .anotherSubNode?: T
}
```

The example above shows that `?` is a shortcut for `[0,1]` and hence the cardinality of `aSubNode` and `anotherSubNode` are the same.

```jolie
type CustomType: T {
  .aSubNode[0,*]: T
  .anotherSubNode*: T
}
```

The above example shows that `*` is a shortcut for `[0,*]` and hence the cardinality of `aSubNode` and `anotherSubNode` are the same.

## Undefined set of subnodes

Jolie provides the term `any { ? }` to capture the type of a tree with any type for the root and an undefined set of subnodes. Jolie also provides a shortcut to `any { ? }` which is the type `undefined`. Hence the two writings below are equal

```jolie
type CustomType: any { ? }
```

```jolie
type CustomType: undefined
```

Let us see a comprehensive example of a custom type with cardinality.

```jolie
type mySubType: void {
 .value: double
 .comment: string
}

type myType: string {

 .x[ 1, * ]: mySubType

 .y[ 1, 3 ]: void {
  .value*: double
  .comment: string
 }

 .z?: void { ? }
}
```

As we can read, nodes `x` and `y` are similarly typed, both are typed as `void` and have two subnodes: `value`, typed as `double`, and `comment`, typed as `string`.

Let us focus on the cardinality. To be valid, the node `myType` must declare:

* at least one nodes `x` of type `mySubType`;
* a range between one and three of `y`.

Referring to the previous example, `x` requires the definition of both nodes `value` and `comment`, while `y` requires only the definition the node `comment`, since none or an infinite number of nodes `myType.y.value` can be defined. The subnode `z` can be present or not, and can contain any kind of subnode \(`{ ? }`\).

## Defining type nodes with reserved characters

Sometimes you may need to define node names that contain special characters, such as @. In these cases, you need to put your node name between double quotes, as in the following example.

```jolie
type TestType: void {
    ."@node": string
}
```

You can access these nodes with special characters by using dynamic look-up, for example x.\("@node"\). This is explained more in detail in [data structures](https://github.com/jolie/docs/tree/c05a0cef52a6b00c2a807bcadb983fb0ad7840f7/basics/interfaces/basic/data_structures/README.md).

_Attention: This feature is available from Jolie 1.6.2._

## Data types choice \(sum types\)

Given `Ti` in `{T1, ..., Tn}` nested nodes data types can have any type belonging to `T` \(data types in `T` are mutually exclusive\). Let us show one possible example of such property.

```jolie
type CustomType: void | bool | int | long | double | string | raw | any
```

The same stands between nested data types.

```jolie
type CustomType: any | any { .subNode: T } | any { .subNode[2,3]: T }
```

## Checking types at runtime: `istanceof`

See section [Handling Simple Data/Rutime type checking of a variable](https://jolielang.gitbook.io/docs/basics/handling_simple_data#runtime-type-checking-of-a-variable-instanceof) for getting details about pritimive `instanceof`

