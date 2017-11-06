<html>
<head></head><body>
<h1>JolieDoc for Port Database</h1>
<h2>From file <code>database.iol</code></h2>
<table>
<tr>
<th>Port Name</th>
<th>Location</th>
<th>Protocol</th>
</tr>
<tr>
<td>Database</td>
<td></td>
<td></td>
</tr>
</table>
<h2>List of the available interfaces</h2>
<ul>
<li><a href="#DatabaseInterface">DatabaseInterface </a>
</ul>
<hr>
<h2 id=DatabaseInterface>Interface DatabaseInterface</h2>
<a name="DatabaseInterface"></a>
<table border="1">
<tr>
<th>Heading</th>
<th>Input type</th>
<th>Output type</th>
<th>Faults</th>
</tr>
<tr>
<td><a href="#checkConnection">checkConnection</a></td>
<td>void<br /></td>
<td>void<br /></td>
<td>
ConnectionError,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#close">close</a></td>
<td>void<br /></td>
<td>void<br /></td>
<td>
</td>
</tr>
<tr>
<td><a href="#connect">connect</a></td>
<td><a href="#ConnectionInfo">ConnectionInfo</a><br /></td>
<td>void<br /></td>
<td>
InvalidDriver,&nbsp;<br>
ConnectionError,&nbsp;<br>
DriverClassNotFound,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#executeTransaction">executeTransaction</a></td>
<td><a href="#DatabaseTransactionRequest">DatabaseTransactionRequest</a><br /></td>
<td><a href="#DatabaseTransactionResult">DatabaseTransactionResult</a><br /></td>
<td>
SQLException,&nbsp;<br>
ConnectionError,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#query">query</a></td>
<td>QueryRequest<br /></td>
<td><a href="#QueryResult">QueryResult</a><br /></td>
<td>
SQLException,&nbsp;<br>
ConnectionError,&nbsp;<br>
</td>
</tr>
<tr>
<td><a href="#update">update</a></td>
<td>UpdateRequest<br /></td>
<td>int<br /></td>
<td>
SQLException,&nbsp;<br>
ConnectionError,&nbsp;<br>
</td>
</tr>
</table>
<hr>
<h2>Operation list</h2>
<div class="operation-title"><a name="checkConnection"></a><h3 id="checkConnection">checkConnection</h3></div>
<pre>checkConnection( <a href="#void">void</a> )( <a href="#void">void</a> )
 throws

				
ConnectionError
</pre>
<span class="opdoc"><p>Checks the connection with the database. Throws ConnectionError if the connection is not functioning properly.</p></span>
<div class="operation-title"><a name="query"></a><h3 id="query">query</h3></div>
<pre>query( <a href="#QueryRequest">QueryRequest</a> )( <a href="#QueryResult">QueryResult</a> )
 throws

				
SQLException

				
ConnectionError
</pre>
<span class="opdoc"><p>Queries the database and returns a result set<br>	 <br>	  Example with SQL parameters:<br>	  queryRequest =<br>	      "SELECT city, country, data FROM weather " +<br>	      "WHERE city=:city AND country=:country";<br>	  queryRequest.city = City;<br>	  queryRequest.country = Country;<br>	  query@Database( queryRequest )( queryResponse );<br>	 <br>	  _template:<br>	  Field _template allows for the definition of a specific output template.<br>	  Assume, e.g., to have a table with the following columns:<br>	  | col1 | col2 | col3 | col4 |<br>	  If _template is not used the output will be rows with the following format:<br>	  row<br>	   |-col1<br>	   |-col2<br>	   |-col3<br>	   |-col4<br>	  Now let us suppose we would like to have the following structure for each row:<br>	  row<br>	    |-mycol1			contains content of col1<br>	        |-mycol2		contains content of col2<br>	  	 |-mycol3		contains content of col3<br>	    |-mycol4			contains content of col4<br>	 <br>	  In order to achieve this, we can use field _template as it follows:<br>	    with( query_request._template ) {<br>	      .mycol1 = "col1";<br>	      .mycol1.mycol2 = "col2";<br>	      .mycol1.mycol2.mycol3 = "col3";<br>	      .mycol4 = "col4"<br>	    }<br>	  _template does not currently support vectors.</p></span>
<div class="operation-title"><a name="executeTransaction"></a><h3 id="executeTransaction">executeTransaction</h3></div>
<pre>executeTransaction( <a href="#DatabaseTransactionRequest">DatabaseTransactionRequest</a> )( <a href="#DatabaseTransactionResult">DatabaseTransactionResult</a> )
 throws

				
SQLException

				
ConnectionError
</pre>
<span class="opdoc"><p>Executes more than one database command in a single transaction</p></span>
<div class="operation-title"><a name="update"></a><h3 id="update">update</h3></div>
<pre>update( <a href="#UpdateRequest">UpdateRequest</a> )( <a href="#int">int</a> )
 throws

				
SQLException

				
ConnectionError
</pre>
<span class="opdoc"><p>Updates the database and returns a single status code<br>	 <br>	  Example with SQL parameters:<br>	  updateRequest =<br>	      "INSERT INTO weather(city, country, data) " +<br>	      "VALUES (:city, :country, :data)";<br>	  updateRequest.city = City;<br>	  updateRequest.country = Country;<br>	  updateRequest.data = r;<br>	  update@Database( updateRequest )( ret )</p></span>
<div class="operation-title"><a name="close"></a><h3 id="close">close</h3></div>
<pre>close( <a href="#void">void</a> )( <a href="#void">void</a> )
</pre>
<span class="opdoc"><p>Explicitly closes a database connection<br>	  Per default the close happens on reconnect or on termination of the<br>	  Database service, eg. when the enclosing program finishes.</p></span>
<div class="operation-title"><a name="connect"></a><h3 id="connect">connect</h3></div>
<pre>connect( <a href="#ConnectionInfo">ConnectionInfo</a> )( <a href="#void">void</a> )
 throws

				
InvalidDriver

				
ConnectionError

				
DriverClassNotFound
</pre>
<span class="opdoc"><p>Connects to a database and eventually closes a previous connection<br>	 <br>	  Example with HSQLDB:<br>	  with ( connectionInfo ) {<br>	      .username = "sa";<br>	      .password = "";<br>	      .host = "";<br>	      .database = "file:weatherdb/weatherdb"; // "." for memory-only<br>	      .driver = "hsqldb_embedded"<br>	  };<br>	  connect@Database( connectionInfo )( void );</p></span>
<hr>
<h2>Message type list</h2>
<a name="QueryRequest"></a><h3 id="QueryRequest">QueryRequest</h3>
<pre lang="jolie">type QueryRequest: undefined</pre>
<a name="QueryResult"></a><h3 id="QueryResult">QueryResult</h3>
<pre lang="jolie">type QueryResult: void { 
    .row*: undefined
}</pre>
<a name="DatabaseTransactionRequest"></a><h3 id="DatabaseTransactionRequest">DatabaseTransactionRequest</h3>
<pre lang="jolie">type DatabaseTransactionRequest: void { 
    .statement[1,2147483647]: undefined
}</pre>
<a name="DatabaseTransactionResult"></a><h3 id="DatabaseTransactionResult">DatabaseTransactionResult</h3>
<pre lang="jolie">type DatabaseTransactionResult: void { 
    .result*: TransactionQueryResult
}</pre>
<a name="UpdateRequest"></a><h3 id="UpdateRequest">UpdateRequest</h3>
<pre lang="jolie">type UpdateRequest: undefined</pre>
<a name="ConnectionInfo"></a><h3 id="ConnectionInfo">ConnectionInfo</h3>
<pre lang="jolie">type ConnectionInfo: void { 
    .database: string
    .password: string
    .checkConnection?: int
    .driver: string
    .port?: int
    .toLowerCase?: bool
    .host: string
    .toUpperCase?: bool
    .attributes?: string
    .username: string
}</pre>
<hr>
<h2>Type list</h2>
<h3 id="TransactionQueryResult">TransactionQueryResult</h3>
<a name="TransactionQueryResult"></a>
<pre lang="jolie">type TransactionQueryResult: int { 
    .row*: undefined
}</pre>
</body>
</html>
