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

### Refined Basic Data Types
Basic data types can be refined in order to restrict the valid values. Depending on the basic data type there are different refinement available. In the following table there is the list of all the avaiable refinements. *it is possible to use only 1 refinement for each basic type declaration*. 

| Basic Type   | Available Refinements |
|:------------:|----------------------:|
| *string*     | length, regex, enum   |
| *int*        | ranges                |
| *long*       | ranges                |
| *double*     | ranges                | 

When a value that does not respect the refinement type is forced to be used a *TypeMismatché will be raised by the interpreter.

#### Refinement: length
This refinement allows for specifying the minimum and the maximum lenght of a string. The minimum and the maximum lenght must be specify as a couple of values between square brackets. Example:
```text
type MyType {
    my_refined_string_field: string( length( [2,5] ) )
}
```
In this example the field `my_refined_string_field` is a string which must have at least two characters and not more than five characters. Values like `"home"`, `"dog"`, `"eye"`, etc are admitted, whereas values like `"I"`, `"keyboard"`,`"screen"`, etc are not admitted. 

#### Refinement: regex
This refinement allows for specifying the regular expression a string must respect.
In the following example we set an email field to respect some structural charaters like `"@"` and `"."`.
```text
type MyType {
  email: string( regex(".*@.*\\..*") )
}
```
Note that Jolie uses the `dk.brics.automaton` library for managing regular expressions, thus you may consult this link as a reference for composing the regular expressions: [Composing regular expressions in Jolie string basic type refinement](https://www.brics.dk/automaton/doc/index.html?dk/brics/automaton/RegExp.html)

#### Refinement: enum
This refinement allows for specifying a set of available values for the string.
In the follwwing example, only the values `"paul"`,`"homer"`,`"mark"`are admitted for the field name:
```text
type MyType {
  name: string( enum(["paul","homer","mark"]))
}
```

#### Refinement: ranges
This refinement allows for specifying a list of valid intervals for an integer, a double or a long.
In the following example, we show a type with three fields with different basic types. Each of them uses a refinement `ranges` for restriciting the possible values.

```text
type MyType {
  f1: int( ranges( [1,4], [10,20], [100,200], [300, *]) )
  f2: long( ranges( [3L,4L], [10L,20L], [100L,200L], [300L, *]) )
  f3: double( ranges( [4.0,5.0], [10.0,20.0], [100.0,200.0], [300.0, *]) )
}
```
The token `*` is used for specifyng an unbounded maximum limit.
In this example the field `f1` can be an integer which respects one of the following conditions, where `v` is the actual value:

* 1 <= v <= 4
* 10 <= v <= 20
* 100 <= v <= 200
* 300 <= v 

Note that, depending on the basic type, the minimum and the maximum values of each interval must be expressed with the related notation: using `L` for denoting long valued and usinf `.` for specifying the usage of decimals in the case of double.


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

