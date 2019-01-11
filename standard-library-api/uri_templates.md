# Include library: uri_templates.iol

Inclusion code: <code>include "uri_templates.iol"</code>

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

### Operation Description


<a id="expand"></a>
#### expand


Invocation template: <code>expand@UriTemplates( request )( response )</code>

**Request type**
<a id="ExpandRequest"></a>
Type documentation: no documentation provided 
<pre>type ExpandRequest: void {
	.template: string
	.params?: undefined
}</pre>


**Response type**

Type documentation: no documentation provided 





---

<a id="match"></a>
#### match


Invocation template: <code>match@UriTemplates( request )( response )</code>

**Request type**
<a id="UriMatchRequest"></a>
Type documentation: no documentation provided 
<pre>type UriMatchRequest: void {
	.template: string
	.uri: string
}</pre>


**Response type**
<a id="MatchResponse"></a>
Type documentation: no documentation provided 
<pre>type MatchResponse: undefined</pre>




---





