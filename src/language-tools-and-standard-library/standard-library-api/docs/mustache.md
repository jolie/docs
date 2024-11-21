# Service Mustache

> from mustache import Mustache

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| Input | local | | <a href='#MustacheInterface'>MustacheInterface</a> |

### List of Available Interfaces

### MustacheInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| render | <a href="#RenderRequest">RenderRequest</a> | <a href='#string'>string</a> | - |  Renders a mustache template |


### Types

<details>
<summary><span id="RenderRequest">RenderRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;data[1,1]: undefined // < The mustache template
&nbsp;&nbsp;dir[0,1]: string // < The data for the template
&nbsp;&nbsp;recursionLimit[0,1]: int // < The directory in which to look for other templates (for partials)
&nbsp;&nbsp;partialsRecursionLimit[0,1]: int // < Maximum limit for recursive calls in partials. Default is 100
&#125;
|void &#123;
&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;data[1,1]: undefined // < The mustache template
&nbsp;&nbsp;recursionLimit[0,1]: int // 
&nbsp;&nbsp;partials[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string // < List of other templates to be used
&nbsp;&nbsp;&#125; // < The data for the template
&nbsp;&nbsp;partialsRecursionLimit[0,1]: int // < Maximum limit for recursive calls in partials
&#125;

</pre>
</details>
