# Include library: web_services_utils.iol

Inclusion code: <code>include "web_services_utils.iol"</code>

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
  <tbody>
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

### Operation Description


<a id="wsdlToJolie"></a>
#### wsdlToJolie


Invocation template: <code>wsdlToJolie@WebServicesUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>IOException</code> with type <code>IOExceptionType</code>

Fault-handling install template: <code>install ( IOException => /* error-handling code */ )</code>
<pre>type IOExceptionType: JavaExceptionType</pre>

---


<h4>Subtypes</h4>


<a id="IOExceptionType"></a>
IOExceptionType

<pre>type IOExceptionType: JavaExceptionType</pre>




