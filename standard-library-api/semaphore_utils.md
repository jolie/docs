# Include library: semaphore_utils.iol

Inclusion code: <code>include "semaphore_utils.iol"</code>

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

### Operation Description



<h4 id="release">release</h4>
Operation documentation: 
	 Releases permits to a semaphore.
	 If there exists no semaphore with the given ".name", "release" creates a
	 new semaphore with that name and as many permits as indicated in ".permits".
	 The default behaviour when value ".permits" is absent is to release one permit.
	

Invocation template: <code>release@SemaphoreUtils( request )( response )</code>

<h4 id="SemaphoreRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SemaphoreRequest: void {
	.permits?: int
	.name: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="acquire">acquire</h4>
Operation documentation: 
	  Acquires permits from a semaphore.
	  If there exists no semaphore with the given ".name", "acquire" creates a 
	  new semaphore with 0 permits with that name.
	  The operation returns a response when a new permit is released (see operation "release").
	  The default behaviour when value ".permits" is absent is to acquire one permit.
	 

Invocation template: <code>acquire@SemaphoreUtils( request )( response )</code>

<h4 id="SemaphoreRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type SemaphoreRequest: void {
	.permits?: int
	.name: string
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 










