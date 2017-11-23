## Data types

In Jolie, the messages exchanged through operations are data trees (see section [Handling Simple Data](/documentation/basics/handling_simple_data.html)). A data type defines:

- the structure of a data tree;
- the type of the content of its node;
- the allowed number of occurrences of each node.

Let us consider an iterative explanation of data types syntax:

### Basic data types

The simplest kind of data types is the basic-typed one, whose syntax is:

<pre class="syntax">
basic_type: {string, int, long, double, bool, raw, void, any}

type T: basic_type
</pre>

An example of such kind of data types is:

<pre><code class="language-jolie code">type Name: string
</code></pre>

### Subtree data types

A type *T* can (optionally) have a list of named subnode types or the `undefined` keyword, which makes the type accepting any subtree (undefined is a shorcut for `any: { ? }`).

<pre class="syntax">
type T: basic_type {
    .subnode_1: basic_type
    ...
    .subnode_n: basic_type
}

OR

type T: basic_type {
    undefined
}
</pre>

<div class="attention"><p>Subnodes are always prefixed by the `.` symbol.</p></div> 

Furthermore, given *Ti* in *{T1, ..., Tn}* subtree data types, subnode types can have basic or custom types:

<pre class="syntax">
type T: basic_type {
    .subnode_1: (basic_type OR Ti)
    ...
    .subnode_n: (basic_type OR Ti)
}
</pre>

### Custom-typed subtree data types with cardinality

Given R as a range, which specifies the allowed number of occurrences of the subnode in a value, `R = { [min, max], \*, ?}`. Therefore, `R` can be an interval from `min` to `max` (both integers), `*` is a shortcut, meaning any number of occurrences (`[0, *]`), and `?` is a shortcut for `[0, 1]`.

In Jolie, when no cardinality is defined, it is defaulted to the value `[1,1]`, meaning that one and only one occurrence of that subnode can be contained in the node. 

Considering `Ti` in `{T1, ..., Tn}` custom-typed subtree data types and *R* range, the complete syntax for data types follows:

<pre class="syntax">
type T: basic_type {
    .subnode_1[R]: (basic_type OR Ti)
    ...
    .subnode_n[R]: (basic_type OR Ti)
}
</pre>

Let us consider the previous example, in which the operation `sum` defines the types of its request and response messages, respectively, as a complex type `SumRequest` and a native type `int`. Hence the declaration of `SumRequest` follows:

<pre><code class="language-jolie code">type SumRequest: void {
    .number [ 2, * ]: int
}
</code></pre>

The declaration above reads: `SumRequest` is a void-typed node, containing a subtree of nodes among which at least two must be `number`s of native type `int`. 

A type declaration can be used in other type declarations, like in the example below:

<pre><code class="language-jolie code">type mySubType: void {
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
</code></pre>

As we can read, nodes `x` and `y` are similarly typed, both are typed as `void` and have two subnodes: `value`, typed as `double`, and `comment`, typed as `string`.

Let us focus on the cardinality. To be valid, the node `myType` must declare:

- at least one nodes `x` of type `mySubType`;
- a range between one and three of `y`.

Referring to the previous example, `x` requires the definition of both nodes `value` and `comment`, while `y` requires only the definition the node `comment`, since none or an infinite number of nodes `myType.y.value` can be defined. The subnode `z` can be present or not, and can contain any kind of subnode (`{ ? }`).

---