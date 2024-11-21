<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Inspector

> from inspector import Inspector

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#InspectorInterface'>InspectorInterface</a> |

### List of Available Interfaces

### InspectorInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| inspectFile | <a href="#InspectionRequest">InspectionRequest</a> | <a href='#FileInspectionResponse'>FileInspectionResponse</a> | <details><summary>ParserException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>FileNotFoundException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>IOException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>SemanticException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details> |  |
| inspectPorts | <a href="#InspectionRequest">InspectionRequest</a> | <a href='#PortInspectionResponse'>PortInspectionResponse</a> | <details><summary>ParserException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>FileNotFoundException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>IOException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>SemanticException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details> |  |
| inspectTypes | <a href="#InspectionRequest">InspectionRequest</a> | <a href='#TypesInspectionResponse'>TypesInspectionResponse</a> | <details><summary>ParserException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>FileNotFoundException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>IOException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details><details><summary>SemanticException</summary><a href='#0#WeakJavaExceptionType'>0#WeakJavaExceptionType</a></details> |  |


### Types

<details>
<summary><span id="FaultInfo">FaultInfo: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="Field">Field: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;range[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;min[1,1]: int // 
&nbsp;&nbsp;&nbsp;&nbsp;max[1,1]: int // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;type[1,1]: <a href='#TypeInfo'>TypeInfo</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="FileInspectionResponse">FileInspectionResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;referredTypes[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;outputPorts[0,1]: <a href='#PortInfo'>PortInfo</a> // 
&nbsp;&nbsp;inputPorts[0,1]: <a href='#PortInfo'>PortInfo</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="InspectionRequest">InspectionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[1,1]: string // 
&nbsp;&nbsp;includePaths[0,1]: string // 
&nbsp;&nbsp;source[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="InterfaceInfo">InterfaceInfo: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;operations[0,1]: <a href='#OperationInfo'>OperationInfo</a> // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="OperationInfo">OperationInfo: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;responseType[0,1]: string // 
&nbsp;&nbsp;requestType[1,1]: string // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;faults[0,1]: <a href='#FaultInfo'>FaultInfo</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="PortInfo">PortInfo: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;protocol[0,1]: string // 
&nbsp;&nbsp;interfaces[0,1]: <a href='#InterfaceInfo'>InterfaceInfo</a> // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;location[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="PortInspectionResponse">PortInspectionResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;referredTypes[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&nbsp;&nbsp;outputPorts[0,1]: <a href='#PortInfo'>PortInfo</a> // 
&nbsp;&nbsp;inputPorts[0,1]: <a href='#PortInfo'>PortInfo</a> // 
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
&nbsp;&nbsp;name[1,1]: string // 
&nbsp;&nbsp;type[1,1]: <a href='#TypeInfo'>TypeInfo</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="TypeInfo">TypeInfo: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;linkedTypeName[1,1]: string // 
&#125;
|void &#123;
&nbsp;&nbsp;untypedFields[1,1]: bool // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;nativeType[1,1]: string // 
&nbsp;&nbsp;fields[0,1]: <a href='#Field'>Field</a> // 
&#125;
|void &#123;
&nbsp;&nbsp;left[1,1]: <a href='#TypeInfo'>TypeInfo</a> // 
&nbsp;&nbsp;documentation[0,1]: string // 
&nbsp;&nbsp;right[1,1]: <a href='#TypeInfo'>TypeInfo</a> // 
&#125;


</pre>
</details>
<details>
<summary><span id="TypesInspectionResponse">TypesInspectionResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="WeakJavaExceptionType">WeakJavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
any &#123;
&nbsp;&nbsp;stackTrace[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="WeakJavaExceptionType">WeakJavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#WeakJavaExceptionType'>WeakJavaExceptionType</a>
</pre>
</details>
