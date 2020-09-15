# Constants

It is possible to define constants by means of the construct `constants`. The declarations of the constants are divided by commas. The syntax is:

```jolie
constants {
    const1 = val1,
    const2 = val2,
    ...
    contsn = valn
}
```

As an example let us consider the following code:

```jolie
constants {
    Server_location = "socket://localhost:8080",
    ALARM_TIMEOUT = 2000,
    standard_gravity = 9.8
}
```

Constants might also be assigned on the command line. Just call a program using `jolie -C server_location=\"socket://localhost:4003\" program.ol` to override `Server_location`. We can even remove its declaration from the `constants` list in case of a mandatory command line assignment.

**Attention.** Under Windows `=` is a parameter delimiter. To correctly use the command line option `-C` make sure to enclose the assignment of the constant between single or double quotes like `jolie -C "server_location=\"socket://localhost:4003\"" program.ol` .

