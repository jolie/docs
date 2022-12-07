# Engine Arguments

When executed, the jolie engine can be parametrized with some arguments. The complete list can be checked by typing `jolie --help`. whose result in the console is:

```text
Usage: jolie [options] program_file [program arguments]

Available options:
    -h, --help                          Display this help information
    -C ConstantIdentifier=ConstantValue  Sets constant ConstantIdentifier to ConstantValue before starting execution
                                        (under Windows use quotes or double-quotes, e.g., -C "ConstantIdentifier=ConstantValue" )
    --connlimit [number]              Set the maximum number of active connection threads
    --conncache [number]              Set the maximum number of cached persistent output connections
    --responseTimeout [number]          Set the timeout for request-response invocations (in milliseconds)
    --correlationAlgorithm [simple|hash] Set the algorithm to use for message correlation
    --log [severe|warning|info|fine]  Set the logging level (default: info)
    --stackTraces                      Activate the printing of Java stack traces (default: false)
    --typecheck [true|false]          Check for correlation and other data related typing errors (default: false)
    --check                              Check for syntactic and semantic errors.
    --trace [console|file]              Activate tracer. console prints out in the console, file creates a json file
    --traceLevel [all|comm|comp]      Defines tracer level: all - all the traces; comm - only communication traces; comp - only computation
                                                traces. Default is all.
    --charset [character encoding, e.g., UTF-8]  Character encoding of the source *.ol/*.iol (default: system-dependent, on GNU/Linux UTF-8)
    -p PATH                              Add PATH to the set of paths where modules are looked up
    -s [service name], --service [service name]  Specify a service in the module to execute (not necessary if the module contains only one service definition)
    --params json_file                  Use the contents of json_file as the argument of the service being executed.
    --version                          Display this program version information
    --cellId                          set an integer as cell identifier, used for creating message ids. (max: 2147483647)
                                            Display this program version information
```
