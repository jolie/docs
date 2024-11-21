# Service Vectors

> from vectors import Vectors

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| Input | local | | <a href='#VectorsInterface'>VectorsInterface</a> |

### List of Available Interfaces

### VectorsInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| add | <a href="#AddRequest">AddRequest</a> | <a href='#Vector'>Vector</a> | - |  Adds an element to the end of a vector. |
| concat | <a href="#VectorPair">VectorPair</a> | <a href='#Vector'>Vector</a> | - |  Concatenates two vectors. |
| equals | <a href="#VectorPair">VectorPair</a> | <a href='#bool'>bool</a> | - |  Checks if two vectors are deeply equal (all elements of the two vectors must be respectively deeply equal). |
| insert | <a href="#InsertRequest">InsertRequest</a> | <a href='#Vector'>Vector</a> | - |  Inserts an element at the specified index. The rest of the vector is shifted to the right. |
| slice | <a href="#SliceRequest">SliceRequest</a> | <a href='#Vector'>Vector</a> | - |  Slices the vector from an index to another. |


### Types

<details>
<summary><span id="AddRequest">AddRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;item[1,1]: undefined // 
&nbsp;&nbsp;vector[1,1]: <a href='#Vector'>Vector</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="InsertRequest">InsertRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;item[1,1]: undefined // 
&nbsp;&nbsp;index[1,1]: int // 
&nbsp;&nbsp;vector[1,1]: <a href='#Vector'>Vector</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="SliceRequest">SliceRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;from[1,1]: int // 
&nbsp;&nbsp;vector[1,1]: <a href='#Vector'>Vector</a> // 
&nbsp;&nbsp;to[1,1]: int // 
&#125;
|void &#123;
&nbsp;&nbsp;vector[1,1]: <a href='#Vector'>Vector</a> // 
&nbsp;&nbsp;to[1,1]: int // 
&#125;
|void &#123;
&nbsp;&nbsp;from[1,1]: int // 
&nbsp;&nbsp;vector[1,1]: <a href='#Vector'>Vector</a> // 
&#125;


</pre>
</details>
<details>
<summary><span id="Vector">Vector: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;items[0,1]: undefined // 
&#125;
</pre>
</details>
<details>
<summary><span id="VectorPair">VectorPair: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;fst[1,1]: <a href='#Vector'>Vector</a> // 
&nbsp;&nbsp;snd[1,1]: <a href='#Vector'>Vector</a> // 
&#125;
</pre>
</details>
