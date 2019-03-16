# Dynamic Parallel
In Jolie, dynamic parallelism can be used for instantiating parallel activities within a service behaviour. It is achieved by using the primitive *spawn* but, differently from the [parallel](../basics/composing_statements#parallel) operator
which allows for the parallel composion of statically defined activities, the spawn primitive permits to design a set of parallel activities whose number is defined at runtime.

The syntax of the spawn follows:
```text
spawn( var over range ) in resultVar {
    spawn session
}
```
where *var* is the index variable which ranges over *range*. *resultVar* is the variable vector which will containt all the results from each spawned activity. *spawn session* represents the session code to be  executed in parallel for each spawn instantiation.

**Restrictions**
* the spawned sessions cannot contain input operations

