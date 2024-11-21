# Service JolieDocLib

> from joliedoc-lib import JolieDocLib

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| JolieDocLib | local | | <a href='#JolieDocLibInterface'>JolieDocLibInterface</a> |

### List of Available Interfaces

### JolieDocLibInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| _getDoubleRefinedType | <a href="#DoubleRefinedType">DoubleRefinedType</a> | <a href='#__DoubleRefinedType'>__DoubleRefinedType</a> | - |  |
| _getFault | <a href="#Fault">Fault</a> | <a href='#__Fault'>__Fault</a> | - |  |
| _getIntRefinedType | <a href="#IntRefinedType">IntRefinedType</a> | <a href='#__IntRefinedType'>__IntRefinedType</a> | - |  |
| _getInterface | <a href="#_GetInterface">_GetInterface</a> | <a href='#__Interface'>__Interface</a> | - |  |
| _getLongRefinedType | <a href="#LongRefinedType">LongRefinedType</a> | <a href='#__LongRefinedType'>__LongRefinedType</a> | - |  |
| _getNativeType | <a href="#NativeType">NativeType</a> | <a href='#__NativeType'>__NativeType</a> | - |  |
| _getOperation | <a href="#_GetOperationRequest">_GetOperationRequest</a> | <a href='#__Operation'>__Operation</a> | - |  |
| _getPort | <a href="#_GetPortRequest">_GetPortRequest</a> | <a href='#__Port'>__Port</a> | - |  |
| _getService | <a href="#Service">Service</a> | <a href='#__Service'>__Service</a> | - |  |
| _getStringRefinedType | <a href="#StringRefinedType">StringRefinedType</a> | <a href='#__StringRefinedType'>__StringRefinedType</a> | - |  |
| _getSubType | <a href="#_GetSubTypeRequest">_GetSubTypeRequest</a> | <a href='#__SubType'>__SubType</a> | - |  |
| _getType | <a href="#_GetTypeRequest">_GetTypeRequest</a> | <a href='#__Type'>__Type</a> | - |  |
| _getTypeChoice | <a href="#_GetTypeChoice">_GetTypeChoice</a> | <a href='#__TypeChoice'>__TypeChoice</a> | - |  |
| _getTypeDefinition | <a href="#_GetTypeDefinition">_GetTypeDefinition</a> | <a href='#__TypeDefinition'>__TypeDefinition</a> | - |  |
| _getTypeInLine | <a href="#_GetTypeInLine">_GetTypeInLine</a> | <a href='#__TypeInLine'>__TypeInLine</a> | - |  |
| _getTypeLink | <a href="#TypeLink">TypeLink</a> | <a href='#__TypeLink'>__TypeLink</a> | - |  |
| _getTypeUndefined | <a href="#TypeUndefined">TypeUndefined</a> | <a href='#__TypeUndefined'>__TypeUndefined</a> | - |  |


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
<summary><span id="DoubleRefinedType">DoubleRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#DoubleRefinedType'>DoubleRefinedType</a>
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
<summary><span id="Fault">Fault: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#Fault'>Fault</a>
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
<summary><span id="IntRefinedType">IntRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#IntRefinedType'>IntRefinedType</a>
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
<summary><span id="LongRefinedType">LongRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#LongRefinedType'>LongRefinedType</a>
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
<summary><span id="Service">Service: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;output[0,1]: string // 
&nbsp;&nbsp;input[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="Service">Service: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#Service'>Service</a>
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
<summary><span id="StringRefinedType">StringRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#StringRefinedType'>StringRefinedType</a>
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
<details>
<summary><span id="_GetInterface">_GetInterface: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;interface[1,1]: <a href='#Interface'>Interface</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetOperationRequest">_GetOperationRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;operation[1,1]: <a href='#Operation'>Operation</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetPortRequest">_GetPortRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;port[1,1]: <a href='#Port'>Port</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetSubTypeRequest">_GetSubTypeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;sub_type[1,1]: <a href='#SubType'>SubType</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetTypeChoice">_GetTypeChoice: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;type_choice[1,1]: <a href='#TypeChoice'>TypeChoice</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetTypeDefinition">_GetTypeDefinition: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;type_definition[1,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetTypeInLine">_GetTypeInLine: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;type_inline[1,1]: <a href='#TypeInLine'>TypeInLine</a> // 
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="_GetTypeRequest">_GetTypeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;documentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;indentation_cr_replacement[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="__Cardinality">__Cardinality: 
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
<summary><span id="__DoubleRefinedType">__DoubleRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;rangeDouble[1,1]: <a href='#__RangeDouble'>__RangeDouble</a> // 
&nbsp;&nbsp;&nbsp;&nbsp;isLast[1,1]: bool // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="__DoubleRefinedType">__DoubleRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__DoubleRefinedType'>__DoubleRefinedType</a>
</pre>
</details>
<details>
<summary><span id="__Fault">__Fault: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#__NativeType'>__NativeType</a>
|<a href='#__TypeUndefined'>__TypeUndefined</a>
|<a href='#__TypeLink'>__TypeLink</a>

 // 
&#125;
</pre>
</details>
<details>
<summary><span id="__Fault">__Fault: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__Fault'>__Fault</a>
</pre>
</details>
<details>
<summary><span id="__IntRefinedType">__IntRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;rangeInt[1,1]: <a href='#__RangeInt'>__RangeInt</a> // 
&nbsp;&nbsp;&nbsp;&nbsp;isLast[1,1]: bool // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="__IntRefinedType">__IntRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__IntRefinedType'>__IntRefinedType</a>
</pre>
</details>
<details>
<summary><span id="__Interface">__Interface: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;types[0,1]: <a href='#__TypeDefinition'>__TypeDefinition</a> // 
&nbsp;&nbsp;operations[0,1]: <a href='#__Operation'>__Operation</a> // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="__Interface">__Interface: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__Interface'>__Interface</a>
</pre>
</details>
<details>
<summary><span id="__LongRefinedType">__LongRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;ranges[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;isLast[1,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;rangeLong[1,1]: <a href='#__RangeLong'>__RangeLong</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="__LongRefinedType">__LongRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__LongRefinedType'>__LongRefinedType</a>
</pre>
</details>
<details>
<summary><span id="__NativeType">__NativeType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;string_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#__StringRefinedType'>__StringRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
|void &#123;
&nbsp;&nbsp;int_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#__IntRefinedType'>__IntRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
|void &#123;
&nbsp;&nbsp;double_type[1,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#__DoubleRefinedType'>__DoubleRefinedType</a> // 
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
&nbsp;&nbsp;&nbsp;&nbsp;refined_type[0,1]: <a href='#__LongRefinedType'>__LongRefinedType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;







</pre>
</details>
<details>
<summary><span id="__NativeType">__NativeType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__NativeType'>__NativeType</a>
</pre>
</details>
<details>
<summary><span id="__Operation">__Operation: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;operation_name[1,1]: string // 
&nbsp;&nbsp;output[0,1]: string // 
&nbsp;&nbsp;input[1,1]: string // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;fault[0,1]: <a href='#__Fault'>__Fault</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="__Operation">__Operation: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__Operation'>__Operation</a>
</pre>
</details>
<details>
<summary><span id="__Port">__Port: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;protocol[0,1]: string // 
&nbsp;&nbsp;interfaces[0,1]: <a href='#__Interface'>__Interface</a> // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;location[1,1]: any // 
&#125;
</pre>
</details>
<details>
<summary><span id="__Port">__Port: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__Port'>__Port</a>
</pre>
</details>
<details>
<summary><span id="__RangeDouble">__RangeDouble: 
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
<summary><span id="__RangeInt">__RangeInt: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;min[1,1]: int // 
&nbsp;&nbsp;max[1,1]: int // 
&#125;
|void &#123;
&nbsp;&nbsp;min[1,1]: int // 
&nbsp;&nbsp;infinite[1,1]: bool // 
&#125;

</pre>
</details>
<details>
<summary><span id="__RangeLong">__RangeLong: 
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
<summary><span id="__Service">__Service: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;output[0,1]: string // 
&nbsp;&nbsp;input[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="__Service">__Service: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__Service'>__Service</a>
</pre>
</details>
<details>
<summary><span id="__StringRefinedType">__StringRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;length[1,1]: <a href='#__RangeInt'>__RangeInt</a> // 
&#125;
|void &#123;
&nbsp;&nbsp;enum[1,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;isLast[1,1]: bool // 
&nbsp;&nbsp;&#125; // 
&#125;
|void &#123;
&nbsp;&nbsp;regex[1,1]: string // 
&#125;


</pre>
</details>
<details>
<summary><span id="__StringRefinedType">__StringRefinedType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__StringRefinedType'>__StringRefinedType</a>
</pre>
</details>
<details>
<summary><span id="__SubType">__SubType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#__Type'>__Type</a> // 
&nbsp;&nbsp;cardinality[1,1]: <a href='#__Cardinality'>__Cardinality</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="__SubType">__SubType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__SubType'>__SubType</a>
</pre>
</details>
<details>
<summary><span id="__Type">__Type: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__TypeInLine'>__TypeInLine</a>
|<a href='#__TypeLink'>__TypeLink</a>
|<a href='#__TypeChoice'>__TypeChoice</a>
|<a href='#__TypeUndefined'>__TypeUndefined</a>



</pre>
</details>
<details>
<summary><span id="__Type">__Type: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__Type'>__Type</a>
</pre>
</details>
<details>
<summary><span id="__TypeChoice">__TypeChoice: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;choice[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;left_type[1,1]: <a href='#__TypeInLine'>__TypeInLine</a>
|<a href='#__TypeLink'>__TypeLink</a>
 // 
&nbsp;&nbsp;&nbsp;&nbsp;right_type[1,1]: <a href='#__Type'>__Type</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="__TypeChoice">__TypeChoice: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__TypeChoice'>__TypeChoice</a>
</pre>
</details>
<details>
<summary><span id="__TypeDefinition">__TypeDefinition: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#__Type'>__Type</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="__TypeDefinition">__TypeDefinition: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__TypeDefinition'>__TypeDefinition</a>
</pre>
</details>
<details>
<summary><span id="__TypeInLine">__TypeInLine: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;root_type[1,1]: <a href='#__NativeType'>__NativeType</a> // 
&nbsp;&nbsp;sub_type[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;isFirst[0,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;isLast[0,1]: bool &#123;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;indentation[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;&nbsp;&nbsp;sb[1,1]: <a href='#__SubType'>__SubType</a> // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="__TypeInLine">__TypeInLine: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__TypeInLine'>__TypeInLine</a>
</pre>
</details>
<details>
<summary><span id="__TypeLink">__TypeLink: 
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
<summary><span id="__TypeLink">__TypeLink: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__TypeLink'>__TypeLink</a>
</pre>
</details>
<details>
<summary><span id="__TypeUndefined">__TypeUndefined: 
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
<summary><span id="__TypeUndefined">__TypeUndefined: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#__TypeUndefined'>__TypeUndefined</a>
</pre>
</details>
