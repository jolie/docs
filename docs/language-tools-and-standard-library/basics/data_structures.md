# Data Structures

## Jolie data structures

Jolie data structures are tree-like similarly to XML data trees or JSON data trees.

## Creating a data structure

Let us create a root node, named `animals` which contains two children nodes: `pet` and `wild`. Each of them is an array with two elements, respectively equipped with another sub-element \(its name\).

```jolie
main
{
    animals.pet[0].name = "cat";    
    animals.pet[1].name = "dog";    
    animals.wild[0].name = "tiger";    
    animals.wild[1].name = "lion"
}
```

Equivalent representations of the structure of `animals` in XML and JSON are, respectively:

```jolie
<animals>
    <pet>
        <name>cat</name>
    </pet>
    <pet>
        <name>dog</name>
    </pet>
    <wild>
        <name>tiger</name>
    </wild>
    <wild>
        <name>lion</name>
    </wild>
</animals>
```

```jolie
animals : {

    "pet" : [
        { "name" : "cat" },

        { "name" : "dog" }
    ],
    "wild" : [
        { "name":"tiger" },

        { "name":"lion" }
    ]

}
```

**Attention.** It is worth noting that each node of a tree is potentially an array of elements. If no index is defined, the first elements is always considered. Otherwise, the element index is always defined between square brackets \[\].

## Navigating data structures

Data structures are navigated using the `.` operator, which is the same used for creating nested structures. The structures created by nesting variables are called _variable paths_. Some examples of valid variable paths follows:

```jolie
myVar; // our variable AND the first element of the array
myVar[0]; // the first element of the array. Equivalent to myVar
myVar[i]; // the i-th element of the array
myVar.b[3]; // the fourth element of the array b nested in myVar
myVar.b.c.d // the d element nested in c nested in b nested in myVar
```

`.` operator requires a single value operand on its left. Thus if no index is specified, it is defaulted to 0. In our example the variable path at Line 5 is automatically translated to:

```jolie
myVar[0].b[0].c[0].d
```

## Dynamic look-up

Nested variables can be identified by means of a string expression evaluated at runtime.

Dynamic look-up can be obtained by placing a string between round parentheses. Let us consider the `animals` structure mentioned above and write the following instruction:

```jolie
println@Console( animals.( "pet" )[ 0 ].name )()
```

The string `"pet"` is evaluated as an element's name, nested inside `animals` structure, while the rest of the variable path points to the variable `name` corresponding to `pet`'s first element. Thus the output will be `cat`.

Also a concatenation of strings can be used as an argument of a dynamic look-up statement, like in the following example, which returns the same result as the previous one.

```jolie
a = "pe";
println@Console( animals.( a + "t" )[ 0 ].name )()
```

## `foreach` - traversing items

Data structures can be navigated by exploiting the `foreach` statement, whose syntax is:

```jolie
foreach ( nameVar : root ) {
    //code block
}
```

`foreach` operator looks for any child-node name inside `root` and puts it inside `nameVar`, executing the internal code block at each iteration.

Combining `foreach` and dynamic look-up is very useful for navigating and handling nested structures:

```jolie
include "console.iol"

main {
  animals.pet[0].name = "cat";
  animals.pet[1].name = "dog";
  animals.wild[0].name = "tiger";
  animals.wild[1].name = "lion";

  foreach ( kind : animals ){
    for ( i = 0, i < #animals.( kind ), i++ ) {
        println@Console( "animals." + kind + "[" + i + "].name=" + animals.( kind )[ i ].name )()
    }
  }
}
```

In the example above `kind` ranges over all child-nodes of `animals` \(`pet` and `wild`\), while the `for` statement ranges over the elements of the current `animals.kind` node, printing both it's path in the structure and its content:

```jolie
animals.pet[0].name=cat
animals.pet[1].name=dog
animals.wild[0].name=tiger
animals.wild[1].name=lion
```

## `with` - a shortcut to repetitive variable paths

`with` operator provides a shortcut for repetitive variable paths.

In the following example the same structure used in previous examples \(`animals`\) is created, avoiding the need to write redundant code:

```jolie
with ( animals ){
    .pet[ 0 ].name = "cat";
    .pet[ 1 ].name = "dog";
    .wild[ 0 ].name = "tiger";
    .wild[ 1 ].name = "lion"
}
```

**Attention.** The paths starting with `.` within the scope of the `with` operator are just shortcuts. Hence, when writing paths with dynamically evaluated values, e.g., array lengths, the path declared as argument of the `with` operator is evaluated for each subpath in the body of the `with` .

For instance, the code below

```jolie
with ( myArray[ #myArray ] ) {
    .first     = "1";
    .second = "2";
    .third    = "3"
}
```

will unfold as the one below

```jolie
myArray[ #myArray ].first  = "1";
myArray[ #myArray ].second = "2";
myArray[ #myArray ].third  = "3"
```

At each line \`\#myArray\` returns the size of \`myArray\`, which increases at each assignment, yielding the structure:

```jolie
myArray[ 0 ].first[ 0 ] = "1"
myArray[ 1 ].second[ 0 ] = "2"
myArray[ 2 ].third[ 0 ] = "3"
```

## `undef` - erasing tree structures

A structure can be completely erased - undefined - using the statement `undef`:

```jolie
undef( animals )
```

## `<<` - copying an entire tree structure

The deep copy operator `<<` copies an entire tree structure into another.

```jolie
zoo.sector_a << animals; undef( animals )
```

In the example above the structure `animals` is completely copied in structure `sector_a`, which is a nested element of the structure `zoo`. Therefore, even if `animals` is undefined at Line 2, the structure `zoo` contains its copy inside `section_a`.

For the sake of clarity a representation of the `zoo` structure is provided as it follows:

```jolie
<zoo>
  <sector_a>
    <pet>
      <name>cat</name>
    </pet>
    <pet>
      <name>dog</name>
    </pet>
    <wild>
      <name>tiger</name>
    </wild>
    <wild>
      <name>lion</name>
    </wild>
  </sector_a>
</zoo>
```

**Attention.** At runtime `d<< s` explores the source \(tree `s`\) node-wise and for all initialised sub-nodes in `s`, e.g., `s.path.to.subnode`, it assigns the value of `s.path.to.subnode` to the corresponding sub-node rooted in `d`. According to the example `d.path.to.subnode = s.path.to.subnode`. This means that if `d` already had initialised sub-nodes, `d<< s` will overwrite all the correspondent sub-nodes of `s` rooted in `d`, leaving all the others initialised node of `d` unaffected.

```jolie
d.greeting = "hello";
d.first = "to the";
d.first.second = "world";
d.first.third = "!";

s.first.first = "to a";
s.first.second = "brave";
s.first.third = "new";
s.first.fourth = "world";

d << s
```

The code above will change the structure of `d` from this:

```jolie
d
|_ greeting = "hello"
|_ first = "to the"
    |_ first.second = "world"
    |_ first.third = "!"
```

to this

```jolie
d
|_ greeting = "hello"
|_ first
    |_ first = "to a"
    |_ second = "brave"
    |_ third = "new"
    |_ fourth = "world"
```

Note that node `d.first` has been overwritten entirely by the subtree `s.first` which is defined as an empty node with four sub-nodes.

## `->` - structures aliases

A structure element can be an alias, i.e. it can point to another variable path.

Aliases are created with the `->` operator, like in the following example:

```jolie
myPets -> animals.pet;
println@Console( myPets[ 1 ].name )(); // will print dog
myPets[ 0 ].name = "bird"; // will replace animals.pet[ 0 ].name value with "bird"
println@Console( animals.pet[ 0 ].name )() // will print "bird"
```

Aliases are evaluated every time they are used.

Thus we can exploit aliases to make our code more readable even when handling deeply nested structure like the one in the example below:

```jolie
include "console.iol"

main {
  with ( a.b.c ){
    .d[ 0 ] = "zero";
    .d[ 1 ] = "one";
    .d[ 2 ] = "two";
    .d[ 3 ] = "three"
  };
  currentElement -> a.b.c.d;

  for ( i = 0, i < #currentElement, i++ ) {
      println@Console( currentElement[ i ] )()
  }
}
```

The alias `currentElement` is used to refer to the `i`-th element of `d` nested inside `a.b.c`. At each iteration the alias is evaluated, using the current value of `i` variable as index. Therefore, the example's output is:

```jolie
zero
one
two
three
```

