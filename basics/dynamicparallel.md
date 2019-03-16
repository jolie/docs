# Dynamic Parallel
Dynamic parallelism can be used within a Jolie behaviour for instantiating parallel activities dynamically. Dynamic parallelism is achieved by using the primitive *spawn*. Differently from the [parallel](composing_statements#parallel) operator
which allows for the parallel composion of statically defined activities, the spawn primitive permits to design a set of parallel activities whose number
is defined at runtime.
