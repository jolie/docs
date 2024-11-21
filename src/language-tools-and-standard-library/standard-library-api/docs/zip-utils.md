# Service ZipUtils

> from zip-utils import ZipUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#ZipUtilsInterface'>ZipUtilsInterface</a> |

### List of Available Interfaces

### ZipUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| IOException | <a href="#undefined">undefined</a> | <a href='#undefined'>undefined</a> | - |  |
| listEntries | <a href="#ListEntriesRequest">ListEntriesRequest</a> | <a href='#ListEntriesResponse'>ListEntriesResponse</a> | <details><summary>IOException</summary><a href='#0#IOExceptionType'>0#IOExceptionType</a>)</details> |  |
| readEntry | <a href="#ReadEntryRequest">ReadEntryRequest</a> | <a href='#any'>any</a> | <details><summary>IOException</summary><a href='#0#IOExceptionType'>0#IOExceptionType</a>)</details> |  |
| unzip | <a href="#UnzipRequest">UnzipRequest</a> | <a href='#UnzipResponse'>UnzipResponse</a> | <details><summary>FileNotFound</summary>undefined)</details> |  |
| zip | <a href="#ZipRequest">ZipRequest</a> | <a href='#raw'>raw</a> | <details><summary>IOException</summary><a href='#0#IOExceptionType'>0#IOExceptionType</a>)</details> |  |


### Types

<details>
<summary><span id="IOExceptionType">IOExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#JavaExceptionType'>JavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="IOExceptionType">IOExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#IOExceptionType'>IOExceptionType</a>
</pre>
</details>
<details>
<summary><span id="JavaExceptionType">JavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;stackTrace[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ListEntriesRequest">ListEntriesRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[0,1]: string // 
&nbsp;&nbsp;archive[0,1]: raw // 
&#125;
</pre>
</details>
<details>
<summary><span id="ListEntriesResponse">ListEntriesResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;entry[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ReadEntryRequest">ReadEntryRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;entry[1,1]: string // 
&nbsp;&nbsp;filename[0,1]: string // 
&nbsp;&nbsp;archive[0,1]: raw // 
&#125;
</pre>
</details>
<details>
<summary><span id="UnzipRequest">UnzipRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;filename[1,1]: string // 
&nbsp;&nbsp;targetPath[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="UnzipResponse">UnzipResponse: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;entry[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ZipRequest">ZipRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void
</pre>
</details>
