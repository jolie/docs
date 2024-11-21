<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Math

> from math import Math

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#MathInterface'>MathInterface</a> |

### List of Available Interfaces

### MathInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| abs | <a href="#int">int</a> | <a href='#int'>int</a> | - |  Returns the absolute value of the input integer.  |
| pi | <a href="#void">void</a> | <a href='#double'>double</a> | - |  Returns the PI constant  |
| pow | <a href="#PowRequest">PowRequest</a> | <a href='#double'>double</a> | - |  Returns the result of .base to the power of .exponent (see request data type).  |
| random | <a href="#void">void</a> | <a href='#double'>double</a> | - |  Returns a random number d such that 0.0 <= d < 1.0.  |
| round | <a href="#RoundRequestType">RoundRequestType</a> | <a href='#double'>double</a> | - |  |
| summation | <a href="#SummationRequest">SummationRequest</a> | <a href='#int'>int</a> | - |  Returns the summation of values from .from to .to (see request data type). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14.  |


### Types

<details>
<summary><span id="PowRequest">PowRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;base[1,1]: double // 
&nbsp;&nbsp;exponent[1,1]: double // 
&#125;
</pre>
</details>
<details>
<summary><span id="RoundRequestType">RoundRequestType: 
</span>
</summary>

##### Type Declaration
<pre>
double &#123;
&nbsp;&nbsp;decimals[0,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="SummationRequest">SummationRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;from[1,1]: int // 
&nbsp;&nbsp;to[1,1]: int // 
&#125;
</pre>
</details>
