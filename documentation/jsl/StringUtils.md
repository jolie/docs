<html>
<head></head><body>
<h1>JolieDoc for Port StringUtils</h1>
<h2>From file <code>string_utils.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>StringUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#StringUtilsInterface">StringUtilsInterface </a>
</ul>
<hr>
<h2 id=StringUtilsInterface>Interface StringUtilsInterface</h2>
<a name="StringUtilsInterface"></a>
An interface for supporting string manipulation operations.
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#contains">contains</a></td>
<td><a href="#ContainsRequest">ContainsRequest</a><br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#endsWith">endsWith</a></td>
<td><a href="#EndsWithRequest">EndsWithRequest</a><br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#find">find</a></td>
<td><a href="#MatchRequest">MatchRequest</a><br /></td>
<td><a href="#MatchResult">MatchResult</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#getRandomUUID">getRandomUUID</a></td>
<td>void<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#indexOf">indexOf</a></td>
<td><a href="#IndexOfRequest">IndexOfRequest</a><br /></td>
<td>IndexOfResponse<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#join">join</a></td>
<td><a href="#JoinRequest">JoinRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#leftPad">leftPad</a></td>
<td><a href="#PadRequest">PadRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#length">length</a></td>
<td>string<br /></td>
<td>int<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#match">match</a></td>
<td><a href="#MatchRequest">MatchRequest</a><br /></td>
<td><a href="#MatchResult">MatchResult</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#replaceAll">replaceAll</a></td>
<td><a href="#ReplaceRequest">ReplaceRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#replaceFirst">replaceFirst</a></td>
<td><a href="#ReplaceRequest">ReplaceRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#rightPad">rightPad</a></td>
<td><a href="#PadRequest">PadRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#sort">sort</a></td>
<td><a href="#StringItemList">StringItemList</a><br /></td>
<td><a href="#StringItemList">StringItemList</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#split">split</a></td>
<td><a href="#SplitRequest">SplitRequest</a><br /></td>
<td><a href="#SplitResult">SplitResult</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#splitByLength">splitByLength</a></td>
<td><a href="#SplitByLengthRequest">SplitByLengthRequest</a><br /></td>
<td><a href="#SplitResult">SplitResult</a><br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#startsWith">startsWith</a></td>
<td><a href="#StartsWithRequest">StartsWithRequest</a><br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#substring">substring</a></td>
<td><a href="#SubStringRequest">SubStringRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#toLowerCase">toLowerCase</a></td>
<td>string<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#toUpperCase">toUpperCase</a></td>
<td>string<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#trim">trim</a></td>
<td>string<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#valueToPrettyString">valueToPrettyString</a></td>
<td>undefined<br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="leftPad"></a><h3 id="leftPad">leftPad</h3></div>
<pre>leftPad( <a href="#PadRequest">PadRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="valueToPrettyString"></a><h3 id="valueToPrettyString">valueToPrettyString</h3></div>
<pre>valueToPrettyString( <a href="#undefined">undefined</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="toLowerCase"></a><h3 id="toLowerCase">toLowerCase</h3></div>
<pre>toLowerCase( <a href="#string">string</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="length"></a><h3 id="length">length</h3></div>
<pre>length( <a href="#string">string</a> )( <a href="#int">int</a> )
</pre>
<div class="operation-title"><a name="match"></a><h3 id="match">match</h3></div>
<pre>match( <a href="#MatchRequest">MatchRequest</a> )( <a href="#MatchResult">MatchResult</a> )
</pre>
<div class="operation-title"><a name="replaceFirst"></a><h3 id="replaceFirst">replaceFirst</h3></div>
<pre>replaceFirst( <a href="#ReplaceRequest">ReplaceRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="sort"></a><h3 id="sort">sort</h3></div>
<pre>sort( <a href="#StringItemList">StringItemList</a> )( <a href="#StringItemList">StringItemList</a> )
</pre>
<div class="operation-title"><a name="replaceAll"></a><h3 id="replaceAll">replaceAll</h3></div>
<pre>replaceAll( <a href="#ReplaceRequest">ReplaceRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="substring"></a><h3 id="substring">substring</h3></div>
<pre>substring( <a href="#SubStringRequest">SubStringRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="getRandomUUID"></a><h3 id="getRandomUUID">getRandomUUID</h3></div>
<pre>getRandomUUID( <a href="#void">void</a> )( <a href="#string">string</a> )
</pre>
<span class="opdoc"><p>it returns a random UUID</p></span>
<div class="operation-title"><a name="rightPad"></a><h3 id="rightPad">rightPad</h3></div>
<pre>rightPad( <a href="#PadRequest">PadRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="contains"></a><h3 id="contains">contains</h3></div>
<pre>contains( <a href="#ContainsRequest">ContainsRequest</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>Returns true if the string contains .substring</p></span>
<div class="operation-title"><a name="split"></a><h3 id="split">split</h3></div>
<pre>split( <a href="#SplitRequest">SplitRequest</a> )( <a href="#SplitResult">SplitResult</a> )
</pre>
<div class="operation-title"><a name="splitByLength"></a><h3 id="splitByLength">splitByLength</h3></div>
<pre>splitByLength( <a href="#SplitByLengthRequest">SplitByLengthRequest</a> )( <a href="#SplitResult">SplitResult</a> )
</pre>
<div class="operation-title"><a name="trim"></a><h3 id="trim">trim</h3></div>
<pre>trim( <a href="#string">string</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="find"></a><h3 id="find">find</h3></div>
<pre>find( <a href="#MatchRequest">MatchRequest</a> )( <a href="#MatchResult">MatchResult</a> )
</pre>
<div class="operation-title"><a name="endsWith"></a><h3 id="endsWith">endsWith</h3></div>
<pre>endsWith( <a href="#EndsWithRequest">EndsWithRequest</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>checks if a string ends with a given suffix</p></span>
<div class="operation-title"><a name="toUpperCase"></a><h3 id="toUpperCase">toUpperCase</h3></div>
<pre>toUpperCase( <a href="#string">string</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="join"></a><h3 id="join">join</h3></div>
<pre>join( <a href="#JoinRequest">JoinRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="indexOf"></a><h3 id="indexOf">indexOf</h3></div>
<pre>indexOf( <a href="#IndexOfRequest">IndexOfRequest</a> )( <a href="#IndexOfResponse">IndexOfResponse</a> )
</pre>
<div class="operation-title"><a name="startsWith"></a><h3 id="startsWith">startsWith</h3></div>
<pre>startsWith( <a href="#StartsWithRequest">StartsWithRequest</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>checks if the passed string starts with a given prefix</p></span>
<hr>
<h2>Message type list</h2>
<a name="PadRequest"></a><h3 id="PadRequest">PadRequest</h3>
<pre lang="jolie">type PadRequest: string { 
    .length: int
    .char: string
}</pre>
<a name="MatchRequest"></a><h3 id="MatchRequest">MatchRequest</h3>
<pre lang="jolie">type MatchRequest: string { 
    .regex: string
}</pre>
<a name="MatchResult"></a><h3 id="MatchResult">MatchResult</h3>
<pre lang="jolie">type MatchResult: int { 
    .group*: string
}</pre>
<a name="ReplaceRequest"></a><h3 id="ReplaceRequest">ReplaceRequest</h3>
<pre lang="jolie">type ReplaceRequest: string { 
    .regex: string
    .replacement: string
}</pre>
<a name="StringItemList"></a><h3 id="StringItemList">StringItemList</h3>
<pre lang="jolie">type StringItemList: void { 
    .item*: string
}</pre>
<a name="SubStringRequest"></a><h3 id="SubStringRequest">SubStringRequest</h3>
<pre lang="jolie">type SubStringRequest: string { 
    .end: int
    .begin: int
}</pre>
<a name="ContainsRequest"></a><h3 id="ContainsRequest">ContainsRequest</h3>
<pre lang="jolie">type ContainsRequest: string { 
    .substring: string
}</pre>
<a name="SplitRequest"></a><h3 id="SplitRequest">SplitRequest</h3>
<pre lang="jolie">type SplitRequest: string { 
    .regex: string
    .limit?: int
}</pre>
<a name="SplitResult"></a><h3 id="SplitResult">SplitResult</h3>
<pre lang="jolie">type SplitResult: void { 
    .result*: string
}</pre>
<a name="SplitByLengthRequest"></a><h3 id="SplitByLengthRequest">SplitByLengthRequest</h3>
<pre lang="jolie">type SplitByLengthRequest: string { 
    .length: int
}</pre>
<a name="EndsWithRequest"></a><h3 id="EndsWithRequest">EndsWithRequest</h3>
<pre lang="jolie">type EndsWithRequest: string { 
    .suffix: string
}</pre>
<a name="JoinRequest"></a><h3 id="JoinRequest">JoinRequest</h3>
<pre lang="jolie">type JoinRequest: void { 
    .piece*: string
    .delimiter: string
}</pre>
<a name="IndexOfRequest"></a><h3 id="IndexOfRequest">IndexOfRequest</h3>
<pre lang="jolie">type IndexOfRequest: string { 
    .word: string
}</pre>
<a name="IndexOfResponse"></a><h3 id="IndexOfResponse">IndexOfResponse</h3>
<pre lang="jolie">type IndexOfResponse: int</pre>
<a name="StartsWithRequest"></a><h3 id="StartsWithRequest">StartsWithRequest</h3>
<pre lang="jolie">type StartsWithRequest: string { 
    .prefix: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
