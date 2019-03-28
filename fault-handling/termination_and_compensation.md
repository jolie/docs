# Termination and Compensation

## Termination and compensation

_Termination_ and _compensation_ are mechanisms which deal with the recovery of activities.

Termination deals with the recovery of an activity that is still running.

Compensation deals with the recovery of an activity that has successfully completed its execution.

Each scope can be equipped with an error handler that contains the code to be executed for its recovery. As for fault handlers, recovery handlers can be dynamically installed by means of the `install` statement. Besides using a specific fault name, which installs the handler as a _fault handler_, the handler can refer to `this`. The term `this` refers to a _termination_ or a _recovery handler_ for the enclosing scope.

Installing a handler overwrites the previous one for the same fault or scope name; however, handlers can be composed by using the `cH` placeholder, which is replaced by the code of the previously installed handler.

Fig. 1 displays a scenario in which a scope A contains an activity that executes:

* an activity _P_;
* the scope _B_;
* the scope _C_.

Let us suppose that _C_ finishes its execution. As a result, its compensation handler is promoted at the level of its parent's compensation handler \(1\). Afterwards, if _P_ rises a fault _f_ while the scope _B_ is still running its execution \(2\), the scope _B_ is stopped and its termination handler is executed \(3\). When the termination handler of _B_ is finished, the fault handler of _A_ can be executed \(4\).

Fault handlers can execute compensations by invoking the compensation handlers loaded within the corresponding scope, e.g., in the previous scenario the fault handler of A invokes the compensation handler of C.

![](../.gitbook/assets/termination_and_compensation.jpg)

**Fig.1** Code _P_ is executed in parallel with scopes _B_ and _C_ within scope _A_. _C_ is supposed to be successfully ended, whereas _B_ is terminated during its execution by the fault _f_ raised by _P_. The fault handler of _A_ can execute the compensation handler loaded by _C_.

## Termination

Termination is a mechanism used to recover from errors: it is automatically triggered when a scope is unexpectedly terminated from a parallel behaviour and must be smoothly stopped.

Termination is triggered when a sibling activity raises a fault. Let us consider the following example:

```text
include "console.iol"

main
{
    scope ( scope_name )
    {
        install( this => 
            println@Console( "This is the recovery activity for scope_name" )()
        );
        println@Console( "I am scope_name" )()
    }
    |
    throw( FaultName )
}
```

In the example above, the code at Lines 7 and 13 is executed concurrently. In `scope_name`, a recovery handler is initially installed and then the code at Line 10 is executed. Besides, the parallel activity may raise the fault at line 13. In that case a termination is triggered and the corresponding recovery code is executed.

### Terminating child scopes

When termination is triggered on a scope, the latter recursively terminates its own child scopes. Once all child scopes terminated, the recovery handler is executed. Let us consider the following example:

```text
include "console.iol"
include "time.iol"

main
{
    scope( grandFather )
    {
        install( this => 
            println@Console( "recovering grandFather" )()
        );
        scope( father )
        {
            install( this => 
                println@Console( "recovering father" )()
            );
            scope ( son )
            {
                install( this => 
                    println@Console( "recovering son" )()
                );
                sleep@Time( 500 )();
                println@Console( "Son's code block" )()
            }
        }
    }
    |
    throw( FaultName )
}
```

If the fault is raised when the scope `son` is still executing \(we use Jolie's standard library `time` for making the child process wait for 500 milliseconds\), a termination is triggered for scope `grandFather`, which triggers the termination of scope `father`. Finally, scope `father` triggers the termination of the scope `son`, which executes its own recovery handler. Inside-out, `son`'s, `father`'s and `grandFather`'s recovery handlers are executed subsequently.

### Dynamic installation of recovery handlers

Recovery handlers can be dynamically updated like fault handlers. Example:

```text
include "console.iol"
include "time.iol"

main
{
    scope( scope_name )
    {
        println@Console( "step 1" )();
        install( this => println@Console( "recovery step 1" )() );
        sleep@Time( 1 )();
        println@Console( "step 2" )();
        install( this => println@Console( "recovery step 2" )() );
        sleep@Time( 2 )();
        println@Console( "step 3" )();
        install( this => println@Console( "recovery step 3" )() );
        sleep@Time( 3 )();
        println@Console( "step 4" )();
        install( this => println@Console( "recovery step 4" )() )
    }
    |
    sleep@Time( 3 )();
    throw( FaultName )
}
```

When `a_fault` is raised, the lastly installed recovery handler is executed.

## Handler composition - the `cH` placeholder

Besides replacing a recovery handlers, it may be useful to add code to the current handler, without replacing the entire previously installed code. Jolie provides the keyword `cH` as a placeholder for the _current handler_.

Let us consider the following example:

```text
include "console.iol"
include "time.iol"

main
{
    scope( scope_name )
    {
        println@Console( "step 1" )();
        sleep@Time( 1 )();
        install( this =>
            println@Console( "recovery step 1" )() 
        );
        println@Console( "step 2" )();
        sleep@Time( 2 )();
        install( this => 
            cH; 
            println@Console( "recovery step 2" )() 
        );
        println@Console( "step 3" )();
        sleep@Time( 3 )();
        install( this => 
            cH;
            println@Console( "recovery step 3" )() 
        );
        println@Console( "step 4" )();
        sleep@Time( 4 )();
        install( this => 
            cH;
            println@Console( "recovery step 4" )()
        )
    }
    |
    sleep@Time( 3 )();
    throw( FaultName )
}
```

`cH` can be composed within another handler by means of the sequence and parallel operators. The resulting handler will be the composition of the previous one \(represented by `cH`\) and the new one.

## Compensation

Compensation allows to handle the recovery of a scope which has successfully executed. When a scope finishes with success its own activities, its current recovery handler is promoted to the parent scope in order to be available for compensation.

Compensation is invoked by means of the `comp` statement, which can be used only within a handler.

Let us consider the following example showing how to perform a compensation:

```text
include "console.iol"

main
{
    install( a_fault => 
        println@Console( "Fault handler for a_fault" )();
        comp( example_scope )
    );
    scope( example_scope )
    {
        install( this => 
            println@Console( "recovering step 1" )()
        );
        println@Console( "Executing code of example_scope" )();
        install( this => 
            cH;
            println@Console( "recovering step 2" )()
        )
    };
    throw( FaultName )
}
```

When scope `example_scope` ends with success, its current recovery handler is promoted to the parent scope \(`main`\) in order to be available for compensation. At the end of the program, the `a_fault` is raised, triggering the execution of its fault handler, defined at Lines 5-8. At Line 7 the compensation of scope `example_scope` is executed, triggering the execution of the corresponding recovery handler \(in this case, the one at Line 15, including the first at Line 11\).

## Installation-time variable evaluation

Handlers need to use and manipulate variable data often and a handler may need to refer to the status of a variable at the moment of its installation. Hence, Jolie provides the `^` operator which "freezes" a variable state within an installed handler. `^` is applied to a variable by prefixing it, as shown in the example below.

```text
include "console.iol"

main
{
    install( a_fault => 
        comp( example_scope )
    );
    scope( example_scope )
    {
        install( this => println@Console( "initiating recovery" )() );
        i = 1;
        while( true ){
            install( this =>
                cH;
                println@Console( "recovering step" + ^i )()
            );
            i++
        }
    }
    |
    throw( FaultName )
}
```

The install primitive contained in the `while` loop updates the scope recovery handler at each iteration. In the process the value of the variable `i` is frozen within the handler.

