# Procedures



The `main` procedure may be preceded or succeeded by the definition of auxiliary procedures that can be invoked from any other code block, and can access any data associated with the specific instance they belong to. Unlike in other major languages, procedures in Jolie do not have a local variable scope.

In Jolie procedures are defined by the `define` keyword, which associates a unique name to a block of code. Its syntax follows:

```jolie
define procedureName 
{
    ...
    code
    ...
}
```

For example, the code below is valid:

```jolie
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

