# Engine Arguments

When executed, the jolie engine can be parametrized with some arguments. The complete list can be checked by typing `jolie --help`. whose result in the console is:

```text
Usage: jolie [options] behaviour_file [program arguments]

Available options:
    -h, --help                                        Display this help information
    -C ConstantIdentifier=ConstantValue                Sets constant ConstantIdentifier to ConstantValue before starting execution 
                                                       (under Windows use quotes or double-quotes, e.g., -C "ConstantIdentifier=ConstantValue" )
    --connlimit [number]                              Set the maximum number of active connection threads
    --conncache [number]                              Set the maximum number of cached persistent output connections
    --responseTimeout [number]                        Set the timeout for request-response invocations (in milliseconds)
    --correlationAlgorithm [simple|hash]            Set the algorithm to use for message correlation
    --log [severe|warning|info|fine]                  Set the logging level (default: info)
    --stackTraces                                      Activate the printing of Java stack traces (default: false)
    --typecheck [true|false]                          Check for correlation and other data related typing errors (default: false)
    --check                                            Check for syntactic and semantic errors.
    --trace                                            Activate tracer
    --traceLevel [all|comm|comp]                Defines tracer level: all - all the traces; comm - only communication traces; comp - only computation traces. Default is all.
    --charset [character encoding, e.g., UTF-8]        Character encoding of the source *.ol/*.iol (default: system-dependent, on GNU/Linux UTF-8)
    --version                                          Display this program version information
```

