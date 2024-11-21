<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service QueueUtils

> from queue-utils import QueueUtils

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#QueueUtilsInterface'>QueueUtilsInterface</a> |

### List of Available Interfaces

### QueueUtilsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| delete_queue | <a href="#string">string</a> | <a href='#bool'>bool</a> | - | Removes an existing queue |
| new_queue | <a href="#string">string</a> | <a href='#bool'>bool</a> | - | Creates a new queue with queue_name as key |
| peek | <a href="#string">string</a> | <a href='#undefined'>undefined</a> | - | Retrieves, but does not remove, the head of the queue |
| poll | <a href="#string">string</a> | <a href='#undefined'>undefined</a> | - | Removes and returns the head of the queue |
| push | <a href="#QueueRequest">QueueRequest</a> | <a href='#bool'>bool</a> | - | Pushes an element at the end of an existing queue |
| size | <a href="#string">string</a> | <a href='#int'>int</a> | - | Returns the size of an existing queue, null otherwise |


### Types

<details>
<summary><span id="QueueRequest">QueueRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;queue_name[1,1]: string // 
&nbsp;&nbsp;element[1,1]: undefined // 
&#125;
</pre>
</details>
