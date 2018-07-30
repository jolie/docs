# Define

In the [Hello World](https://github.com/jolielang/docs/tree/de0bcc5b82206ed6be6cb78fa10f6068bbe5881c/documentation/getting_started/hello_world.html) section we have introduced the role of the `main` procedure, which is the entry point for execution.

The `main` procedure may be preceded or succeeded by the definition of auxiliary procedures that can be invoked from any other code block, and can access any data associated with the specific instance they belong to. Unlike in other major languages, procedures in Jolie do not posses a local variable scope.

In Jolie procedures are defined by the `define` keyword, which associates a unique name to a block of code. Its syntax follows:

```text

define procedureName 
{
    ...
    code
    ...
}
```

For example, the code below is valid:

```text
define sumProcedure
{
    sum = x + y    
}

main
{
    x = 1;
    y = 2;
    sumProcedure    
}
```

