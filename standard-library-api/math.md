# Include library: math.iol

Inclusion code: <code>include "math.iol"</code>

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
      <td>Math</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#MathInterface">MathInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="MathInterface">MathInterface</h3>

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
      <td><a href="#random">random</a></td>
      <td>void</td>
      <td>double</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#abs">abs</a></td>
      <td>int</td>
      <td>int</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#round">round</a></td>
      <td><a href="#RoundRequestType">RoundRequestType</a></td>
      <td>double</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#pi">pi</a></td>
      <td>void</td>
      <td>double</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#pow">pow</a></td>
      <td><a href="#PowRequest">PowRequest</a></td>
      <td>double</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#summation">summation</a></td>
      <td><a href="#SummationRequest">SummationRequest</a></td>
      <td>int</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


<a id="random"></a>
#### random
Operation documentation:  Returns a random number d such that 0.0 <= d < 1.0. 

Invocation template: <code>random@Math( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="abs"></a>
#### abs
Operation documentation:  Returns the absolute value of the input integer. 

Invocation template: <code>abs@Math( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="round"></a>
#### round


Invocation template: <code>round@Math( request )( response )</code>

**Request type**
<a id="RoundRequestType"></a>
Type documentation: no documentation provided 
<pre>type RoundRequestType: double {
	.decimals?: int
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="pi"></a>
#### pi
Operation documentation:  Returns the PI constant 

Invocation template: <code>pi@Math( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="pow"></a>
#### pow
Operation documentation:  Returns the result of .base to the power of .exponent (see request data type). 

Invocation template: <code>pow@Math( request )( response )</code>

**Request type**
<a id="PowRequest"></a>
Type documentation: no documentation provided 
<pre>type PowRequest: void {
	.base: double
	.exponent: double
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="summation"></a>
#### summation
Operation documentation:  Returns the summation of values from .from to .to (see request data type). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14. 

Invocation template: <code>summation@Math( request )( response )</code>

**Request type**
<a id="SummationRequest"></a>
Type documentation: no documentation provided 
<pre>type SummationRequest: void {
	.from: int
	.to: int
}</pre>


**Response type**

Type documentation: no documentation provided 





---





