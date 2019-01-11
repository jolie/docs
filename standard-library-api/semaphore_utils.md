# Include library: semaphore_utils.iol

Inclusion code: <pre>include "semaphore_utils.iol"</pre>

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
  <tbody>
    <tr>
      <td>SemaphoreUtils</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#SemaphoreUtilsInterface">SemaphoreUtilsInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="SemaphoreUtilsInterface">SemaphoreUtilsInterface</h3>

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
      <td><a href="#release">release</a></td>
      <td><a href="#SemaphoreRequest">SemaphoreRequest</a></td>
      <td>bool</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#acquire">acquire</a></td>
      <td><a href="#SemaphoreRequest">SemaphoreRequest</a></td>
      <td>bool</td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="release">release</h3>

Operation documentation: 
	 Releases permits to a semaphore.
	 If there exists no semaphore with the given ".name", "release" creates a
	 new semaphore with that name and as many permits as indicated in ".permits".
	 The default behaviour when value ".permits" is absent is to release one permit.
	


Invocation template: <pre>release@SemaphoreUtils( request )( response )</pre>

<h4 id="SemaphoreRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SemaphoreRequest: void {
	.permits?: int
	.name: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="acquire">acquire</h3>

Operation documentation: 
	  Acquires permits from a semaphore.
	  If there exists no semaphore with the given ".name", "acquire" creates a 
	  new semaphore with 0 permits with that name.
	  The operation returns a response when a new permit is released (see operation "release").
	  The default behaviour when value ".permits" is absent is to acquire one permit.
	 


Invocation template: <pre>acquire@SemaphoreUtils( request )( response )</pre>

<h4 id="SemaphoreRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SemaphoreRequest: void {
	.permits?: int
	.name: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 











