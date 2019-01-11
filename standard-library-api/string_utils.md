# Include library: string_utils.iol

Inclusion code: <code>include "string_utils.iol"</code>

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
      <td>StringUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#StringUtilsInterface">StringUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="StringUtilsInterface">StringUtilsInterface</h3>

Interface documentation: 
  An interface for supporting string manipulation operations.
 

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
      <td><a href="#leftPad">leftPad</a></td>
      <td><a href="#PadRequest">PadRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#valueToPrettyString">valueToPrettyString</a></td>
      <td>undefined</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#toLowerCase">toLowerCase</a></td>
      <td>string</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#length">length</a></td>
      <td>string</td>
      <td>int</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#match">match</a></td>
      <td><a href="#MatchRequest">MatchRequest</a></td>
      <td><a href="#MatchResult">MatchResult</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#replaceFirst">replaceFirst</a></td>
      <td><a href="#ReplaceRequest">ReplaceRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#sort">sort</a></td>
      <td><a href="#StringItemList">StringItemList</a></td>
      <td><a href="#StringItemList">StringItemList</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#replaceAll">replaceAll</a></td>
      <td><a href="#ReplaceRequest">ReplaceRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#substring">substring</a></td>
      <td><a href="#SubStringRequest">SubStringRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#getRandomUUID">getRandomUUID</a></td>
      <td>void</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#rightPad">rightPad</a></td>
      <td><a href="#PadRequest">PadRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#contains">contains</a></td>
      <td><a href="#ContainsRequest">ContainsRequest</a></td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#split">split</a></td>
      <td><a href="#SplitRequest">SplitRequest</a></td>
      <td><a href="#SplitResult">SplitResult</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#splitByLength">splitByLength</a></td>
      <td><a href="#SplitByLengthRequest">SplitByLengthRequest</a></td>
      <td><a href="#SplitResult">SplitResult</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#trim">trim</a></td>
      <td>string</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#find">find</a></td>
      <td><a href="#MatchRequest">MatchRequest</a></td>
      <td><a href="#MatchResult">MatchResult</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#endsWith">endsWith</a></td>
      <td><a href="#EndsWithRequest">EndsWithRequest</a></td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#toUpperCase">toUpperCase</a></td>
      <td>string</td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#join">join</a></td>
      <td><a href="#JoinRequest">JoinRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#indexOf">indexOf</a></td>
      <td><a href="#IndexOfRequest">IndexOfRequest</a></td>
      <td><a href="#IndexOfResponse">IndexOfResponse</a></td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#startsWith">startsWith</a></td>
      <td><a href="#StartsWithRequest">StartsWithRequest</a></td>
      <td>bool</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

### Operation Description


#### leftPad


Invocation template: <code>leftPad@StringUtils( request )( response )</code>

<h4 id="PadRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type PadRequest: string {
	.length: int
	.char: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### valueToPrettyString


Invocation template: <code>valueToPrettyString@StringUtils( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### toLowerCase


Invocation template: <code>toLowerCase@StringUtils( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### length


Invocation template: <code>length@StringUtils( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### match


Invocation template: <code>match@StringUtils( request )( response )</code>

<h4 id="MatchRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type MatchRequest: string {
	.regex: string
}</pre>


<h4 id="MatchResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type MatchResult: int {
	.group*: string
}</pre>




---

#### replaceFirst


Invocation template: <code>replaceFirst@StringUtils( request )( response )</code>

<h4 id="ReplaceRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ReplaceRequest: string {
	.regex: string
	.replacement: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### sort


Invocation template: <code>sort@StringUtils( request )( response )</code>

<h4 id="StringItemList">Request type</h4>

Type documentation: no documentation provided 
<pre>type StringItemList: void {
	.item*: string
}</pre>


<h4 id="StringItemList">Response type</h4>
Type documentation: no documentation provided 
<pre>type StringItemList: void {
	.item*: string
}</pre>




---

#### replaceAll


Invocation template: <code>replaceAll@StringUtils( request )( response )</code>

<h4 id="ReplaceRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ReplaceRequest: string {
	.regex: string
	.replacement: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### substring


Invocation template: <code>substring@StringUtils( request )( response )</code>

<h4 id="SubStringRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SubStringRequest: string {
	.end: int
	.begin: int
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### getRandomUUID
Operation documentation: 
	 it returns a random UUID
	

Invocation template: <code>getRandomUUID@StringUtils( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### rightPad


Invocation template: <code>rightPad@StringUtils( request )( response )</code>

<h4 id="PadRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type PadRequest: string {
	.length: int
	.char: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### contains
Operation documentation: 
	  Returns true if the string contains .substring
	 

Invocation template: <code>contains@StringUtils( request )( response )</code>

<h4 id="ContainsRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ContainsRequest: string {
	.substring: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### split


Invocation template: <code>split@StringUtils( request )( response )</code>

<h4 id="SplitRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SplitRequest: string {
	.regex: string
	.limit?: int
}</pre>


<h4 id="SplitResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type SplitResult: void {
	.result*: string
}</pre>




---

#### splitByLength


Invocation template: <code>splitByLength@StringUtils( request )( response )</code>

<h4 id="SplitByLengthRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SplitByLengthRequest: string {
	.length: int
}</pre>


<h4 id="SplitResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type SplitResult: void {
	.result*: string
}</pre>




---

#### trim


Invocation template: <code>trim@StringUtils( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### find


Invocation template: <code>find@StringUtils( request )( response )</code>

<h4 id="MatchRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type MatchRequest: string {
	.regex: string
}</pre>


<h4 id="MatchResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type MatchResult: int {
	.group*: string
}</pre>




---

#### endsWith
Operation documentation: 
	  checks if a string ends with a given suffix
	

Invocation template: <code>endsWith@StringUtils( request )( response )</code>

<h4 id="EndsWithRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type EndsWithRequest: string {
	.suffix: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### toUpperCase


Invocation template: <code>toUpperCase@StringUtils( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### join


Invocation template: <code>join@StringUtils( request )( response )</code>

<h4 id="JoinRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type JoinRequest: void {
	.piece*: string
	.delimiter: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---

#### indexOf


Invocation template: <code>indexOf@StringUtils( request )( response )</code>

<h4 id="IndexOfRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type IndexOfRequest: string {
	.word: string
}</pre>


<h4 id="IndexOfResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type IndexOfResponse: int</pre>




---

#### startsWith
Operation documentation: 
	 checks if the passed string starts with a given prefix
	

Invocation template: <code>startsWith@StringUtils( request )( response )</code>

<h4 id="StartsWithRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type StartsWithRequest: string {
	.prefix: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 





---





