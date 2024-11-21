# Service Converter

> from converter import Converter

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#ConverterInterface'>ConverterInterface</a> |

### List of Available Interfaces

### ConverterInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| base64ToRaw | <a href="#string">string</a> | <a href='#raw'>raw</a> | <details><summary>IOException</summary><a href='#0#IOExceptionType'>0#IOExceptionType</a>)</details> |  |
| rawToBase64 | <a href="#raw">raw</a> | <a href='#string'>string</a> | - |  |
| rawToString | <a href="#RawToStringRequest">RawToStringRequest</a> | <a href='#string'>string</a> | <details><summary>IOException</summary><a href='#0#IOExceptionType'>0#IOExceptionType</a>)</details> |  string <-> raw (byte arrays) conversion methods  |
| stringToRaw | <a href="#StringToRawRequest">StringToRawRequest</a> | <a href='#raw'>raw</a> | <details><summary>IOException</summary><a href='#0#IOExceptionType'>0#IOExceptionType</a>)</details> |  |


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
<summary><span id="RawToStringRequest">RawToStringRequest:  The byte array to be converted 
</span>
</summary>

##### Type Declaration
<pre>
raw &#123;
&nbsp;&nbsp;charset[0,1]: string //  set the encoding. Default: system (eg. for Unix-like OS UTF-8)
&#125;
</pre>
</details>
<details>
<summary><span id="StringToRawRequest">StringToRawRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string &#123;
&nbsp;&nbsp;charset[0,1]: string //  set the encoding. Default: system (eg. for Unix-like OS UTF-8)
&#125;
</pre>
</details>
