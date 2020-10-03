# Running a Jolie service with arguments

## Running a Jolie service with arguments

Jolie services can read arguments from the command line. Arguments are stored in a vector called `args`, where the first argument can be retrieved at index 0, the second argument at index 1 and so on.

```jolie
include "console.iol"

main
{
    println@Console( args[0] )()
}
```

Save the file with the name `mySecondJolieService.ol` and try to run it in the following way:

```jolie
jolie mySecondJolieService.ol Hi!
```

