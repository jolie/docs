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


<a id="leftPad"></a>
#### leftPad


Invocation template: <code>leftPad@StringUtils( request )( response )</code>

**Request type**
<a id="PadRequest"></a>
Type documentation: no documentation provided 
<pre>type PadRequest: string {
	.length: int
	.char: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="valueToPrettyString"></a>
#### valueToPrettyString


Invocation template: <code>valueToPrettyString@StringUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="toLowerCase"></a>
#### toLowerCase


Invocation template: <code>toLowerCase@StringUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="length"></a>
#### length


Invocation template: <code>length@StringUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="match"></a>
#### match


Invocation template: <code>match@StringUtils( request )( response )</code>

**Request type**
<a id="MatchRequest"></a>
Type documentation: no documentation provided 
<pre>type MatchRequest: string {
	.regex: string
}</pre>


**Response type**
<a id="MatchResult"></a>
Type documentation: no documentation provided 
<pre>type MatchResult: int {
	.group*: string
}</pre>




---

<a id="replaceFirst"></a>
#### replaceFirst


Invocation template: <code>replaceFirst@StringUtils( request )( response )</code>

**Request type**
<a id="ReplaceRequest"></a>
Type documentation: no documentation provided 
<pre>type ReplaceRequest: string {
	.regex: string
	.replacement: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="sort"></a>
#### sort


Invocation template: <code>sort@StringUtils( request )( response )</code>

**Request type**
<a id="StringItemList"></a>
Type documentation: no documentation provided 
<pre>type StringItemList: void {
	.item*: string
}</pre>


**Response type**
<a id="StringItemList"></a>
Type documentation: no documentation provided 
<pre>type StringItemList: void {
	.item*: string
}</pre>




---

<a id="replaceAll"></a>
#### replaceAll


Invocation template: <code>replaceAll@StringUtils( request )( response )</code>

**Request type**
<a id="ReplaceRequest"></a>
Type documentation: no documentation provided 
<pre>type ReplaceRequest: string {
	.regex: string
	.replacement: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="substring"></a>
#### substring


Invocation template: <code>substring@StringUtils( request )( response )</code>

**Request type**
<a id="SubStringRequest"></a>
Type documentation: no documentation provided 
<pre>type SubStringRequest: string {
	.end: int
	.begin: int
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="getRandomUUID"></a>
#### getRandomUUID
Operation documentation: 
	 it returns a random UUID
	

Invocation template: <code>getRandomUUID@StringUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="rightPad"></a>
#### rightPad


Invocation template: <code>rightPad@StringUtils( request )( response )</code>

**Request type**
<a id="PadRequest"></a>
Type documentation: no documentation provided 
<pre>type PadRequest: string {
	.length: int
	.char: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="contains"></a>
#### contains
Operation documentation: 
	  Returns true if the string contains .substring
	 

Invocation template: <code>contains@StringUtils( request )( response )</code>

**Request type**
<a id="ContainsRequest"></a>
Type documentation: no documentation provided 
<pre>type ContainsRequest: string {
	.substring: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="split"></a>
#### split


Invocation template: <code>split@StringUtils( request )( response )</code>

**Request type**
<a id="SplitRequest"></a>
Type documentation: no documentation provided 
<pre>type SplitRequest: string {
	.regex: string
	.limit?: int
}</pre>


**Response type**
<a id="SplitResult"></a>
Type documentation: no documentation provided 
<pre>type SplitResult: void {
	.result*: string
}</pre>




---

<a id="splitByLength"></a>
#### splitByLength


Invocation template: <code>splitByLength@StringUtils( request )( response )</code>

**Request type**
<a id="SplitByLengthRequest"></a>
Type documentation: no documentation provided 
<pre>type SplitByLengthRequest: string {
	.length: int
}</pre>


**Response type**
<a id="SplitResult"></a>
Type documentation: no documentation provided 
<pre>type SplitResult: void {
	.result*: string
}</pre>




---

<a id="trim"></a>
#### trim


Invocation template: <code>trim@StringUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="find"></a>
#### find


Invocation template: <code>find@StringUtils( request )( response )</code>

**Request type**
<a id="MatchRequest"></a>
Type documentation: no documentation provided 
<pre>type MatchRequest: string {
	.regex: string
}</pre>


**Response type**
<a id="MatchResult"></a>
Type documentation: no documentation provided 
<pre>type MatchResult: int {
	.group*: string
}</pre>




---

<a id="endsWith"></a>
#### endsWith
Operation documentation: 
	  checks if a string ends with a given suffix
	

Invocation template: <code>endsWith@StringUtils( request )( response )</code>

**Request type**
<a id="EndsWithRequest"></a>
Type documentation: no documentation provided 
<pre>type EndsWithRequest: string {
	.suffix: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="toUpperCase"></a>
#### toUpperCase


Invocation template: <code>toUpperCase@StringUtils( request )( response )</code>

**Request type**

Type documentation: no documentation provided 



**Response type**

Type documentation: no documentation provided 





---

<a id="join"></a>
#### join


Invocation template: <code>join@StringUtils( request )( response )</code>

**Request type**
<a id="JoinRequest"></a>
Type documentation: no documentation provided 
<pre>type JoinRequest: void {
	.piece*: string
	.delimiter: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="indexOf"></a>
#### indexOf


Invocation template: <code>indexOf@StringUtils( request )( response )</code>

**Request type**
<a id="IndexOfRequest"></a>
Type documentation: no documentation provided 
<pre>type IndexOfRequest: string {
	.word: string
}</pre>


**Response type**
<a id="IndexOfResponse"></a>
Type documentation: no documentation provided 
<pre>type IndexOfResponse: int</pre>




---

<a id="startsWith"></a>
#### startsWith
Operation documentation: 
	 checks if the passed string starts with a given prefix
	

Invocation template: <code>startsWith@StringUtils( request )( response )</code>

**Request type**
<a id="StartsWithRequest"></a>
Type documentation: no documentation provided 
<pre>type StartsWithRequest: string {
	.prefix: string
}</pre>


**Response type**

Type documentation: no documentation provided 





---





