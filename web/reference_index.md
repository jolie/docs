# Reference Index

This reference index is still under construction. If you spot something missing, please consider [contributing](https://github.com/jolie/docs/blob/master/reference_index.md)!

## Basic Data Types

* `bool`: booleans;
* `int`: integers;
* `long`: long integers \(with `L` or `l` suffix\);
* `double`: double-precision float \(decimal literals\);
* `string`: strings;
* `raw`: byte arrays;
* `void`: the empty type.

[Go to section: Handling Simple Data](language-tools-and-standard-library/basics/handling-simple-data/README.md)

## Tree operators

* `<<`: deep copy. [Go to section: Copying an entire tree structure](language-tools-and-standard-library/basics/data-structures/README.md#copying-an-entire-tree-structure)
* `->`: alias. [Go to section: Structure aliases](language-tools-and-standard-library/basics/data-structures/README.md#structures-aliases)

## Boolean operators

* `==`: is equal to;
* `!=`: is not equal to;
* `<`: is lower than;
* `<=`: is lower than or equal to;
* `>`: is higher than;
* `>=`: is higher than or equal to;
* `!`: negation.

See also [conditions and conditional statement](language-tools-and-standard-library/basics/composing-statements/README.md#conditions-and-conditional-statement).

## Behavioural operators

* `;`: sequence. [Go to section: Sequence](language-tools-and-standard-library/basics/composing-statements/README.md#sequence)
* `|`: parallel. [Go to section: Parallel](language-tools-and-standard-library/basics/composing-statements/README.md#parallel)

## Statements

* `^`: "freezing" operator. [Go to section: Termination and Compensation](language-tools-and-standard-library/basics/fault-handling/termination-and-compensation/README.md#installation-time-variable-evaluation)
* `[..]{..}`: input choice. [Go to section: Input Choice](language-tools-and-standard-library/basics/composing-statements/README.md#input-choice)
* `aggregates`: aggregation statement. [Go to section: Aggregation](language-tools-and-standard-library/architectural-composition/aggregation/README.md)
* `cH`: handler placeholder. [Go to section: Termination and Compensation](language-tools-and-standard-library/basics/fault-handling/termination-and-compensation/README.md)
* `comp()`: compensation statement. [Go to section: Termination and Compensation](language-tools-and-standard-library/basics/fault-handling/termination-and-compensation/README.md)
* `constants`: constants definition. [Go to section: Constants](language-tools-and-standard-library/basics/constants/README.md)
* `courier`: courier process definition. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers/README.md)
* `cset`: cset definition. [Go to section: Sessions](language-tools-and-standard-library/basics/processes-and-sessions/sessions/README.md)
* `csets`: csets assignment. [Go to section: Sessions](language-tools-and-standard-library/basics/processes-and-sessions/sessions/README.md)
* `default`: fault name alias. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/scopes-and-faults/README.md#accessing-a-fault-caught-in-a-scope-the-alias-default)
* `define`: procedure definition. [Go to section: Define](language-tools-and-standard-library/basics/procedures/README.md)
* `embedded`: embedding statement. [Go to section: Embedding](language-tools-and-standard-library/architectural-composition/embedding/README.md)
* `execution: single | concurrent | sequential`: execution modality. [Go to section: Processes](language-tools-and-standard-library/basics/processes-and-sessions/processes/README.md)
* `for(){}`: deterministic loop. [Go to section: for and while](language-tools-and-standard-library/basics/composing-statements/README.md#for-and-while)
* `foreach(:){}`: traversing items. [Go to section: foreach](language-tools-and-standard-library/basics/data-structures/README.md#foreach-traversing-items)
* `forward`: forward statement. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers/README.md#the-statement-forward)
* `global`: global variables. [Go to section: Processes](language-tools-and-standard-library/basics/processes-and-sessions/processes/README.md)
* `if (..) {..} else {..}`: conditional statement. [Go to section: Conditions and conditional statement](language-tools-and-standard-library/basics/composing-statements/README.md#conditions-and-conditional-statement)
* `import .. from .. [as ..]`:
* `init{}`: init scope. [Go to section: Processes and Sessions](language-tools-and-standard-library/basics/processes-and-sessions/processes/README.md)
* `inputPort`: input port statement. [Go to section: Ports](language-tools-and-standard-library/basics/ports/README.md)
* `instanceof`: variable type checking. [Go to section: Handle Simple Data](language-tools-and-standard-library/basics/handling_simple_data.md#runtime-type-checking-of-a-variable-instanceof)
* `interface`: interface definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `interface extender`: interface extension. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers/README.md#interface-extension)
* `interfaces`: port interfaces. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/README.md)
* `install()`: handler installation. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/scopes-and-faults/README.md#fault-handlers-the-primitive-install)
* `location`: port location. [Go to section: Locations](language-tools-and-standard-library/locations/README.md)
* `main {}`: main scope. [Go to section: Processes](language-tools-and-standard-library/basics/processes-and-sessions/processes/README.md)
* `new`: generation of a fresh token. [Go to section: Sessions](language-tools-and-standard-library/basics/processes-and-sessions/sessions/README.md)
* `OneWay`: one way operation definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/README.md)
* `outputPort`: output port statement. [Go to section: Ports](language-tools-and-standard-library/basics/ports/README.md)
* `protocol`: port protocol. [Go to section: Protocol](language-tools-and-standard-library/protocols/README.md)
* `provide [] until []`: provide until statement. [Go to section: Sessions](language-tools-and-standard-library/basics/processes-and-sessions/sessions/README.md#the-provide-until-statement)
* `redirects`: redirection statement. [Go to section: Redirection](language-tools-and-standard-library/architectural-composition/redirection/README.md)
* `RequestResponse`: request response operation definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/README.md)
* `service`: service definition or internal service definition. [Go to section: Internal Services](language-tools-and-standard-library/architectural-composition/internal-services/README.md)
* `scope(){}`: scope definition. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/scopes-and-faults/README.md)
* `synchronized(){}`: variables synchronization. [Go to section: Processes](language-tools-and-standard-library/basics/processes-and-sessions/processes/README.md)
* `spawn( .. over .. )  in .. {}`: spawn primitive definition. [Go to section: Dynamic Parallel](language-tools-and-standard-library/basics/dynamic-parallel/README.md)
* `this`: termination handler reference. [Go to section: Termination and Compensation](language-tools-and-standard-library/basics/fault-handling/termination-and-compensation/README.md)
* `throw(){}`: fault raising. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/scopes-and-faults/README.md)
* `throws`: fault raising declaration. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/README.md#declarations-of-faults-the-statement-throws)
* `type`: type definition. [Go to section: Data Types](language-tools-and-standard-library/basics/data-types/README.md)
* `undef()`: undefines a variable. [Go to section: Undef](language-tools-and-standard-library/basics/data-structures/README.md#undef-erasing-tree-structures)
* `while(){}`: conditional loop. [Go to section: for and while](language-tools-and-standard-library/basics/composing-statements/README.md#for-and-while)
* `with`: interface extender operator. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers/README.md#interface-extension)
* `with(:){}`: shortcut to repetitive variable paths. [Go to section: with](language-tools-and-standard-library/basics/data-structures/README.md#with-a-shortcut-to-repetitive-variable-paths)

## Tools and related projects

* `jolie2surface`: surface generation tool. [Go to section: jolie2surface](language-tools-and-standard-library/architectural-composition/aggregation/README.md#jolie2surface)
* `jolie2java`: java client generation tool. [Go to section: Java Client/jolie2java](language-tools-and-standard-library/technology-integration/java/javaclient/README.md#jolie2java)
* `jocker`: docker integration container. [Go to section: Docker/Jocker](language-tools-and-standard-library/containerization/docker/jocker/README.md)
* `jolier`: running a jolie service as a REST service. [Go to section: Rest Services/jolier](language-tools-and-standard-library/rest/jolier/README.md)
* `jolie2openapi`: it generates an openapi 2.0 definition starting from a jolie interface. [Go to section: Rest Services/jolie2openapi](language-tools-and-standard-library/rest/jolie2openapi/README.md)
* `openapi2jolie`: it generates a jolie client starting from an openapi 2.0 definition. [Go to section: Rest Services/openapi2jolie](language-tools-and-standard-library/rest/openapi2jolie/README.md)
* `jolie2wsdl`: it generates a wsdl definition starting from an jolie input port. [Go to section: jolie2wsdl](language-tools-and-standard-library/web-services/jolie2wsdl/README.md)
* `wsdl2jolie`: it generates a jolie interface starting from a web service wsdl definition. [Go to section: wsdl2jolie](language-tools-and-standard-library/web-services/wsdl2jolie/README.md)
* `joliedoc`: it automatically generates documentation for a service. [Go to section: Documenting API](language-tools-and-standard-library/documenting-api/README.md)
* `jolietraceviewer`: it runs a trace viewer which allows for navigating the traces generated by argument `--trace file` from jolie command line. [Go to section: Debugging](language-tools-and-standard-library/debug-and-tracing/README.md#jolie-trace-viewer)
* `joliemock`: it generates a mock service starting from an input port. [Go to section: Mock Service](language-tools-and-standard-library/mock-services/README.md)
