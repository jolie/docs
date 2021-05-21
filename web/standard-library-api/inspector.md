# Include library: inspector.iol

Inclusion code: <pre>include "inspector.iol"</pre>

<table>
  <caption>Service Deployment</caption>
  <thead>
    <tr>
      <th>Port Name</th>
      <th>Location</th>
      <th>Protocol</th>
      <th>Interfaces</th>
    </tr>
  </thead>
  <tbody><tr><td>Inspector documentation: </td></tr>
    <tr>
      <td>Inspector</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#InspectorInterface">InspectorInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="InspectorInterface">InspectorInterface</h3>

Interface documentation: 

<table>
  <thead>
    <tr>
      <th>Operation Name</th>
      <th>Input Type</th>
      <th>Output Type</th>
      <th>Faults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#inspectProgram">inspectProgram</a></td>
      <td><a href="#InspectionRequest">InspectionRequest</a></td>
      <td><a href="#ProgramInspectionResponse">ProgramInspectionResponse</a></td>
      <td>
        ParserException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> ) <br> 
        FileNotFoundException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> ) <br> 
        IOException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> ) <br> 
        SemanticException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> )
      </td>
    </tr>
    <tr>
      <td><a href="#inspectTypes">inspectTypes</a></td>
      <td><a href="#InspectionRequest">InspectionRequest</a></td>
      <td><a href="#TypesInspectionResponse">TypesInspectionResponse</a></td>
      <td>
        ParserException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> ) <br> 
        FileNotFoundException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> ) <br> 
        IOException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> ) <br> 
        SemanticException( <a href="#WeakJavaExceptionType">WeakJavaExceptionType</a> )
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="inspectProgram">inspectProgram</h3>

Operation documentation: 


Invocation template: 
<pre>inspectProgram@Inspector( request )( response )</pre>

<h4 id="InspectionRequest">Request type</h4>

Type: InspectionRequest


<pre>type InspectionRequest: void {
	.filename: string
}</pre>

<code>InspectionRequest : void</code> 

<ul>

  <li><code>filename : string</code> 
</li>

</ul>



<h4 id="ProgramInspectionResponse">Response type</h4>

Type: ProgramInspectionResponse


<pre>type ProgramInspectionResponse: void {
	.port*: PortInfoType
}</pre>

<code>ProgramInspectionResponse : void</code> 

<ul>

  <li><code>port : void</code> 
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>ParserException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( ParserException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>


Fault <code>FileNotFoundException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( FileNotFoundException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>


Fault <code>IOException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>


Fault <code>SemanticException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( SemanticException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>



<h3 id="inspectTypes">inspectTypes</h3>

Operation documentation: 


Invocation template: 
<pre>inspectTypes@Inspector( request )( response )</pre>

<h4 id="InspectionRequest">Request type</h4>

Type: InspectionRequest


<pre>type InspectionRequest: void {
	.filename: string
}</pre>

<code>InspectionRequest : void</code> 

<ul>

  <li><code>filename : string</code> 
</li>

</ul>



<h4 id="TypesInspectionResponse">Response type</h4>

Type: TypesInspectionResponse


<pre>type TypesInspectionResponse: void {
	.type*: TypeInfoType
}</pre>

<code>TypesInspectionResponse : void</code> 

<ul>

  <li><code>type : </code> 
</li>

</ul>




<h4>Possible faults thrown</h4>


Fault <code>ParserException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( ParserException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>


Fault <code>FileNotFoundException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( FileNotFoundException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>


Fault <code>IOException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>


Fault <code>SemanticException</code> with type <code>WeakJavaExceptionType</code>

Fault-handling install template: 
<pre>install ( SemanticException => /* error-handling code */ )</pre>
<pre>type WeakJavaExceptionType: any {
	.stackTrace?: string
}</pre>



<h3>Subtypes</h3>


<h4 id="PortInfoType">PortInfoType</h4>



<pre>type PortInfoType: void {
	.protocol?: string
	.isOutput: bool
	.subtype*: TypeInfoType
	.documentation?: string
	.name: string
	.location?: string
	.interface*: InterfaceInfoType
}</pre>
<code>PortInfoType : void</code> 


<h4 id="TypeInfoType">TypeInfoType</h4>

<pre>type TypeInfoType: void {
	.rootType: string
	.code?: string
	.subtype*: TypeInfoType
	.documentation?: string
	.name?: string
	.undefinedSubtypes?: bool
	.isNative: bool
}</pre>
<code>TypeInfoType : void</code> 


<h4 id="InterfaceInfoType">InterfaceInfoType</h4>



<pre>type InterfaceInfoType: void {
	.documentation?: string
	.name: string
	.operation*: OperationInfoType
}</pre>
<code>InterfaceInfoType : void</code> 


<h4 id="OperationInfoType">OperationInfoType</h4>



<pre>type OperationInfoType: void {
	.responseType?: TypeInfoType
	.requestType: TypeInfoType
	.documentation?: string
	.name: string
	.fault*: FaultInfoType
}</pre>
<code>OperationInfoType : void</code> 


<h4 id="FaultInfoType">FaultInfoType</h4>



<pre>type FaultInfoType: void {
	.name: string
	.faultType: TypeInfoType
}</pre>
<code>FaultInfoType : void</code> 




