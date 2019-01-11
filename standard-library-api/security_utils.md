# Include library: security_utils.iol

Inclusion code: <pre>include "security_utils.iol"</pre>

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

<h2>Operation Description</h2>



<h3 id="secureRandom">secureRandom</h3>


Invocation template: <pre>secureRandom@SecurityUtils( request )( response )</pre>

<h4 id="SecureRandomRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SecureRandomRequest: void {
	.size: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="createSecureToken">createSecureToken</h3>


Invocation template: <pre>createSecureToken@SecurityUtils( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 











