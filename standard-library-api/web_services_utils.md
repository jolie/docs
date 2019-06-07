# Include library: web_services_utils.iol

Inclusion code: <pre>include "web_services_utils.iol"</pre>

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
  <tbody><tr><td>WebServicesUtils documentation: </td></tr>
    <tr>
      <td>WebServicesUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#WebServicesUtilsInterface">WebServicesUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="WebServicesUtilsInterface">WebServicesUtilsInterface</h3>

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
      <td><a href="#wsdlToJolie">wsdlToJolie</a></td>
      <td>string</td>
      <td>string</td>
      <td>
        IOException( <a href="#IOExceptionType">IOExceptionType</a> )
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="wsdlToJolie">wsdlToJolie</h3>

Operation documentation: 


Invocation template: 
<pre>wsdlToJolie@WebServicesUtils( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: string




<code>string : string</code> 




<h4>Possible faults thrown</h4>


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: 
<pre>install ( IOException => /* error-handling code */ )</pre>
<pre>type IOExceptionType: JavaExceptionType</pre>



<h3>Subtypes</h3>


<h4 id="JavaExceptionType">JavaExceptionType</h4>



<pre>type JavaExceptionType: string {
	.stackTrace: string
}</pre>
<code>JavaExceptionType : string</code> 




