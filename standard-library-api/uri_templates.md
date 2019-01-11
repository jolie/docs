# Include library: uri_templates.iol

Inclusion code: <pre>include "uri_templates.iol"</pre>

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
      <td>UriTemplates</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#UriTemplatesIface">UriTemplatesIface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="UriTemplatesIface">UriTemplatesIface</h3>

Interface documentation: 
WARNING: the API of this service is experimental. Use it at your own risk.


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
      <td><a href="#expand">expand</a></td>
      <td><a href="#ExpandRequest">ExpandRequest</a></td>
      <td>string</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#match">match</a></td>
      <td><a href="#UriMatchRequest">UriMatchRequest</a></td>
      <td><a href="#MatchResponse">MatchResponse</a></td>
      <td>
      </td>
    </tr>
  </tbody>
</table>

<h2>Operation Description</h2>



<h3 id="expand">expand</h3>



Invocation template: <pre>expand@UriTemplates( request )( response )</pre>

<h4 id="ExpandRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type ExpandRequest: void {
	.template: string
	.params?: undefined
}</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 








<h3 id="match">match</h3>



Invocation template: <pre>match@UriTemplates( request )( response )</pre>

<h4 id="UriMatchRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type UriMatchRequest: void {
	.template: string
	.uri: string
}</pre>


<h4 id="MatchResponse">Response type</h4>
Type documentation: no documentation provided 
<pre>type MatchResponse: undefined</pre>










