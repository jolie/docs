<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

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
&nbsp;&nbsp;data[0,1]: undefined // < The mustache template
&nbsp;&nbsp;functions[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;name[0,1]: string // < A service that offers functions to templates
&nbsp;&nbsp;&nbsp;&nbsp;binding[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;location[1,1]: any // < The binding information to reach the function provider
&nbsp;&nbsp;&nbsp;&nbsp;&#125; // < The name under which the functions can be accessed by the template (default is "fn")
&nbsp;&nbsp;&#125; // < Maximum limit for recursive calls specific for partials (default is 10)
&nbsp;&nbsp;dir[0,1]: string // < The data for the template
&nbsp;&nbsp;recursionLimit[0,1]: int // < The directory in which to look for other templates (for partials)
&nbsp;&nbsp;partialsRecursionLimit[0,1]: int // < Maximum limit for recursive calls in partials (default is 100)
&#125;
|void &#123;
&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;data[0,1]: undefined // < The mustache template
&nbsp;&nbsp;functions[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;name[0,1]: string // < A service that offers functions to templates
&nbsp;&nbsp;&nbsp;&nbsp;binding[1,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;location[1,1]: any // < The binding information to reach the function provider
&nbsp;&nbsp;&nbsp;&nbsp;&#125; // < The name under which the functions can be accessed by the template (default is "fn"). Be careful in not choosing a name that is already present in `data`, since this would be overriden.
&nbsp;&nbsp;&#125; // < Maximum limit for recursive calls specific for partials. Default is 10
&nbsp;&nbsp;recursionLimit[0,1]: int // 
&nbsp;&nbsp;partials[0,1]: void &#123;
&nbsp;&nbsp;&nbsp;&nbsp;template[1,1]: string // 
&nbsp;&nbsp;&nbsp;&nbsp;name[1,1]: string // < List of other templates to be used
&nbsp;&nbsp;&#125; // < The data for the template
&nbsp;&nbsp;partialsRecursionLimit[0,1]: int // < Maximum limit for recursive calls in partials. Default is 100
&#125;

</pre>
</details>
