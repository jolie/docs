# Fault Handling

Basic fault handling in Jolie involves three main concepts: _scope_, _fault_ and _throw_. They are not so different from other languages. The primitive _install_ allows for the instantiation of the fault handlers within a scope.

Jolie is different from other common languages when we consider _termination\_handlers_ and _compensation\_handlers_. In these cases the primitive _install_ is used for promoting the compensation handlers for a given scope, instead of teh fault handlers.

