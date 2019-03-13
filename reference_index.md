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
- `[..]{..}`: input choice. [Go to section: Input Choice](basics/composing_statements.md#input-choice)
- `constants`: constants definition. [Go to section: Constants](basics/constants)
- `define`: procedure definition. [Go to section: Define](basics/define)
- `execution { single | concurrent | sequential }`: execution modality. [Go to section: Processes and Sessions](basics/processes)
- `for(){}`: deterministic loop. [Go to section: for and while](basics/composing_statements.md#for-and-while)
- `foreach(:){}`: traversing items. [Go to section: foreach](basics/data_structures.md#foreach-traversing-items)
- `global`: global variables. [Go to section: Processes and Sessions](basics/processes)
- `if (..) {..} else {..}`: conditional statement. [Go to section: Conditions and conditional statement](basics/composing_statements.md#conditions-and-conditional-statement)
- `init{}`: init scope. [Go to section: Processes and Sessions](basics/processes)
- `inputPort`: input port statement. [Go to section: Ports](basics/communication-ports/ports)
- `interface`: interface definition. [Go to section: Interfaces](basics/communication-ports/interfaces)
- `Interfaces`: port interfaces. [Go to section: Interfaces](basics/communication-ports/interfaces)
- `Location`: port location. [Go to section: Locations](basics/communication-ports/locations)
- `main{}`: main scope. [Go to section: Processes and Sessions](basics/processes)
- `OneWay`: one way operation definition. [Go to section: Interfaces](basics/communication-ports/interfaces)
- `outputPort`: output port statement. [Go to section: Ports](basics/communication-ports/ports)
- `Protocol`: port protocol. [Go to section: Protocol](basics/communication-ports/protocol)
- `RequestResponse`: request response operation definition. [Go to section: Interfaces](basics/communication-ports/interfaces)
- `undef()`: undefines a variable. [Go to section: Undef](basics/data_structures.md#undef-erasing-tree-structures)
- `type`: type definition. [Go to section: Data Types](basics/communication-ports/data_types)
- `while(){}`: conditional loop. [Go to section: for and while](basics/composing_statements.md#for-and-while)
- `with(:){}`: shortcut to repetitive variable paths. [Go to section: with](basics/data_structures.md#with-a-shortcut-to-repetitive-variable-paths)
