<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service MetaJolieJavaService

> from metajolie import MetaJolieJavaService

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#MetaJolieJavaServiceInterface'>MetaJolieJavaServiceInterface</a> |

### List of Available Interfaces

### MetaJolieJavaServiceInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| checkNativeType | <a href="#CheckNativeTypeRequest">CheckNativeTypeRequest</a> | <a href='#CheckNativeTypeResponse'>CheckNativeTypeResponse</a> | - |  |
| getInputPortMetaData | <a href="#GetMetaDataRequest">GetMetaDataRequest</a> | <a href='#GetInputPortMetaDataResponse'>GetInputPortMetaDataResponse</a> | <details><summary>ParserException</summary><a href='#ParserExceptionType'>ParserExceptionType</a></details><details><summary>InputPortMetaDataFault</summary>undefined</details><details><summary>SemanticException</summary><a href='#SemanticExceptionType'>SemanticExceptionType</a></details> |  |
| getMetaData | <a href="#GetMetaDataRequest">GetMetaDataRequest</a> | <a href='#GetMetaDataResponse'>GetMetaDataResponse</a> | <details><summary>ParserException</summary><a href='#ParserExceptionType'>ParserExceptionType</a></details><details><summary>SemanticException</summary><a href='#SemanticExceptionType'>SemanticExceptionType</a></details> |  |
| getNativeTypeFromString | <a href="#GetNativeTypeFromStringRequest">GetNativeTypeFromStringRequest</a> | <a href='#NativeType'>NativeType</a> | <details><summary>NativeTypeDoesNotExist</summary>undefined</details> |  |
| getNativeTypeStringList | <a href="#void">void</a> | <a href='#GetNativeTypeStringListResponse'>GetNativeTypeStringListResponse</a> | - |  |
| getOutputPortMetaData | <a href="#GetMetaDataRequest">GetMetaDataRequest</a> | <a href='#GetOutputPortMetaDataResponse'>GetOutputPortMetaDataResponse</a> | <details><summary>OutputPortMetaDataFault</summary>undefined</details><details><summary>ParserException</summary><a href='#ParserExceptionType'>ParserExceptionType</a></details><details><summary>SemanticException</summary><a href='#SemanticExceptionType'>SemanticExceptionType</a></details> |  |
| messageTypeCast | <a href="#MessageTypeCastRequest">MessageTypeCastRequest</a> | <a href='#MessageTypeCastResponse'>MessageTypeCastResponse</a> | <details><summary>TypeMismatch</summary>undefined</details> |  |


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
<summary><span id="CheckNativeTypeRequest">CheckNativeTypeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;type_name[1,1]: string //  the type name to check it is native
&#125;
</pre>
</details>
<details>
<summary><span id="CheckNativeTypeResponse">CheckNativeTypeResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;result[1,1]: bool // 
&#125;
</pre>
</details>
<details>
<summary><span id="CommunicationDependency">CommunicationDependency: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;input_operation[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string // name of the operation
&nbsp;&nbsp;&nbsp;&nbsp;type[1,1]: string // RequestResponse or OneWay
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;dependencies[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;port[0,1]: string //  defined only if type is Notification or SolicitResponse
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string //  name of the operation
&nbsp;&nbsp;&nbsp;&nbsp;type[1,1]: string // RequestResponse, OneWay, SolicitResponse or Notification
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
<summary><span id="GetInputPortMetaDataResponse">GetInputPortMetaDataResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;input[0,1]: <a href='#Port'>Port</a> //  the full description of each input port of the service definition
&#125;
</pre>
</details>
<details>
<summary><span id="GetMetaDataRequest">GetMetaDataRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[1,1]: string //  the filename where the service definition is
&#125;
</pre>
</details>
<details>
<summary><span id="GetMetaDataResponse">GetMetaDataResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;output[0,1]: <a href='#Port'>Port</a> //  the definitions of all the output ports
&nbsp;&nbsp;input[0,1]: <a href='#Port'>Port</a> //  the definitions of all the input ports
&nbsp;&nbsp;interfaces[0,1]: <a href='#Interface'>Interface</a> //  the definitions of all the interfaces
&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> //  the definitions of all the types
&nbsp;&nbsp;service[0,1]: <a href='#Service'>Service</a> //  the definition of the service
&nbsp;&nbsp;embeddedServices[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;servicepath[1,1]: string //  path where the service can be found
&nbsp;&nbsp;&nbsp;&nbsp;type[1,1]: string //  type of the embedded service
&nbsp;&nbsp;&nbsp;&nbsp;portId[0,1]: string //  target output port where the embedded service is bound
&nbsp;&nbsp;&#125; //  the definitions of all the embedded services
&nbsp;&nbsp;communication_dependencies[0,1]: <a href='#CommunicationDependency'>CommunicationDependency</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetNativeTypeFromStringRequest">GetNativeTypeFromStringRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;type_name[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetNativeTypeStringListResponse">GetNativeTypeStringListResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;native_type[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="GetOutputPortMetaDataResponse">GetOutputPortMetaDataResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;output[0,1]: <a href='#Port'>Port</a> //  the full description of each output port of the service definition
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
<summary><span id="MessageTypeCastRequest">MessageTypeCastRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;types[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;types[0,1]: <a href='#TypeDefinition'>TypeDefinition</a> //  list of all the required types
&nbsp;&nbsp;&nbsp;&nbsp;messageTypeName[1,1]: string //  starting type to user for casting
&nbsp;&nbsp;&#125; //  the types to use for casting the message
&nbsp;&nbsp;message[1,1]: undefined //  the message to be cast
&#125;
</pre>
</details>
<details>
<summary><span id="MessageTypeCastResponse">MessageTypeCastResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;message[1,1]: undefined //  casted message
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
<summary><span id="ParserExceptionType">ParserExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;line[1,1]: int // 
&nbsp;&nbsp;sourceName[1,1]: string // 
&nbsp;&nbsp;message[1,1]: string // 
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
<summary><span id="SemanticExceptionType">SemanticExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;error[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;line[1,1]: int // 
&nbsp;&nbsp;&nbsp;&nbsp;sourceName[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;message[1,1]: string // 
&nbsp;&nbsp;&#125; // 
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
