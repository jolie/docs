<html>
<head></head><body>
<h1>JolieDoc for Port SemaphoreUtils</h1>
<h2>From file <code>semaphore_utils.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>SemaphoreUtils</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#SemaphoreUtilsInterface">SemaphoreUtilsInterface </a>
</ul>
<hr>
<h2 id=SemaphoreUtilsInterface>Interface SemaphoreUtilsInterface</h2>
<a name="SemaphoreUtilsInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#acquire">acquire</a></td>
<td><a href="#SemaphoreRequest">SemaphoreRequest</a><br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#release">release</a></td>
<td><a href="#SemaphoreRequest">SemaphoreRequest</a><br /></td>
<td>bool<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="release"></a><h3 id="release">release</h3></div>
<pre>release( <a href="#SemaphoreRequest">SemaphoreRequest</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>Releases permits to a semaphore.<br>	 If there exists no semaphore with the given ".name", "release" creates a<br>	 new semaphore with that name and as many permits as indicated in ".permits".<br>	 The default behaviour when value ".permits" is absent is to release one permit.</p></span>
<div class="operation-title"><a name="acquire"></a><h3 id="acquire">acquire</h3></div>
<pre>acquire( <a href="#SemaphoreRequest">SemaphoreRequest</a> )( <a href="#bool">bool</a> )
</pre>
<span class="opdoc"><p>Acquires permits from a semaphore.<br>	  If there exists no semaphore with the given ".name", "acquire" creates a <br>	  new semaphore with 0 permits with that name.<br>	  The operation returns a response when a new permit is released (see operation "release").<br>	  The default behaviour when value ".permits" is absent is to acquire one permit.</p></span>
<hr>
<h2>Message type list</h2>
<a name="SemaphoreRequest"></a><h3 id="SemaphoreRequest">SemaphoreRequest</h3>
<pre lang="jolie">type SemaphoreRequest: void { 
    .permits?: int
    .name: string
}</pre>
<hr>
<h2>Type list</h2>
</body>
</html>
