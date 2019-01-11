# Include library: math.iol

Inclusion code: <pre>include "math.iol"</pre>

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



<h4 id="random">random</h4>
Operation documentation:  Returns a random number d such that 0.0 <= d < 1.0. 


Invocation template: <pre>random@Math( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="abs">abs</h4>
Operation documentation:  Returns the absolute value of the input integer. 


Invocation template: <pre>abs@Math( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="round">round</h4>



Invocation template: <pre>round@Math( request )( response )</pre>

<h4 id="RoundRequestType">Request type</h4>

Type documentation: no documentation provided 
<pre>type RoundRequestType: double {
	.decimals?: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="pi">pi</h4>
Operation documentation:  Returns the PI constant 


Invocation template: <pre>pi@Math( request )( response )</pre>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="pow">pow</h4>
Operation documentation:  Returns the result of .base to the power of .exponent (see request data type). 


Invocation template: <pre>pow@Math( request )( response )</pre>

<h4 id="PowRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type PowRequest: void {
	.base: double
	.exponent: double
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="summation">summation</h4>
Operation documentation:  Returns the summation of values from .from to .to (see request data type). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14. 


Invocation template: <pre>summation@Math( request )( response )</pre>

<h4 id="SummationRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SummationRequest: void {
	.from: int
	.to: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 










