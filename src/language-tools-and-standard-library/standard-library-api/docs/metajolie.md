# Service MetaJolieJavaService

> from metajolie import MetaJolieJavaService

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| Utils | local | | <a href='#MetaJolieUtilsInterface'>MetaJolieUtilsInterface</a> |

### List of Available Interfaces

### MetaJolieUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| checkOperationTypes | <a href="#CheckOperationTypesRequest">CheckOperationTypesRequest</a> | <a href='#bool'>bool</a> | <details><summary>TypeMissing</summary>string)</details> |  |
| typeLessThan | <a href="#TypeLessThanRequest">TypeLessThanRequest</a> | <a href='#bool'>bool</a> | <details><summary>TypeMissing</summary>string)</details> |  |


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
<summary><span id="CheckOperationTypesRequest">CheckOperationTypesRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;t1[1,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;t2[1,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;&#125; // 
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
<summary><span id="TypeLessThanRequest">TypeLessThanRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;t1[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;t2[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;&nbsp;&nbsp;type[1,1]: <a href='#Type'>Type</a> // 
&nbsp;&nbsp;&#125; // 
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
