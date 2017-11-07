<html>
<head></head><body>
<h1>JolieDoc for Port UriTemplates</h1>
<h2>From file <code>uri_templates.iol
</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>UriTemplates</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#UriTemplatesIface">UriTemplatesIface </a>
</ul>
<hr>
<h2 id=UriTemplatesIface>Interface UriTemplatesIface</h2>
<a name="UriTemplatesIface"></a>
WARNING: the API of this service is experimental. Use it at your own risk.
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#expand">expand</a></td>
<td><a href="#ExpandRequest">ExpandRequest</a><br /></td>
<td>string<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#match">match</a></td>
<td><a href="#UriMatchRequest">UriMatchRequest</a><br /></td>
<td>MatchResponse<br /></td>
<td>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="expand"></a><h3 id="expand">expand</h3></div>
<pre>expand( <a href="#ExpandRequest">ExpandRequest</a> )( <a href="#string">string</a> )
</pre>
<div class="operation-title"><a name="match"></a><h3 id="match">match</h3></div>
<pre>match( <a href="#UriMatchRequest">UriMatchRequest</a> )( <a href="#MatchResponse">MatchResponse</a> )
</pre>
<hr>
<h2>Message type list</h2>
<a name="ExpandRequest"></a><h3 id="ExpandRequest">ExpandRequest</h3>
<pre lang="jolie">type ExpandRequest: void { 
    .template: string
    .params?: undefined
}</pre>
<a name="UriMatchRequest"></a><h3 id="UriMatchRequest">UriMatchRequest</h3>
<pre lang="jolie">type UriMatchRequest: void { 
    .template: string
    .uri: string
}</pre>
<a name="MatchResponse"></a><h3 id="MatchResponse">MatchResponse</h3>
<pre lang="jolie">type MatchResponse: undefined</pre>
<hr>
<h2>Type list</h2>
<h3 id="undefined">undefined</h3>
<a name="undefined"></a>
<pre lang="jolie">type undefined: undefined</pre>
</body>
</html>
