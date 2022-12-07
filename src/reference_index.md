# Reference Index

This reference index is still under construction. If you spot something missing, please consider [contributing](./other-guidelines/docs-contrib.md)!

## Basic Data Types

* `bool`: booleans;
* `int`: integers;
* `long`: long integers \(with `L` or `l` suffix\);
* `double`: double-precision float \(decimal literals\);
* `string`: strings;
* `raw`: byte arrays;
* `void`: the empty type.

[Go to section: Handling Simple Data](language-tools-and-standard-library/basics/handling_simple_data.md)

## Tree operators

* `<<`: deep copy. [Go to section: Copying an entire tree structure](language-tools-and-standard-library/basics/data_structures.md#less-than-less-than-copying-an-entire-tree-structure)
* `->`: alias. [Go to section: Structure aliases](language-tools-and-standard-library/basics/data_structures.md#greater-than-structures-aliases)

## Behavioural operators

* `;`: sequence. [Go to section: Sequence](language-tools-and-standard-library/basics/composing_statements.md#sequence)
* `|`: parallel. [Go to section: Parallel](language-tools-and-standard-library/basics/composing_statements.md#parallel)

## Statements

* `^`: "freezing" operator. [Go to section: Termination and Compensation](./language-tools-and-standard-library/basics/fault-handling/termination_and_compensation.md#installation-time-variable-evaluation)
* `[..]{..}`: input choice. [Go to section: Input Choice](language-tools-and-standard-library/basics/composing_statements.md#input-choice)
* `Aggregates`: aggregation statement. [Go to section: Aggregation](language-tools-and-standard-library/architectural-composition/aggregation.md)
* `cH`: handler placeholder. [Go to section: Termination and Compensation](./language-tools-and-standard-library/basics/fault-handling/termination_and_compensation.md)
* `comp()`: compensation statement. [Go to section: Termination and Compensation](./language-tools-and-standard-library/basics/fault-handling/termination_and_compensation.md)
* `constants`: constants definition. [Go to section: Constants](language-tools-and-standard-library/basics/constants.md)
* `courier`: courier process definition. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers.md)
* `cset`: cset definition. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md)
* `csets`: csets assignment. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md)
* `default`: fault name alias. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md#accessing-a-fault-caught-in-a-scope-the-alias-default)
* `define`: procedure definition. [Go to section: Define](language-tools-and-standard-library/basics/define.md)
* `embedded`: embedding statement. [Go to section: Embedding](language-tools-and-standard-library/architectural-composition/embedding.md)
* `execution { single | concurrent | sequential }`: execution modality. [Go to section: Processes](language-tools-and-standard-library/basics/processes.md)
* `for(){}`: deterministic loop. [Go to section: for and while](language-tools-and-standard-library/basics/composing_statements.md#for-and-while)
* `foreach(:){}`: traversing items. [Go to section: foreach](language-tools-and-standard-library/basics/data_structures.md#foreach-traversing-items)
* `forward`: forward statement. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers.md#the-statement-forward)
* `global`: global variables. [Go to section: Processes](language-tools-and-standard-library/basics/processes.md)
* `if (..) {..} else {..}`: conditional statement. [Go to section: Conditions and conditional statement](language-tools-and-standard-library/basics/composing_statements.md#conditions-and-conditional-statement)
* `init{}`: init scope. [Go to section: Processes and Sessions](language-tools-and-standard-library/basics/processes.md)
* `inputPort`: input port statement. [Go to section: Ports](language-tools-and-standard-library/basics/communication-ports/ports.md)
* `instanceof`: variable type checking. [Go to section: Handle Simple Data](./language-tools-and-standard-library/basics/handling_simple_data.md#casting-and-checking-variable-types)
* `interface`: interface definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `interface extender`: interface extension. [Go to section: Couriers](./language-tools-and-standard-library/architectural-composition/couriers.md#interface-extension)
* `Interfaces`: port interfaces. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `install()`: handler installation. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md)
* `Location`: port location. [Go to section: Locations](./language-tools-and-standard-library/locations/README.md)
* `main{}`: main scope. [Go to section: Processes](language-tools-and-standard-library/basics/processes.md)
* `new`: generation of a fresh token. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md)
* `OneWay`: one way operation definition. [Go to section: Interfaces](./language-tools-and-standard-library/basics/interfaces/README.md)
* `outputPort`: output port statement. [Go to section: Ports](./language-tools-and-standard-library/basics/communication-ports/ports.md)
* `Protocol`: port protocol. [Go to section: Protocol](./language-tools-and-standard-library/protocols/README.md)
* `provide [] until []`: provide until statement. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md#the-provide-until-statement)
* `Redirects`: redirection statement. [Go to section: Redirection](language-tools-and-standard-library/architectural-composition/redirection.md)
* `RequestResponse`: request response operation definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `service`: internal service definition. [Go to section: Internal Services](language-tools-and-standard-library/architectural-composition/internal_services.md)
* `scope(){}`: scope definition. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md)
* `synchronized(){}`: variables synchronization. [Go to section: Processes](language-tools-and-standard-library/basics/processes.md)
* `spawn( .. over .. )  in .. {}`: spawn primitive definition. [Go to section: Dynamic Parallel](language-tools-and-standard-library/basics/dynamicparallel.md)
* `this`: termination handler reference. [Go to section: Termination and Compensation](./language-tools-and-standard-library/basics/fault-handling/termination_and_compensation.md)
* `throw(){}`: fault raising. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md)
* `throws`: fault raising declaration. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `type`: type definition. [Go to section: Data Types](./language-tools-and-standard-library/basics/interfaces/data_types.md)
* `undef()`: remove a variable. [Go to section: Undef](language-tools-and-standard-library/basics/data_structures.md#undef-erasing-tree-structures)
* `while(){}`: conditional loop. [Go to section: for and while](language-tools-and-standard-library/basics/composing_statements.md#for-and-while)
* `with`: interface extender operator. [Go to section: Couriers](./language-tools-and-standard-library/architectural-composition/couriers.md#interface-extension)
* `with(:){}`: shortcut to repetitive variable paths. [Go to section: with](language-tools-and-standard-library/basics/data_structures.md#with-a-shortcut-to-repetitive-variable-paths)

## Tools and related projects

* `jolie2surface`: surface generation tool. [Go to section: jolie2surface](language-tools-and-standard-library/architectural-composition/aggregation.md#jolie-2-surface)
* `jolie2java`: java client generation tool. [Go to section: Java Client/jolie2java](./language-tools-and-standard-library/technology-integration/java/javaclient.md#jolie2java)
* `jocker`: docker integration container. [Go to section: Docker/Jocker](./language-tools-and-standard-library/containerization/docker/jocker.md)
* `jolier`: running a jolie service as a REST service. [Go to section: Rest Services/jolier](./language-tools-and-standard-library/rest/jolier.md)
* `jolie2openapi`: it generates an openapi 2.0 definition starting from a jolie interface. [Go to section: Rest Services/jolie2openapi](./language-tools-and-standard-library/rest/jolie2openapi.md)
* `openapi2jolie`: it generates a jolie client starting from an openapi 2.0 definition. [Go to section: Rest Services/openapi2jolie](./language-tools-and-standard-library/rest/openapi2jolie.md)
* `jolie2wsdl`: it generates a wsdl definition starting from an jolie input port. [Go to section: jolie2wsdl](./language-tools-and-standard-library/web-services/jolie2wsdl.md)
* `wsdl2jolie`: it generates a jolie interface starting from a web service wsdl definition. [Go to section: wsdl2jolie](./language-tools-and-standard-library/web-services/wsdl2jolie.md)
* `joliedoc`: it automatically generates documentation for a service. [Go to section: Documenting API](./language-tools-and-standard-library/documenting-api.md)
* `jolietraceviewer`: it runs a trace viewer which allows for navigating the traces generated by argument `--trace file` from jolie command line. [Go to section: Debugging](./language-tools-and-standard-library/tracing.md)
