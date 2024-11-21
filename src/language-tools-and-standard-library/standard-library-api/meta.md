<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Meta

> from meta import Meta

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| input | local | | <a href='#MetaInterface'>MetaInterface</a> |

### List of Available Interfaces

### MetaInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| parseModule | <a href="#string">string</a> | <a href='#Module'>Module</a> | - |  |


### Types

<details>
<summary><span id="Aggregation">Aggregation:  An aggregation, as in the aggregates construct used in input ports.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;extender[0,1]: <a href='#LocatedSymbolRef'>LocatedSymbolRef</a> // 
&nbsp;&nbsp;outputPort[1,1]: <a href='#LocatedSymbolRef'>LocatedSymbolRef</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="BasicType">BasicType:  A basic type.
</span>
</summary>

##### Type Declaration
<pre>
<a href='#VoidBasicType'>VoidBasicType</a>
|<a href='#BoolBasicType'>BoolBasicType</a>
|<a href='#IntBasicType'>IntBasicType</a>
|<a href='#LongBasicType'>LongBasicType</a>
|<a href='#DoubleBasicType'>DoubleBasicType</a>
|<a href='#StringBasicType'>StringBasicType</a>





</pre>
</details>
<details>
<summary><span id="BoolBasicType">BoolBasicType:  A boolean basic type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;bool[1,1]: void // @JavaName("boolTag")
&#125;
</pre>
</details>
<details>
<summary><span id="ChoiceType">ChoiceType:  A choice type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;left[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;right[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Documentation">Documentation:  A documentation node.
</span>
</summary>

##### Type Declaration
<pre>
<a href='#LocatedString'>LocatedString</a>
</pre>
</details>
<details>
<summary><span id="DoubleBasicType">DoubleBasicType:  A double basic type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;double[1,1]: void // @JavaName("doubleTag")
&nbsp;&nbsp;refinements[0,1]: <a href='#DoubleRefinement'>DoubleRefinement</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="DoubleRange">DoubleRange: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: double // 
&nbsp;&nbsp;max[1,1]: double // 
&#125;
</pre>
</details>
<details>
<summary><span id="DoubleRefinement">DoubleRefinement: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[0,1]: <a href='#DoubleRange'>DoubleRange</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="FaultType">FaultType:  The type of a fault.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="InputPort">InputPort:  An input port.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;redirections[0,1]: <a href='#Redirection'>Redirection</a> // 
&nbsp;&nbsp;protocol[0,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;interfaces[0,1]: <a href='#SymbolRef'>SymbolRef</a> // 
&nbsp;&nbsp;operations[0,1]: <a href='#Operation'>Operation</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;location[0,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;aggregations[0,1]: <a href='#Aggregation'>Aggregation</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="IntBasicType">IntBasicType:  An integer basic type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;int[1,1]: void // @JavaName("intTag")
&nbsp;&nbsp;refinements[0,1]: <a href='#IntRefinement'>IntRefinement</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="IntRange">IntRange:  An integer range.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: int //  Must be lower than or equal to max.
&nbsp;&nbsp;max[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="IntRefinement">IntRefinement: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[0,1]: <a href='#IntRange'>IntRange</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="InterfaceDef">InterfaceDef:  An interface definition.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;operations[0,1]: <a href='#Operation'>Operation</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="LocatedString">LocatedString:  A string with a text location.
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="LocatedSymbolRef">LocatedSymbolRef:  A symbol reference with a text location.
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Location">Location:  The location of a piece of text in a text document.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;range[1,1]: <a href='#Range'>Range</a> // 
&nbsp;&nbsp;source[1,1]: <a href='#Source'>Source</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="LongBasicType">LongBasicType:  A long basic type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;long[1,1]: void // @JavaName("longTag")
&nbsp;&nbsp;refinements[0,1]: <a href='#LongRefinement'>LongRefinement</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="LongRange">LongRange: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: long // 
&nbsp;&nbsp;max[1,1]: long // 
&#125;
</pre>
</details>
<details>
<summary><span id="LongRefinement">LongRefinement: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[0,1]: <a href='#LongRange'>LongRange</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Module">Module:  A module.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;types[0,1]: <a href='#TypeDef'>TypeDef</a> // 
&nbsp;&nbsp;interfaces[0,1]: <a href='#InterfaceDef'>InterfaceDef</a> // 
&nbsp;&nbsp;services[0,1]: <a href='#ServiceDef'>ServiceDef</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="NonNegativeIntRange">NonNegativeIntRange:  A non-negative integer range, as used in types.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: int //  Cannot be lower than 0 and should always be lower than or equal to max.
&nbsp;&nbsp;max[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="OneWayOperation">OneWayOperation:  The type of a OneWay operation.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;requestType[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Operation">Operation:  The type of an operation.
</span>
</summary>

##### Type Declaration
<pre>
<a href='#OneWayOperation'>OneWayOperation</a>
|<a href='#RequestResponseOperation'>RequestResponseOperation</a>

</pre>
</details>
<details>
<summary><span id="OutputPort">OutputPort:  An output port.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;protocol[0,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;interfaces[0,1]: <a href='#SymbolRef'>SymbolRef</a> // 
&nbsp;&nbsp;operations[0,1]: <a href='#Operation'>Operation</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;location[0,1]: <a href='#LocatedString'>LocatedString</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Position">Position:  A position in a text document.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;character[1,1]: int // 
&nbsp;&nbsp;line[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="Range">Range:  A range in a text document.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;start[1,1]: <a href='#Position'>Position</a> // 
&nbsp;&nbsp;end[1,1]: <a href='#Position'>Position</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Redirection">Redirection:  A redirection, as used in an input port.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;outputPort[1,1]: <a href='#LocatedSymbolRef'>LocatedSymbolRef</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="RequestResponseOperation">RequestResponseOperation:  The type of a RequestResponse operation.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;responseType[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;requestType[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;faults[0,1]: <a href='#FaultType'>FaultType</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="ServiceDef">ServiceDef:  A service.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;documentation[0,1]: <a href='#Documentation'>Documentation</a> // 
&nbsp;&nbsp;outputPorts[0,1]: <a href='#OutputPort'>OutputPort</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;inputPorts[0,1]: <a href='#InputPort'>InputPort</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Source">Source: 
</span>
</summary>

##### Type Declaration
<pre>
string
</pre>
</details>
<details>
<summary><span id="StringBasicType">StringBasicType:  A string basic type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;string[1,1]: void // @JavaName("stringTag")
&nbsp;&nbsp;refinements[0,1]: <a href='#StringRefinement'>StringRefinement</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="StringRefinement">StringRefinement: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;length[1,1]: <a href='#IntRange'>IntRange</a> // 
&#125;
|void &#123;
&nbsp;&nbsp;enum[1,1]: string // @JavaName("enumeration")
&#125;
|void &#123;
&nbsp;&nbsp;regex[1,1]: string // 
&#125;


</pre>
</details>
<details>
<summary><span id="SymbolRef">SymbolRef:  A reference to the definition of a symbol.
</span>
</summary>

##### Type Declaration
<pre>
string
</pre>
</details>
<details>
<summary><span id="TreeNodeType">TreeNodeType:  The type of a node in a tree type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;documentation[0,1]: <a href='#Documentation'>Documentation</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;range[1,1]: <a href='#NonNegativeIntRange'>NonNegativeIntRange</a> // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="TreeType">TreeType:  A tree type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;basicType[1,1]: <a href='#BasicType'>BasicType</a> // 
&nbsp;&nbsp;rest[0,1]: <a href='#TreeNodeType'>TreeNodeType</a> // 
&nbsp;&nbsp;nodes[0,1]: <a href='#TreeNodeType'>TreeNodeType</a> // 
&nbsp;&nbsp;documentation[0,1]: <a href='#Documentation'>Documentation</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Type">Type:  A type. // TODO: makes switching hard, consider defining the possible options as their own types.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;tree[1,1]: <a href='#TreeType'>TreeType</a> // 
&#125;
|void &#123;
&nbsp;&nbsp;choice[1,1]: <a href='#ChoiceType'>ChoiceType</a> // 
&#125;
|void &#123;
&nbsp;&nbsp;ref[1,1]: <a href='#LocatedSymbolRef'>LocatedSymbolRef</a> // 
&#125;


</pre>
</details>
<details>
<summary><span id="TypeDef">TypeDef:  A type definition.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;textLocation[1,1]: <a href='#TextLocation'>TextLocation</a> // 
&nbsp;&nbsp;name[1,1]: <a href='#LocatedString'>LocatedString</a> // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="VoidBasicType">VoidBasicType:  A void basic type.
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;void[1,1]: void // @JavaName("voidTag")
&#125;
</pre>
</details>
