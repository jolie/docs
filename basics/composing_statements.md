# Composing Statements

## Defining a Jolie application behaviour

The behaviour of a Jolie application is defined by conditions, loops, and statement execution rules.

Whilst conditions and loops implement the standard conditional and iteration constructs, execution rules defines the priority among code blocks.

## Statement execution operators

Jolie offers three kinds of operators to compose statements in sequence, parallel, or as a set of input choices.

## Sequence

The sequence operator `;` denotes that the left operand of the statement is executed _before_ the one on the right. The sequence operator syntax is:

```text

statementA ; statementB
```

A valid use of the sequence operator is as it follows:

```text
main
{
    print@Console( "Hello, " )();
    println@Console( "world!" )()
}
```

Attention

Keep in mind that, in Jolie, `;` is NOT the "end of statement" marker. For the sake of clarity, let us consider an INVALID use of the sequence operator:

```text
main
{
    print@Console( "Hello, " )();
    println@Console( "world!" )(); // 
```

## Parallel

The parallel operator `|` states that both left and right operands are executed _concurrently_. The syntax of the parallel operator is:

```text

statementA | statementB

```

It is a good practice to explicitly group statements when mixing sequence and parallel operators. Statements can be grouped by enclosing them within an unlabelled [scope](/docs/fault_handling/basics) represented by a pair curly brackets `{}`, like in the following example:

```text
{ statementA ; statementB ; ... ; statementF }
|
{ statementG ; statementH }
```

The parallel operator has always priority on the sequence one, thus the following code snippets are equivalent:

```text
A ; B | C ; D
```

```text
{A ; B} | {C ; D}
```

Parallel execution is especially useful when dealing with multiple services, in order to minimize waiting times by managing multiple communications at once.

In this example we concurrently retrieve information from both a forecast and a traffic service:

```text
main
{
    getTemperature@Forecast( city )( temperature ) |
    getData@Traffic( city )( traffic );

    println@Console( "Request served!" )()
}
```

[Click here to download the comprehensive code of the example above.](/docs/basics/code/composing_statements_parallel.zip)

Concurrent access to shared variables can be restricted through [synchronized](/docs/basics/processes) blocks.

## Input choice

The input choice implements **input-guarded choice**. Namely, it supports the receiving of a message for any of the statements in the choice. When a message for an input statement `IS_i` can be received, then all the other branches are deactivated and `IS_i` is executed. Afterwards, the related branch behaviour `branch_code_1` is executed. A static check enforces all the input choices to have different operations, so to avoid ambiguity.

The syntax of an input choice is:

```text

[ IS_1 ] { branch_code_1 }
[ IS_i ] { branch_code_i }
[ IS_n ] { branch_code_n }

```

Let us consider the example below in which only `buy` or `sell` operation can execute, while the other is discarded.

```text
[ buy( stock )( response ) {
    buy@Exchange( stock )( response )
} ] { println@Console( "Buy order forwarded" )() }

[ sell( stock )( response ) {
    sell@Exchange( stock )( response )
}] { println@Console( "Sell order forwarded" )() }
```

## The provide-until statement

The `provide` `until` statement eases defining workflows where a microservice _provides_ access to a set of resources _until_ some event happened. 

The syntax is 

```text
provide
  [ IS_1 ] { branch_code_1 }
  [ IS_i ] { branch_code_i }
  [ IS_n ] { branch_code_n }
until
  [ IS_m ] { branch_code_m }
  [ IS_j ] { branch_code_j }
  [ IS_k ] { branch_code_k }
```

The inputs `IS_1, ..., IS_n` will be continuously available until one of the operations under the `until` \(`IS_m, ..., IS_k`\) is called.

## Conditions and conditional operator

Conditions are used in control flow statements in order to check a boolean expression. Conditions can use the following relational operators:

* `==`: is equal to;
* `!=`: is not equal to;
* `<`: is lower than;
* `<=`: is lower than or equal to;
* `>`: is higher than;
* `>=`: is higher than or equal to;
* `!`: negation

Conditions can be used as expressions and their evaluation always returns a boolean value \(true or false\). That value is the argument of conditional operators.

Some valid conditions are:

```text
x == "Hi"
!x
25 = 10
```

The statement `if ... else` is used to write deterministic choices:

```text

if ( condition ) {
    ...
} [else {
    ...
}]
```

Note that the `else` block is optional \(denoted by its enclosure in square brackets\).

Like in many other languages, the `if ... else` statement can be nested and combined:

```text
if ( !is_int( a ) ) {
    println@Console( "a is not an integer" )()
} else if ( a > 50 ) {
    println@Console( "a is major than 50" )()
} else if ( a == 50 ) {
    println@Console( "a is equal to 50" )()
} else {
    println@Console( "a is minor than 50" )()
}
```

## for and while

The `while` statement executes a code block as long as its condition is true.

```text

while( condition ) {
    ...
}
```

Like the `while` statement, `for` executes a code block as long as its condition is true, but it explicitly defines its initialization code and the post-cycle code block, which is executed after each iteration.

```text

for( init-code-block, condition, post-cycle-code-block ) {
    ...
}
```

Example:

```text
for( i = 0, i 
```

### Iterating over arrays

Attention Arrays and the `#` operator are explained in detail in the [Data Structures](/docs/basics/data_structures) section.

Another form of `for` loops is the following, which iterates over all elements of an array `a`.

```text
for( element in a ) {
    println@Console( element )()
}
```

This is equivalent to the following code, but it is much less error-prone, so it is recommended to use the code above instead of the one below.

```text
for( i = 0, i < #a, i++ ){
    println@Console( a[i] )
}
```

