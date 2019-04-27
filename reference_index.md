This reference index is still under construction. If you spot something missing, please consider [contributing](https://github.com/jolie/docs/blob/master/reference_index.md)!

## Basic Data Types
* `bool`: booleans;
* `int`: integers;
* `long`: long integers \(with `L` or `l` suffix\);
* `double`: double-precision float \(decimal literals\);
* `string`: strings;
* `raw`: byte arrays;
* `void`: the empty type.

[Go to section: Handling Simple Data](basics/handling_simple_data)

## Tree operators
- `<<`: deep copy. [Go to section: Copying an entire tree structure](basics/data_structures.md#less-than-less-than-copying-an-entire-tree-structure)
- `->`: alias. [Go to section: Structure aliases](basics/data_structures.md#greater-than-structures-aliases)


## Behavioural operators
- `;`: sequence. [Go to section: Sequence](basics/composing_statements.md#sequence)
- `|`: parallel. [Go to section: Parallel](basics/composing_statements.md#parallel)

## Statements
- `^`: "freezing" operator. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basicsfault-handling/termination_and_compensation#installation-time-variable-evaluation)
- `[..]{..}`: input choice. [Go to section: Input Choice](basics/composing_statements.md#input-choice)
- `Aggregates`: aggregation statement. [Go to section: Aggregation](architectural-composition/aggregation.md)
- `cH`: handler placeholder. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basics/fault-handling/termination_and_compensation)
- `comp()`: compensation statement. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basics/fault-handling/termination_and_compensation)
- `constants`: constants definition. [Go to section: Constants](basics/constants.md)
- `courier`: courier process definition. [Go to section: Couriers](architectural-composition/couriers.md)
- `cset`: cset definition. [Go to section: Sessions](basics/sessions.md)
- `csets`: csets assignment. [Go to section: Sessions](basics/sessions.md)
- `default`: fautl name alias. [Go to section: Scopes and Faults](fault-handling/basics.md#accessing-a-fault-caught-in-a-scope-the-alias-default)
- `define`: procedure definition. [Go to section: Define](basics/define.md)
- `embedded`: embedding statement. [Go to section: Embedding](architectural-composition/embedding.md)
- `execution { single | concurrent | sequential }`: execution modality. [Go to section: Processes](basics/processes.md)
- `for(){}`: deterministic loop. [Go to section: for and while](basics/composing_statements.md#for-and-while)
- `foreach(:){}`: traversing items. [Go to section: foreach](basics/data_structures.md#foreach-traversing-items)
- `forward`: forward statement. [Go to section: Couriers](architectural-composition/couriers.md#the-statement-forward)
- `global`: global variables. [Go to section: Processes](basics/processes.md)
- `if (..) {..} else {..}`: conditional statement. [Go to section: Conditions and conditional statement](basics/composing_statements.md#conditions-and-conditional-statement)
- `init{}`: init scope. [Go to section: Processes and Sessions](basics/processes.md)
- `inputPort`: input port statement. [Go to section: Ports](basics/communication-ports/ports.md)
- `interface`: interface definition. [Go to section: Interfaces](basics/communication-ports/interfaces.md)
- `Interfaces`: port interfaces. [Go to section: Interfaces](basics/communication-ports/interfaces.md)
- `install()`: handler installation. [Go to section: Scopes and Faults](fault-handling/basics.md)
- `Location`: port location. [Go to section: Locations](basics/communication-ports/locations.md)
- `main{}`: main scope. [Go to section: Processes](basics/processes.md)
- `new`: generation of a fresh token. [Go to section: Sessions](basics/sessions.md)
- `OneWay`: one way operation definition. [Go to section: Interfaces](basics/communication-ports/interfaces)
- `outputPort`: output port statement. [Go to section: Ports](basics/communication-ports/ports)
- `Protocol`: port protocol. [Go to section: Protocol](basics/communication-ports/protocol)
- `provide [] until []`: provide until statement. [Go to section: Sessions](basics/sessions.md#the-provide-until-statement)
- `RequestResponse`: request response operation definition. [Go to section: Interfaces](basics/communication-ports/interfaces.md)
- `service`: internal service definition. [Go to section: Internal Services](architectural-composition/internal_services.md)
- `scope(){}`: scope definition. [Go to section: Scopes and Faults](fault-handling/basics.md)
- `synchronized(){}`: variables synchronization. [Go to section: Processes](basics/processes.md)
- `spawn( .. over .. )  in .. {}`: spawn primitive definition. [Go to section: Dynamic Parallel](basics/dynamicparallel.md)
- `this`: termination handler reference. [Go to section: Termination and Compeonsation](https://jolielang.gitbook.io/docs/basics/fault-handling/termination_and_compensation)
- `throw(){}`: fault raising. [Go to section: Scopes and Faults](fault-handling/basics.md)
- `throws`: fault raising declaration. [Go to section: Interfaces](basics/communication-ports/interfaces.md)
- `type`: type definition. [Go to section: Data Types](basics/communication-ports/data_types)
- `undef()`: undefines a variable. [Go to section: Undef](basics/data_structures.md#undef-erasing-tree-structures)
- `while(){}`: conditional loop. [Go to section: for and while](basics/composing_statements.md#for-and-while)
- `with(:){}`: shortcut to repetitive variable paths. [Go to section: with](basics/data_structures.md#with-a-shortcut-to-repetitive-variable-paths)

## Tools and related projects
- `jolie2surface`: surface generation tool. [Go to section: jolie2surface](architectural-composition/aggregation.md#jolie-2-surface)
