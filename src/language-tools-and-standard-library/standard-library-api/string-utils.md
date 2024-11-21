<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service StringUtils

> from string-utils import StringUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#StringUtilsInterface'>StringUtilsInterface</a> |

### List of Available Interfaces

### StringUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| contains | <a href="#ContainsRequest">ContainsRequest</a> | <a href='#bool'>bool</a> | - | <br>	  Returns true if the string contains .substring<br>	  |
| endsWith | <a href="#EndsWithRequest">EndsWithRequest</a> | <a href='#bool'>bool</a> | - | <br>	  checks if a string ends with a given suffix<br>	 |
| find | <a href="#MatchRequest">MatchRequest</a> | <a href='#MatchResult'>MatchResult</a> | - |  |
| fmt | <a href="#FormatRequest">FormatRequest</a> | <a href='#string'>string</a> | - |  Formats a string.<br>	 For example, a request value "Hello {name}" { name = "Homer" } is transformed into "Hello Homer"<br>	 You can use formatting rules as in Java's MessageFormat, for example, "Up to {pct,number,percent}" { pct = 0.6 } becomes "Up to 60%"<br>	 |
| getRandomUUID | <a href="#void">void</a> | <a href='#string'>string</a> | - | <br>	 it returns a random UUID<br>	 |
| indexOf | <a href="#IndexOfRequest">IndexOfRequest</a> | <a href='#IndexOfResponse'>IndexOfResponse</a> | - |  |
| join | <a href="#JoinRequest">JoinRequest</a> | <a href='#string'>string</a> | - |  |
| leftPad | <a href="#PadRequest">PadRequest</a> | <a href='#string'>string</a> | - |  |
| length | <a href="#string">string</a> | <a href='#int'>int</a> | - |  |
| match | <a href="#MatchRequest">MatchRequest</a> | <a href='#MatchResult'>MatchResult</a> | - |  |
| replaceAll | <a href="#ReplaceRequest">ReplaceRequest</a> | <a href='#string'>string</a> | - |  |
| replaceFirst | <a href="#ReplaceRequest">ReplaceRequest</a> | <a href='#string'>string</a> | - |  |
| rightPad | <a href="#PadRequest">PadRequest</a> | <a href='#string'>string</a> | - |  |
| sort | <a href="#StringItemList">StringItemList</a> | <a href='#StringItemList'>StringItemList</a> | - |  |
| split | <a href="#SplitRequest">SplitRequest</a> | <a href='#SplitResult'>SplitResult</a> | - |  |
| splitByLength | <a href="#SplitByLengthRequest">SplitByLengthRequest</a> | <a href='#SplitResult'>SplitResult</a> | - |  |
| startsWith | <a href="#StartsWithRequest">StartsWithRequest</a> | <a href='#bool'>bool</a> | - | <br>	 checks if the passed string starts with a given prefix<br>	 |
| substring | <a href="#SubStringRequest">SubStringRequest</a> | <a href='#string'>string</a> | - |  |
| toLowerCase | <a href="#string">string</a> | <a href='#string'>string</a> | - |  |
| toUpperCase | <a href="#string">string</a> | <a href='#string'>string</a> | - |  |
| trim | <a href="#string">string</a> | <a href='#string'>string</a> | - |  |
| urlDecode | <a href="#UrlDecodeRequest">UrlDecodeRequest</a> | <a href='#string'>string</a> | - |  |
| urlEncode | <a href="#UrlEncodeRequest">UrlEncodeRequest</a> | <a href='#string'>string</a> | - |  |
| valueToPrettyString | <a href="#undefined">undefined</a> | <a href='#string'>string</a> | - |  |


### Types

<details>
<summary><span id="ContainsRequest">ContainsRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;substring[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="EndsWithRequest">EndsWithRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;suffix[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="FormatRequest">FormatRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string
|void &#123;
&nbsp;&nbsp;data[1,1]: void // 
&nbsp;&nbsp;format[1,1]: string // 
&nbsp;&nbsp;locale[1,1]: string // 
&#125;

</pre>
</details>
<details>
<summary><span id="IndexOfRequest">IndexOfRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;word[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="IndexOfResponse">IndexOfResponse: 
</span>
</summary>

##### Type Declaration
<pre>
int
</pre>
</details>
<details>
<summary><span id="JoinRequest">JoinRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;piece[0,1]: string // 
&nbsp;&nbsp;delimiter[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="MatchRequest">MatchRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;regex[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="MatchResult">MatchResult: 
</span>
</summary>

##### Type Declaration
<pre>
int &#123;
&nbsp;&nbsp;group[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="PadRequest">PadRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;length[1,1]: int // 
&nbsp;&nbsp;char[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ReplaceRequest">ReplaceRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;regex[1,1]: string // 
&nbsp;&nbsp;replacement[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="SplitByLengthRequest">SplitByLengthRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;length[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="SplitRequest">SplitRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;regex[1,1]: string // 
&nbsp;&nbsp;limit[0,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="SplitResult">SplitResult: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;result[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="StartsWithRequest">StartsWithRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;prefix[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="StringItemList">StringItemList: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;item[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="SubStringRequest">SubStringRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;end[0,1]: int // 
&nbsp;&nbsp;begin[1,1]: int // 
&#125;
</pre>
</details>
<details>
<summary><span id="UrlDecodeRequest">UrlDecodeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#UrlEncodeRequest'>UrlEncodeRequest</a>
</pre>
</details>
<details>
<summary><span id="UrlEncodeRequest">UrlEncodeRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;charset[0,1]: string // 
&#125;
</pre>
</details>
