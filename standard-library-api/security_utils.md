# Include library: security_utils.iol

Inclusion code: <code>include "security_utils.iol"</code>

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
      <td>SecurityUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#SecurityUtilsInterface">SecurityUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="SecurityUtilsInterface">SecurityUtilsInterface</h3>

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
      <td><a href="#secureRandom">secureRandom</a></td>
      <td><a href="#SecureRandomRequest">SecureRandomRequest</a></td>
      <td>raw</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#createSecureToken">createSecureToken</a></td>
      <td>void</td>
      <td>string</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="secureRandom"></a>
#### secureRandom


Invocation template: <code>secureRandom@SecurityUtils( request )( response )</code>

**Request type**
<a id="SecureRandomRequest"></a>
Type documentation: no documentation provided 
<pre>type SecureRandomRequest: void {
	.size: int
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="createSecureToken"></a>
#### createSecureToken


Invocation template: <code>createSecureToken@SecurityUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---





