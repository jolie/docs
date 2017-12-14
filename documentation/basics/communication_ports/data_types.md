## Data types

In Jolie, the messages exchanged through operations are data trees (see section [Handling Simple Data](/documentation/basics/handling_simple_data.html)). 

A data type defines:

- the structure of a data tree;
- the type of the content of its node;
- the allowed number of occurrences of each node.

### Basic Data Types

The basic data types are the simplest kind of data type in Jolie. 
Their syntax is:

<pre class="syntax">
T ::= { void, bool, int, long, double, string, raw, any }
</pre>

An example of usage of such kind of data types in interface definition is:

<pre><code class="language-jolie code">
interface MyInterface {
    RequestResponse: myOperation( int )( string )
}
</code></pre>

### Custom Data Types

Jolie supports the definition of custom data types, which are a composition of the basic ones.
The simplest custom type is just an alias of a basic type `type CustomType: T`.

#### Nested data types 

Complex custom types can be obtained by defining nested subnodes of the root, the operator to define nesting of nodes is the `.` symbol. The syntax to define nested data types is:

<pre class="syntax">
type CustomType: T {
    .aSubNode: T {
        .aSubSubNode: T {
            ...
        }
    }
    ...
    .anotherSubNode: T { ... }
}
</pre>

Let us see some example of nested data types.

<pre><code class="language-jolie code">
type Coordinates: void {
  .lat: double
  .lng: double
}
</code></pre>

The custom type `Coordinates` is a possible representation of a nested data type to handle coordinates. The root cannot contain any value, while the two nested subnodes are both `double`.

<pre><code class="language-jolie code">
type ShoppingList: void {
  .fruits: int {
    .bananas: int
    .apples: int
  }
  .notes: string
}
</code></pre>

The custom type `ShoppingList` represents a list of items to be bought. In the example the subnode `fruits` contains the sum of all the fruits that should be bought, while its subnodes corresponds to which kind of fruits to buy and their quantity.

#### Subnodes with cardinality

Given `R` as a range, which specifies the allowed number of occurrences of the subnode in a value, `R` could be: 
1. `[min, max]` - an interval from `min` to `max` (both integers);
2. `*` - meaning any number of occurrences, a shortcut for `[0, *]`;
3. `?` - meaning non or one occurrence, a shortcut for `[0, 1]`.

In Jolie, when no cardinality is defined, it is defaulted to the value `[1,1]`, meaning that one and only one occurrence of that subnode can be contained in the node. 

The complete syntax for nested data types with cardinality follows:

<pre class="syntax">
type CustomType: T {
    .aSubNode[R]: T {
        .aSubSubNode[R]: T {
            ...
        }
    }
    ...
    .anotherSubNode[R]: T { ... }
}
</pre>

Lets consider the examples below to illustrate the 3 different cardinality options in Jolie.

<pre><code class="language-jolie code">
type CustomType: T {
  .aSubNode[1,5]: T
}
</code></pre>

In this case cardinalities are defined by occurrences where minimal occurrence of `aSubNode` of type `T` is one and maximum occurrences of the same node are five.

<pre><code class="language-jolie code">
type CustomType: T {
  .aSubNode[0,1]: T
  .anotherSubNode?: T
}
</code></pre>

The example above shows that `?` is a shortcut for `[0,1]` and hence the cardinality of `aSubNode` and `anotherSubNode` are the same.

<pre><code class="language-jolie code">
type CustomType: T {
  .aSubNode[0,*]: T
  .anotherSubNode*: T
}
</code></pre>

The above example shows that `*` is a shortcut for `[0,*]` and hence the cardinality of `aSubNode` and `anotherSubNode` are the same.

Keeping in mind the concept of nested types with cardinality, lets introduce the `undefined` data type, that is, a data type accepting any possible sub-tree. The syntax for `undefined` is shown below.

<pre class="syntax">
type CustomType: any {
    .anySubNode*: any {
        .anySubSubNode*: any {
            ...
        }
    }
    ...
    .anyOtherSubNode*: any { ... }
}
</pre>

In the Jolie language it is possible to use the shortcut as follows: 

<pre><code class="language-jolie code">
type CustomType: undefined
</code></pre>

#### Data types choice (sum types)

Given `Ti` in `{T1, ..., Tn}` nested nodes data types can have any type belonging to `T` (data types in `T` are mutually exclusive).
Lets show one possible example of such property.

<pre><code class="language-jolie code">
type CustomType: void | bool | int | long | double | string | raw | any 
</code></pre>

The same stands between nested data types.

<pre><code class="language-jolie code">
type CustomType: any | any { .subNode: T } | any { .subNode[2,3]: T }
</code></pre>