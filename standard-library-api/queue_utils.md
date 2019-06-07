# Include library: queue_utils.iol

Inclusion code: <pre>include "queue_utils.iol"</pre>

<table>
  <caption>Service Deployment</caption>
  <thead>
    <tr>
      <th>Port Name</th>
      <th>Location</th>
      <th>Protocol</th>
      <th>Interfaces</th>
    </tr>
  </thead>
  <tbody><tr><td>QueueUtils documentation: </td></tr>
    <tr>
      <td>QueueUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#QueueUtilsInterface">QueueUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="QueueUtilsInterface">QueueUtilsInterface</h3>

Interface documentation: 

<table>
  <thead>
    <tr>
      <th>Operation Name</th>
      <th>Input Type</th>
      <th>Output Type</th>
      <th>Faults</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#size">size</a></td>
      <td>string</td>
      <td>int</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#poll">poll</a></td>
      <td>string</td>
      <td>undefined</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#new_queue">new_queue</a></td>
      <td>string</td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#delete_queue">delete_queue</a></td>
      <td>string</td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#push">push</a></td>
      <td><a href="#QueueRequest">QueueRequest</a></td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#peek">peek</a></td>
      <td>string</td>
      <td>undefined</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="size">size</h3>

Operation documentation: Returns the size of an existing queue, null otherwise


Invocation template: 
<pre>size@QueueUtils( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: int




<code>int : int</code> 








<h3 id="poll">poll</h3>

Operation documentation: Removes and returns the head of the queue


Invocation template: 
<pre>poll@QueueUtils( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: undefined




<code>undefined : any</code> 








<h3 id="new_queue">new_queue</h3>

Operation documentation: Creates a new queue with queue_name as key


Invocation template: 
<pre>new_queue@QueueUtils( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: bool




<code>bool : bool</code> 








<h3 id="delete_queue">delete_queue</h3>

Operation documentation: Removes an existing queue


Invocation template: 
<pre>delete_queue@QueueUtils( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: bool




<code>bool : bool</code> 








<h3 id="push">push</h3>

Operation documentation: Pushes an element at the end of an existing queue


Invocation template: 
<pre>push@QueueUtils( request )( response )</pre>

<h4 id="QueueRequest">Request type</h4>

Type: QueueRequest


<pre>type QueueRequest: void {
	.queue_name: string
	.element: undefined
}</pre>

<code>QueueRequest : void</code> 

<ul>

  <li><code>queue_name : string</code> 
</li>

  <li><code>element : any</code> 
</li>

</ul>



<h4>Response type</h4>

Type: bool




<code>bool : bool</code> 








<h3 id="peek">peek</h3>

Operation documentation: Retrieves, but does not remove, the head of the queue


Invocation template: 
<pre>peek@QueueUtils( request )( response )</pre>

<h4>Request type</h4>

Type: string




<code>string : string</code> 



<h4>Response type</h4>

Type: undefined




<code>undefined : any</code> 










