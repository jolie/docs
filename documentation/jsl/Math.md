<html>
<head></head><body>
<h1>JolieDoc for Port Math</h1>
<h2>From file <code>math.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Math</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#MathInterface">MathInterface </a>
</ul>
<hr>
<h2 id=MathInterface>Interface MathInterface</h2>
<a name="MathInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#abs">abs</a></td>
<td>int<br /></td>
<td>int<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#pi">pi</a></td>
<td>void<br /></td>
<td>double<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#pow">pow</a></td>
<td><a href="#PowRequest">PowRequest</a><br /></td>
<td>double<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#random">random</a></td>
<td>void<br /></td>
<td>double<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#round">round</a></td>
<td><a href="#RoundRequestType">RoundRequestType</a><br /></td>
<td>double<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#summation">summation</a></td>
<td><a href="#SummationRequest">SummationRequest</a><br /></td>
<td>int<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="random"></a><h3 id="random">random</h3></div>
<pre>random( <a href="#void">void</a> )( <a href="#double">double</a> )
</pre>
<span class="opdoc"><p>Returns a random number d such that 0.0 <= d < 1.0.</p></span>
<div class="operation-title"><a name="abs"></a><h3 id="abs">abs</h3></div>
<pre>abs( <a href="#int">int</a> )( <a href="#int">int</a> )
</pre>
<span class="opdoc"><p>Returns the absolute value of the input integer.</p></span>
<div class="operation-title"><a name="round"></a><h3 id="round">round</h3></div>
<pre>round( <a href="#RoundRequestType">RoundRequestType</a> )( <a href="#double">double</a> )
</pre>
<div class="operation-title"><a name="pi"></a><h3 id="pi">pi</h3></div>
<pre>pi( <a href="#void">void</a> )( <a href="#double">double</a> )
</pre>
<span class="opdoc"><p>Returns the PI constant</p></span>
<div class="operation-title"><a name="pow"></a><h3 id="pow">pow</h3></div>
<pre>pow( <a href="#PowRequest">PowRequest</a> )( <a href="#double">double</a> )
</pre>
<span class="opdoc"><p>Returns the result of .base to the power of .exponent (see request data type).</p></span>
<div class="operation-title"><a name="summation"></a><h3 id="summation">summation</h3></div>
<pre>summation( <a href="#SummationRequest">SummationRequest</a> )( <a href="#int">int</a> )
</pre>
<span class="opdoc"><p>Returns the summation of values from .from to .to (see request data type). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14.</p></span>
<hr>
<h2>Message type list</h2>
<a name="RoundRequestType"></a><h3 id="RoundRequestType">RoundRequestType</h3>
<pre lang="jolie">type RoundRequestType: double { 
    .decimals?: int
}</pre>
<a name="PowRequest"></a><h3 id="PowRequest">PowRequest</h3>
<pre lang="jolie">type PowRequest: void { 
    .base: double
    .exponent: double
}</pre>
<a name="SummationRequest"></a><h3 id="SummationRequest">SummationRequest</h3>
<pre lang="jolie">type SummationRequest: void { 
    .from: int
    .to: int
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
