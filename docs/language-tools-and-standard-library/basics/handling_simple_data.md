# Handling Simple Data

## Basic data types

Jolie is a dynamically typed language: variables do not need to be declared, and they do not need to be assigned a type in advance by the programmer. The value of a variable is type checked at runtime, whenever messages are sent or received to/from other services.

Jolie supports seven basic data types:

* `bool`: booleans;
* `int`: integers;
* `long`: long integers \(with `L` or `l` suffix\);
* `double`: double-precision float \(decimal literals\);
* `string`: strings;
* `raw`: byte arrays;
* `void`: the empty type.

Values of type `raw` cannot be created directly by the programmer, but are supported natively for data-passing purposes.

Furthermore, Jolie supports the `any` basic type, which means a value that can be of any basic type.

In the following example, differently typed values are passed into the same variable:

```jolie
a = 5
a = "Hello"
```

Jolie supports some basic arithmetic operators:

* add \(`+`\)
* subtract \(`-`\)
* multiply \(`*`\)
* divide \(`/`\)
* modulo \(`%`\) 

Their behaviour is the same as in other classical programming languages. The language also supports pre-/post-increment \(`++`\) and pre-/post-decrement \(`--`\) operators.

An example of the aforementioned operators follows:

```jolie
a = 1
b = 4

n = a + b/2 // n = 3
n++ // n = 4
n = ++a + (b++)/2 // n = 4
```

Additional meanings: `+` is the string concatenator and matches the OR on `bool`s \(`||`\), `*` matches the AND on `bool`s \(`&&`\) and `undefined - var` matches the negation on `bool`s \(`!`\).

## Casting and checking variable types

Variables can be cast to other types by using the corresponding casting functions: `bool()`, `int()`, `long()`, `double()`, and `string()`. Some examples follow:

```jolie
s = "10";
n = 5 + int( s ); // n = 15

d = "1.3";
n = double( d ); // n = 1.3
n = int ( n ) // n = 1
```

## Runtime type checking of a variable: `instanceof`

A variable type can be checked at runtime by means of the `instanceof` operator, whose syntax is:

```text
expression instanceof (native_type | custom_type)
```

`instanceof` operator can be used to check variable typing with both native types and custom ones \(see type subsection in [Data Types](https://jolielang.gitbook.io/docs/basics/interfaces/data_types) section\). Example:

```jolie
s = "10";
n = s instanceof string; // n = true
n = s instanceof int; // n = false
n = ( s = 10 ) instanceof int; // n = true
```

## Working with strings

Strings can be inserted enclosing them between double quotes. Character escaping works like in C and Java, using the `\` escape character:

```jolie
s = "This is a string\n"
```

Strings can be concatenated by using the plus operator:

```jolie
s = "This is " + "a string\n"
```

String formatting is preserved, so strings can contain tabs and new lines:

```jolie
s = "
JOLIE preserves formatting.
    This line will be indented.
                    This line too.
"
```

## Undefined variables

All variables start as undefined; that is, they are not part of the state of the program. A variable becomes defined when a value is assigned to it.

To check whether a variable is defined, you can use the primitive predicate `is_defined`:

```jolie
a = 1
c1 = is_defined( a ) // c1 is true
c2 = is_defined( b ) // c2 is false
```

Sometimes it is useful to undefine a variable, i.e., to remove its value and make it undefined again. Undefining a variable is done by using the `undef` statement, as shown in the example below.

```jolie
a = 1
undef( a )
if ( is_defined( a ) ) {
    println@Console( "a is defined" )()
} else {
    println@Console( "a is undefined" )()
}
```

The operators behave like this:

* `undefined + var = var`
* `undefined - var = -var` \(negation of numbers and booleans\)
* `undefined * var = var`
* `undefined / var = 0`
* `undefined % var = var`

## Dynamic arrays

[Arrays](http://en.wikipedia.org/wiki/Array_data_structure) in Jolie are [dynamic](http://en.wikipedia.org/wiki/Dynamic_array) and can be accessed by using the `[]` operator, like in many other languages.

Example:

```jolie
a[ 0 ] = 0;
a[ 1 ] = 5;
a[ 2 ] = "Hello";
a[ 3 ] = 2.5
```

A key point for understanding and programming services in Jolie is that every variable is actually a dynamic array.

Jolie handles dynamic array creation and packing. This makes dealing with complex data easier, although Jolie hides this mechanism when the programmer does not need it. Whenever an array index is not specified, the implicit index for that variable is set by default to 0 \(zero\), like shown in the example below.

```jolie
a = 1 // Jolie interprets this as a[0] = 1
println@Console( a[ 0 ] )() // Will print 1
```

### Array size operator `#`

Since its dynamic-array orientation, one handy feature provided by Jolie is the array size operator `#`, which can be used as shown in the examples below.

```jolie
a[ 0 ] = 0;
a[ 1 ] = 1;
a[ 2 ] = 2;
a[ 3 ] = 3;
println@Console( #a )() // Will print 4
```

### Nested arrays

Jolie\'s type system does not permit directly nested arrays as known in other programming languages. This limitation may be compensated by the introduction of children nodes \(explained in [Data Structures](https://jolielang.gitbook.io/docs/basics/data_structures)\).

Example: The two-dimensional array `a` may not be defined nor accessed by `a[i][j]`, but `a[i].b[j]` is possible.

Notice

Certain input formats as JSON allow directly nested arrays though, e.g. `[[1,2],[3,4]]` . For this reason Jolie\'s JSON parser automatically inserts a `_` -named children node for each array. If the JSON data was saved in the variable `matrix` , a single value may be obtained by `matrix._[i]._[j]` .

The underscore trick works in both directions: by expressing nested arrays in this way, all `_` -named members again disappear on conversion \(back\) into JSON.

