# Service XmlUtils

> from xml-utils import XmlUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#XmlUtilsInterface'>XmlUtilsInterface</a> |

### List of Available Interfaces

### XmlUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| transform | <a href="#XMLTransformationRequest">XMLTransformationRequest</a> | <a href='#string'>string</a> | <details><summary>TransformerException</summary><a href='#0#JavaExceptionType'>0#JavaExceptionType</a>)</details> |  |
| valueToXml | <a href="#ValueToXmlRequest">ValueToXmlRequest</a> | <a href='#string'>string</a> | <details><summary>IOException</summary><a href='#1#IOExceptionType'>1#IOExceptionType</a>)</details><details><summary>IllegalArgumentException</summary>string)</details> | <br>		  Transforms the value contained within the root node into an xml string.<br>		 <br>		  The base value of ValueToXmlRequest.root will be discarded, the rest gets converted recursively<br>		  |
| xmlToValue | <a href="#XMLToValueRequest">XMLToValueRequest</a> | <a href='#undefined'>undefined</a> | <details><summary>IOException</summary><a href='#1#IOExceptionType'>1#IOExceptionType</a>)</details> | <br>		  Transforms the base value in XML format (data types string, raw) into a Jolie value<br>		 <br>		  The XML root node will be discarded, the rest gets converted recursively<br>		  |


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
<summary><span id="JavaExceptionType">JavaExceptionType: 
</span>
</summary>

##### Type Declaration
<pre>
<a href='#JavaExceptionType'>JavaExceptionType</a>
</pre>
</details>
<details>
<summary><span id="ValueToXmlRequest">ValueToXmlRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;omitXmlDeclaration[0,1]: bool // 
&nbsp;&nbsp;indent[0,1]: bool // 
&nbsp;&nbsp;plain[0,1]: bool // 
&nbsp;&nbsp;root[1,1]: any // 
&nbsp;&nbsp;rootNodeName[0,1]: string // 
&nbsp;&nbsp;isXmlStore[0,1]: bool // 
&nbsp;&nbsp;applySchema[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;schema[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;doctypeSystem[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;encoding[0,1]: string // 
&nbsp;&nbsp;&#125; // 
&#125;
</pre>
</details>
<details>
<summary><span id="XMLToValueRequest">XMLToValueRequest: 
</span>
</summary>

##### Type Declaration
<pre>
any &#123;
&nbsp;&nbsp;options[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;skipMixedText[0,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;charset[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;includeAttributes[0,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;schemaLanguage[0,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;includeRoot[0,1]: bool // 
&nbsp;&nbsp;&nbsp;&nbsp;schemaUrl[0,1]: string // 
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;isXmlStore[0,1]: bool // 
&#125;
</pre>
</details>
<details>
<summary><span id="XMLTransformationRequest">XMLTransformationRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;source[1,1]: string // 
&nbsp;&nbsp;xslt[1,1]: string // 
&#125;
</pre>
</details>
