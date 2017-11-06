<html>
<head></head><body>
<h1>JolieDoc for Port QueueUtils</h1>
<h2>From file <code>queue_utils.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>QueueUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#QueueUtilsInterface">QueueUtilsInterface </a>
</ul>
<hr>
<h2 id=QueueUtilsInterface>Interface QueueUtilsInterface</h2>
<a name="QueueUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#delete_queue">delete_queue</a></td>
<td>string<br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#new_queue">new_queue</a></td>
<td>string<br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#peek">peek</a></td>
<td>string<br /></td>
<td>undefined<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#poll">poll</a></td>
<td>string<br /></td>
<td>undefined<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#push">push</a></td>
<td><a href="#QueueRequest">QueueRequest</a><br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#size">size</a></td>
<td>string<br /></td>
<td>int<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="size"></a><h3 id="size">size</h3></div>
<pre>size( <a href="#string">string</a> )( <a href="#int">int</a> )
</pre>
<div class="operation-title"><a name="poll"></a><h3 id="poll">poll</h3></div>
<pre>poll( <a href="#string">string</a> )( <a href="#undefined">undefined</a> )
</pre>
<div class="operation-title"><a name="new_queue"></a><h3 id="new_queue">new_queue</h3></div>
<pre>new_queue( <a href="#string">string</a> )( <a href="#bool">bool</a> )
</pre>
<div class="operation-title"><a name="delete_queue"></a><h3 id="delete_queue">delete_queue</h3></div>
<pre>delete_queue( <a href="#string">string</a> )( <a href="#bool">bool</a> )
</pre>
<div class="operation-title"><a name="push"></a><h3 id="push">push</h3></div>
<pre>push( <a href="#QueueRequest">QueueRequest</a> )( <a href="#bool">bool</a> )
</pre>
<div class="operation-title"><a name="peek"></a><h3 id="peek">peek</h3></div>
<pre>peek( <a href="#string">string</a> )( <a href="#undefined">undefined</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="QueueRequest"></a><h3 id="QueueRequest">QueueRequest</h3>
<pre lang="jolie">type QueueRequest: void { 
    .queue_name: string
    .element: undefined
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
