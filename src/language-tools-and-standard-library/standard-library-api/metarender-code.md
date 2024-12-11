<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service MetaRenderCode

> from metarender-code import MetaRenderCode

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| Render | local | | <a href='#NativeCodeRenderInterface'>NativeCodeRenderInterface</a> |

### List of Available Interfaces

### NativeCodeRenderInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| getCardinality | <a href="#Cardinality">Cardinality</a> | <a href='#string'>string</a> | - |  |
| getInputPort | <a href="#Port">Port</a> | <a href='#string'>string</a> | - |  |
| getInterface | <a href="#Interface">Interface</a> | <a href='#string'>string</a> | - |  |
| getInterfaceWIthoutTypeList | <a href="#Interface">Interface</a> | <a href='#string'>string</a> | - |  |
| getNativeType | <a href="#NativeType">NativeType</a> | <a href='#string'>string</a> | - |  |
| getOperation | <a href="#Operation">Operation</a> | <a href='#string'>string</a> | - |  |
| getOutputPort | <a href="#Port">Port</a> | <a href='#string'>string</a> | - |  |
| getSubType | <a href="#MetaRenderCodeSubType">MetaRenderCodeSubType</a> | <a href='#string'>string</a> | - |  |
| getSurface | <a href="#Port">Port</a> | <a href='#string'>string</a> | - |  |
| getSurfaceWithoutOutputPort | <a href="#Port">Port</a> | <a href='#string'>string</a> | - |  |
| getType | <a href="#MetaRenderCodeType">MetaRenderCodeType</a> | <a href='#string'>string</a> | - |  |
| getTypeChoice | <a href="#MetaRenderCodeTypeChoice">MetaRenderCodeTypeChoice</a> | <a href='#string'>string</a> | - |  |
| getTypeDefinition | <a href="#TypeDefinition">TypeDefinition</a> | <a href='#string'>string</a> | - |  |
| getTypeInLine | <a href="#MetaRenderCodeTypeInLine">MetaRenderCodeTypeInLine</a> | <a href='#string'>string</a> | - |  |
| getTypeLink | <a href="#TypeLink">TypeLink</a> | <a href='#string'>string</a> | - |  |
| getTypeUndefined | <a href="#TypeUndefined">TypeUndefined</a> | <a href='#string'>string</a> | - |  |


### Types

<details>
<summary><span id="Cardinality">Cardinality: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: int // 
&nbsp;&nbsp;max[0,1]: int // 
&nbsp;&nbsp;infinite[0,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="Cardinality">Cardinality: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#Cardinality'>Cardinality</a>
</pre>
</details>
<details>
<summary><span id="DoubleRefinedType">DoubleRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[1,1]: <a href='#RangeDouble'>RangeDouble</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Fault">Fault: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#NativeType'>NativeType</a>
|<a href='#TypeUndefined'>TypeUndefined</a>
|<a href='#TypeLink'>TypeLink</a>

 // 
&#125;
</pre>
</details>
<details>
<summary><span id="IntRefinedType">IntRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[1,1]: <a href='#RangeInt'>RangeInt</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Interface">Interface: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;operations[0,1]: <a href='#Operation'>Operation</a> // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="Interface">Interface: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#Interface'>Interface</a>
</pre>
</details>
<details>
<summary><span id="LongRefinedType">LongRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[1,1]: <a href='#RangeLong'>RangeLong</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="MetaRenderCodeSubType">MetaRenderCodeSubType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;subType[1,1]: <a href='#SubType'>SubType</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="MetaRenderCodeType">MetaRenderCodeType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="MetaRenderCodeTypeChoice">MetaRenderCodeTypeChoice: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;typeChoice[1,1]: <a href='#TypeChoice'>TypeChoice</a> // 
&nbsp;&nbsp;indentation[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="MetaRenderCodeTypeInLine">MetaRenderCodeTypeInLine: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;typeInLine[1,1]: <a href='#TypeInLine'>TypeInLine</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="NativeType">NativeType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;string_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#StringRefinedType'>StringRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
|void &#123;
&nbsp;&nbsp;int_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#IntRefinedType'>IntRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
|void &#123;
&nbsp;&nbsp;double_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#DoubleRefinedType'>DoubleRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
|void &#123;
&nbsp;&nbsp;any_type[1,1]: bool // 
&#125;
|void &#123;
&nbsp;&nbsp;void_type[1,1]: bool // 
&#125;
|void &#123;
&nbsp;&nbsp;raw_type[1,1]: bool // 
&#125;
|void &#123;
&nbsp;&nbsp;bool_type[1,1]: bool // 
&#125;
|void &#123;
&nbsp;&nbsp;long_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#LongRefinedType'>LongRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;







</pre>
</details>
<details>
<summary><span id="NativeType">NativeType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#NativeType'>NativeType</a>
</pre>
</details>
<details>
<summary><span id="Operation">Operation: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;operation_name[1,1]: string // 
&nbsp;&nbsp;output[0,1]: string // 
&nbsp;&nbsp;input[1,1]: string // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;fault[0,1]: <a href='#Fault'>Fault</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Operation">Operation: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#Operation'>Operation</a>
</pre>
</details>
<details>
<summary><span id="Port">Port: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;protocol[1,1]: string // 
&nbsp;&nbsp;interfaces[0,1]: <a href='#Interface'>Interface</a> // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;location[1,1]: any // 
&#125;
</pre>
</details>
<details>
<summary><span id="Port">Port: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#Port'>Port</a>
</pre>
</details>
<details>
<summary><span id="RangeDouble">RangeDouble: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: double // 
&nbsp;&nbsp;max[0,1]: double // 
&#125;
|void &#123;
&nbsp;&nbsp;min[1,1]: double // 
&nbsp;&nbsp;infinite[1,1]: bool // 
&#125;

</pre>
</details>
<details>
<summary><span id="RangeInt">RangeInt: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: int // 
&nbsp;&nbsp;max[0,1]: int // 
&#125;
|void &#123;
&nbsp;&nbsp;min[1,1]: int // 
&nbsp;&nbsp;infinite[1,1]: bool // 
&#125;

</pre>
</details>
<details>
<summary><span id="RangeLong">RangeLong: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: long // 
&nbsp;&nbsp;max[0,1]: long // 
&#125;
|void &#123;
&nbsp;&nbsp;min[1,1]: long // 
&nbsp;&nbsp;infinite[1,1]: bool // 
&#125;

</pre>
</details>
<details>
<summary><span id="StringRefinedType">StringRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;length[1,1]: <a href='#RangeInt'>RangeInt</a> // 
&#125;
|void &#123;
&nbsp;&nbsp;enum[1,1]: string // 
&#125;
|void &#123;
&nbsp;&nbsp;regex[1,1]: string // 
&#125;


</pre>
</details>
<details>
<summary><span id="SubType">SubType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;cardinality[1,1]: <a href='#Cardinality'>Cardinality</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="Type">Type: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#TypeInLine'>TypeInLine</a>
|<a href='#TypeLink'>TypeLink</a>
|<a href='#TypeChoice'>TypeChoice</a>
|<a href='#TypeUndefined'>TypeUndefined</a>



</pre>
</details>
<details>
<summary><span id="TypeChoice">TypeChoice: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;choice[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;left_type[1,1]: <a href='#TypeInLine'>TypeInLine</a>
|<a href='#TypeLink'>TypeLink</a>
 // 
&nbsp;&nbsp;&nbsp;&nbsp;right_type[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="TypeDefinition">TypeDefinition: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="TypeDefinition">TypeDefinition: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#TypeDefinition'>TypeDefinition</a>
</pre>
</details>
<details>
<summary><span id="TypeInLine">TypeInLine: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;root_type[1,1]: <a href='#NativeType'>NativeType</a> // 
&nbsp;&nbsp;sub_type[0,1]: <a href='#SubType'>SubType</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="TypeLink">TypeLink: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;link_name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="TypeLink">TypeLink: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#TypeLink'>TypeLink</a>
</pre>
</details>
<details>
<summary><span id="TypeUndefined">TypeUndefined: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;undefined[1,1]: bool // 
&#125;
</pre>
</details>
<details>
<summary><span id="TypeUndefined">TypeUndefined: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#TypeUndefined'>TypeUndefined</a>
</pre>
</details>
