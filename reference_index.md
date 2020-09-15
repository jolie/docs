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

[Go to section: Handling Simple Data](language-tools-and-standard-library/basics/handling_simple_data.md)

## Tree operators

* `<<`: deep copy. [Go to section: Copying an entire tree structure](language-tools-and-standard-library/basics/data_structures.md#less-than-less-than-copying-an-entire-tree-structure)
* `->`: alias. [Go to section: Structure aliases](language-tools-and-standard-library/basics/data_structures.md#greater-than-structures-aliases)

## Behavioural operators

* `;`: sequence. [Go to section: Sequence](language-tools-and-standard-library/basics/composing_statements.md#sequence)
* `|`: parallel. [Go to section: Parallel](language-tools-and-standard-library/basics/composing_statements.md#parallel)

## Statements

* `^`: "freezing" operator. [Go to section: Termination and Compeonsation](https://github.com/jolie/docs/tree/8aad0cd802687d6e6cae9f436762af9d25ab5104/basics/fault-handling/termination_and_compensation/README.md#installation-time-variable-evaluation)
* `[..]{..}`: input choice. [Go to section: Input Choice](language-tools-and-standard-library/basics/composing_statements.md#input-choice)
* `Aggregates`: aggregation statement. [Go to section: Aggregation](language-tools-and-standard-library/architectural-composition/aggregation.md)
* `cH`: handler placeholder. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basics/fault-handling/termination_and_compensation)
* `comp()`: compensation statement. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basics/fault-handling/termination_and_compensation)
* `constants`: constants definition. [Go to section: Constants](language-tools-and-standard-library/basics/constants.md)
* `courier`: courier process definition. [Go to section: Couriers](language-tools-and-standard-library/architectural-composition/couriers.md)
* `cset`: cset definition. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md)
* `csets`: csets assignment. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md)
* `default`: fautl name alias. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md#accessing-a-fault-caught-in-a-scope-the-alias-default)
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
* `istanceof`: variable type checking. [Go to section: Handle Simple Data](https://jolielang.gitbook.io/docs/basics/handling_simple_data#runtime-type-checking-of-a-variable-instanceof)
* `interface`: interface definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `interface extender`: interface extension. [Go to section: Couriers](https://github.com/jolie/docs/tree/8aad0cd802687d6e6cae9f436762af9d25ab5104/architectural-composition/couriers/README.md#interface-extension)
* `Interfaces`: port interfaces. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `install()`: handler installation. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md)
* `Location`: port location. [Go to section: Locations](https://github.com/jolie/docs/tree/b09339d5f67a4343dbdab600b5ea7903dd9f1e1d/basics/communication-ports/locations.md)
* `main{}`: main scope. [Go to section: Processes](language-tools-and-standard-library/basics/processes.md)
* `new`: generation of a fresh token. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md)
* `OneWay`: one way operation definition. [Go to section: Interfaces](https://github.com/jolie/docs/tree/b09339d5f67a4343dbdab600b5ea7903dd9f1e1d/basics/communication-ports/interfaces/README.md)
* `outputPort`: output port statement. [Go to section: Ports](https://github.com/jolie/docs/tree/b09339d5f67a4343dbdab600b5ea7903dd9f1e1d/basics/communication-ports/ports/README.md)
* `Protocol`: port protocol. [Go to section: Protocol](https://github.com/jolie/docs/tree/b09339d5f67a4343dbdab600b5ea7903dd9f1e1d/basics/communication-ports/protocol/README.md)
* `provide [] until []`: provide until statement. [Go to section: Sessions](language-tools-and-standard-library/basics/sessions.md#the-provide-until-statement)
* `Redirects`: redirection statement. [Go to section: Redirection](language-tools-and-standard-library/architectural-composition/redirection.md)
* `RequestResponse`: request response operation definition. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `service`: internal service definition. [Go to section: Internal Services](language-tools-and-standard-library/architectural-composition/internal_services.md)
* `scope(){}`: scope definition. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md)
* `synchronized(){}`: variables synchronization. [Go to section: Processes](language-tools-and-standard-library/basics/processes.md)
* `spawn( .. over .. )  in .. {}`: spawn primitive definition. [Go to section: Dynamic Parallel](language-tools-and-standard-library/basics/dynamicparallel.md)
* `this`: termination handler reference. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basics/fault-handling/termination_and_compensation)
* `throw(){}`: fault raising. [Go to section: Scopes and Faults](language-tools-and-standard-library/basics/fault-handling/basics.md)
* `throws`: fault raising declaration. [Go to section: Interfaces](language-tools-and-standard-library/basics/interfaces/)
* `type`: type definition. [Go to section: Data Types](https://github.com/jolie/docs/tree/b09339d5f67a4343dbdab600b5ea7903dd9f1e1d/basics/communication-ports/data_types/README.md)
* `undef()`: undefines a variable. [Go to section: Undef](language-tools-and-standard-library/basics/data_structures.md#undef-erasing-tree-structures)
* `while(){}`: conditional loop. [Go to section: for and while](language-tools-and-standard-library/basics/composing_statements.md#for-and-while)
* `with`: interface extender operator. [Go to section: Couriers](https://github.com/jolie/docs/tree/8aad0cd802687d6e6cae9f436762af9d25ab5104/architectural-composition/couriers/README.md#interface-extension)
* `with(:){}`: shortcut to repetitive variable paths. [Go to section: with](language-tools-and-standard-library/basics/data_structures.md#with-a-shortcut-to-repetitive-variable-paths)

## Tools and related projects

* `jolie2surface`: surface generation tool. [Go to section: jolie2surface](language-tools-and-standard-library/architectural-composition/aggregation.md#jolie-2-surface)
* `jolie2java`: java client generation tool. [Go to section: Java Client/jolie2java](https://jolielang.gitbook.io/docs/technology-integration/java/javaclient#jolie-2-java)
* `jocker`: docker integration container. [Go to section: Docker/Jocker](https://jolielang.gitbook.io/docs/containerization/docker/jocker)
* `jolier`: running a jolie service as a REST service. [Go to section: Rest Services/jolier](https://jolielang.gitbook.io/docs/rest/jolier)
* `jolie2openapi`: it generates an openapi 2.0 definition starting from a jolie interface. [Go to section: Rest Services/jolie2openapi](https://jolielang.gitbook.io/docs/rest/jolie2openapi)
* `openapi2jolie`: it generates a jolie client starting from an openapi 2.0 definition. [Go to section: Rest Services/openapi2jolie](https://jolielang.gitbook.io/docs/rest/openapi2jolie)
* `jolie2wsdl`: it generates a wsdl definition starting from an jolie input port. [Go to section: jolie2wsdl](https://jolielang.gitbook.io/docs/web-services/jolie2wsdl)
* `wsdl2jolie`: it generates a jolie interface starting from a web service wsdl definition. [Go to section: wsdl2jolie](https://jolielang.gitbook.io/docs/web-services/wsdl2jolie)
* `joliedoc`: it automatically generates documentation for a service. [Go to section: Documenting API](https://jolielang.gitbook.io/docs/documenting-api#joliedoc)
* `jolietraceviewer`: it runs a trace viewer which allows for navigating the traces generated by argument `--trace file` from jolie command line. [Go to section: Debugging](https://jolielang.gitbook.io/docs/Debugging/tracing)
* `joliemock`: it generates a mock service starting from an input port. [Go to section: Mock Service]((language-tools-and-standard-library/mock/README.md)

