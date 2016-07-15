## Jolie data structures

Jolie data structures are tree-like. It is easier to understand them by making a comparison between a data structure in Jolie and its equivalent in XML.

## Creating a data structure

Let us create a root node, named `animals` which contains two children nodes: `pet` and `wild`. Each of them is an array with two elements, respectively equipped with another sub-element (its name).

<pre class="code">
main
{
	animals.pet[0].name = "cat";	
	animals.pet[1].name = "dog";	
	animals.wild[0].name = "tiger";	
	animals.wild[1].name = "lion"
}
</pre>

Equivalent representations of the structure of `animals` in XML and JSON are, respectively:

<div style="overflow:auto"><div style="width:49%; float:left;"><pre class="code">
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
</pre></div>
<div style="width:49%; float:left;"><pre class="code">
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
</pre></div></div>

---

## Navigating data structures

Data structures are navigated using the `.` operator, which is the same used for creating nested structures. The structures created by nesting variables are called *variable paths*. Some examples of valid variable paths follows:

<pre class="code">
myVar; // our variable AND the first element of the array
myVar[0]; // the first element of the array. Equivalent to myVar
myVar[i]; // the i-th element of the array
myVar.b[3]; // the fourth element of the array b nested in myVar
myVar.b.c.d // the d element nested in c nested in b nested in myVar
</pre>

`.` operator requires a single value operand on its left. Thus if no index is specified, it is defaulted to 0. In our example the variable path at Line 5 is automatically translated to:

<pre class="code">
myVar[0].b[0].c[0].d
</pre>

---

## Dynamic look-up

Nested variables can be identified by means of a string expression evaluated at runtime.

Dynamic look-up can be obtained by placing a string between round parentheses. Let us consider the `animals` structure mentioned above and write the following instruction:

<pre class="code">
println@Console( animals.( "pet" )[ 0 ].name )()
</pre>

The string `"pet"` is evaluated as an element's name, nested inside `animals` structure, while the rest of the variable path points to the variable `name` corresponding to `pet`'s first element. Thus the output will be `cat`.

Also a concatenation of strings can be used as an argument of a dynamic look-up statement, like in the following example, which returns the same result as the previous one.

<pre class="code">
a = "pe";
println@Console( animals.( a + "t" )[ 0 ].name )()
</pre>

---

## `foreach` - traversing items 

Data structures can be navigated by exploiting the `foreach` statement, whose syntax is:

<pre class="syntax">
foreach ( nameVar : root ) {
	//code block
}
</pre>

`foreach` operator looks for any child-node name inside `root` and puts it inside `nameVar`, executing the internal code block at each iteration. 

Combining `foreach` and dynamic look-up is very useful for navigating and handling nested structures:

<pre class="code">
foreach ( kind : animals ){
	for ( i = 0, i < #animals.( kind ), i++  ){
		println@Console( "animals." + kind + "[" + i + "].name = " +
							animals.( kind )[ i ].name )()
	}
}
</pre>

In the example above `kind` ranges over all child-nodes of `animals` (`pet` and `wild`), while the `for` statement ranges over the elements of the current `animals.kind` node, printing both it's path in the structure and its content:

<pre class="code">
animals.pet[0].name=cat
animals.pet[1].name=dog
animals.wild[0].name=tiger
animals.wild[1].name=lion
</pre>

---

## `with` - a shortcut to repetitive variable paths

`with` operator provides a shortcut for repetitive variable paths.

In the following example the same structure used in previous examples (`animals`) is created, avoiding the need to write redundant code:

<pre class="code">
with ( animals ){
	.pet[ 0 ].name = "cat";
	.pet[ 1 ].name = "dog";
	.wild[ 0 ].name = "tiger";
	.wild[ 1 ].name = "lion"
}
</pre>

<div class="panel panel-primary">
  <div class="panel-heading">
    <p class="panel-title">Attention</p>
  </div>
  <div class="panel-body">
    <p>The paths starting with <code>.</code> within the scope of the <code>with</code> operator are just shortcuts.</p>
    <p>Hence, when writing paths with dynamically evaluated values, e.g., array lengths, the path declared as argument of the <code>with</code> operator is evaluated for each subpath in the body of the <code>with</code>.</p>
    <p>For instance, the code below</p>
    <pre class="code">
with ( myArray[ #myArray ] ) {
	.first 	= "1";
	.second = "2";
	.third	= "3"
}
</pre>
    <p>will unfold as the one below</p>
    <pre class="code">
myArray[ #myArray ].first  = "1";
myArray[ #myArray ].second = "2";
myArray[ #myArray ].third  = "3"

</pre>
    <p>At each line `#myArray` returns the size of `myArray`, which increases at each assignment, yielding the structure:</p>
    <pre>
myArray[ 0 ].first[ 0 ] = "1"
myArray[ 1 ].second[ 0 ] = "2"
myArray[ 2 ].third[ 0 ] = "3"
    </pre>
  </div>
</div>

---

## `undef` - erasing tree structures

A structure can be completely erased - undefined - using the statement `undef`:

<pre class="code">
undef( animals )
</pre>

---

## `<<` - copying an entire tree structure

The deep copy operator `<<` copies an entire tree structure into another.

<pre class="code">
zoo.sector_a << animals;
undef( animals )
</pre>

In the example above the structure `animals` is completely copied in structure `sector_a`, which is a nested element of the structure `zoo`. Therefore, even if `animals` is undefined at Line 2, the structure `zoo` contains its copy inside `section_a`. 

For the sake of clarity a representation of the `zoo` structure is provided as it follows:

<pre class="code">
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
</pre>

<div class="panel panel-primary">
  <div class="panel-heading">
    <p class="panel-title">Attention</p>
  </div>
  <div class="panel-body">
    <p>At runtime <code>d << s</code> explores the source (tree <code>s</code>) node-wise and for all initialised sub-nodes in <code>s</code>, e.g., <code>s.path.to.subnode</code>, it assigns the value of <code>s.path.to.subnode</code> to the corresponding sub-node rooted in <code>d</code>. According to the example <code>d.path.to.subnode = s.path.to.subnode</code>.
    This means that if <code>d</code> already had initialised sub-nodes, <code>d << s</code> will overwrite all the correspondent sub-nodes of <code>s</code> rooted in <code>d</code>, leaving all the others initialised node of <code>d</code> unaffected.
    </p>
    <pre class="code">
d.greeting = "hello";
d.first = "to the";
d.first.second = "world";
d.first.third = "!";

s.first.first = "to a";
s.first.second = "brave";
s.first.third = "new";
s.first.fourth = "world";

d << s
</pre>
    <p>The code above will change the structure of <code>d</code> from this:</p>
    <pre>
d
|_ greeting = "hello"
|_ first = "to the"
	|_ first.second = "world"
	|_ first.third = "!"
    </pre>
    <p>to this</p>
    <pre>
d
|_ greeting = "hello"
|_ first
	|_ first = "to a"
	|_ second = "brave"
	|_ third = "new"
	|_ fourth = "world"
    </pre>
    <p>Note that node <code>d.first</code> has been overwritten entirely by the subtree <code>s.first</code> which is defined as an empty node with four sub-nodes.</p>
  </div>
</div>


---


## `->` - structures aliases

A structure element can be an alias, i.e. it can point to another variable path.

Aliases are created with the `->` operator, like in the following example:

<pre class="code">
myPets -> animals.pet;
println@Console( myPets[ 1 ].name )(); // will print dog
myPets[ 0 ].name = "bird"; // will replace animals.pet[ 0 ].name value with "bird"
println@Console( animals.pet[ 0 ].name )() // will print "bird"
</pre>

<div class="attention"><p>Aliases are evaluated every time they are used.</p></div>

Thus we can exploit aliases to make our code more readable even when handling deeply nested structure like the one in the example below:

<pre class="code">
with ( a.b.c ){
	.d[ 0 ] = "zero";
	.d[ 1 ] = "one";
	.d[ 2 ] = "two";
	.d[ 3 ] = "three"
};
currentElement[ 0 ] -> a.b.c.d[ i ];

for ( i = 0, i < #a.b.c.d, i++ ){
	println@Console( currentElement )()
}
</pre>

The alias `currentElement[ 0 ]` is used to refer to the `i`-th element of `d` nested inside `a.b.c`. At each iteration the alias is evaluated, using the current value of `i` variable as index. Therefore, the example's output is:

<pre class="code">
zero
one
two
three
</pre>
