<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Values

> from values import Values

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| input | local | | <a href='#ValuesInterface'>ValuesInterface</a> |

### List of Available Interfaces

### ValuesInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| equals | <a href="#ComparisonRequest">ComparisonRequest</a> | <a href='#bool'>bool</a> | - | <br>		  Returns true if two values are deeply equal to each other and false otherwise.<br>		  |
| hashCode | <a href="#undefined">undefined</a> | <a href='#int'>int</a> | - | <br>		  Returns a hash code value for the argument.<br>		  |


### Types

<details>
<summary><span id="ComparisonRequest">ComparisonRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;fst[1,1]: undefined //  The first value
&nbsp;&nbsp;snd[1,1]: undefined //  The second value
&#125;
</pre>
</details>
