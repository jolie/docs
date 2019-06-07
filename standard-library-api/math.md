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
  <tbody><tr><td>Math documentation: </td></tr>
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

<h2>Operation Description</h2>



<h3 id="random">random</h3>

Operation documentation:  Returns a random number d such that 0.0 <= d < 1.0. 


Invocation template: 
<pre>random@Math( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4>Response type</h4>

Type: double




<code>double : double</code> 








<h3 id="abs">abs</h3>

Operation documentation:  Returns the absolute value of the input integer. 


Invocation template: 
<pre>abs@Math( request )( response )</pre>

<h4>Request type</h4>

Type: int




<code>int : int</code> 



<h4>Response type</h4>

Type: int




<code>int : int</code> 








<h3 id="round">round</h3>

Operation documentation:  Returns the PI constant 


Invocation template: 
<pre>round@Math( request )( response )</pre>

<h4 id="RoundRequestType">Request type</h4>

Type: RoundRequestType


<pre>type RoundRequestType: double {
	.decimals?: int
}</pre>

<code>RoundRequestType : double</code> 

<ul>

  <li><code>decimals : int</code> 
</li>

</ul>



<h4>Response type</h4>

Type: double




<code>double : double</code> 








<h3 id="pi">pi</h3>

Operation documentation:  Returns the PI constant 


Invocation template: 
<pre>pi@Math( request )( response )</pre>

<h4>Request type</h4>

Type: void




<code>void : void</code> 



<h4>Response type</h4>

Type: double




<code>double : double</code> 








<h3 id="pow">pow</h3>

Operation documentation:  Returns the result of .base to the power of .exponent (see request data type). 


Invocation template: 
<pre>pow@Math( request )( response )</pre>

<h4 id="PowRequest">Request type</h4>

Type: PowRequest


<pre>type PowRequest: void {
	.base: double
	.exponent: double
}</pre>

<code>PowRequest : void</code> 

<ul>

  <li><code>base : double</code> 
</li>

  <li><code>exponent : double</code> 
</li>

</ul>



<h4>Response type</h4>

Type: double




<code>double : double</code> 








<h3 id="summation">summation</h3>

Operation documentation:  Returns the summation of values from .from to .to (see request data type). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14. 


Invocation template: 
<pre>summation@Math( request )( response )</pre>

<h4 id="SummationRequest">Request type</h4>

Type: SummationRequest


<pre>type SummationRequest: void {
	.from: int
	.to: int
}</pre>

<code>SummationRequest : void</code> 

<ul>

  <li><code>from : int</code> 
</li>

  <li><code>to : int</code> 
</li>

</ul>



<h4>Response type</h4>

Type: int




<code>int : int</code> 










