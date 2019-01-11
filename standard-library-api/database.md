# Include library: database.iol

Inclusion code: <code>include "database.iol"</code>

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
      <td>Database</td>
      <td>-</td>
      <td>-</td>
      <td><a href="#DatabaseInterface">DatabaseInterface</a></td>
    </tr>
  </tbody>
</table>

<h3>List of Available Interfaces</h3>

<h3 id="DatabaseInterface">DatabaseInterface</h3>

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
      <td><a href="#checkConnection">checkConnection</a></td>
      <td>void</td>
      <td>void</td>
      <td>
        ConnectionError( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#query">query</a></td>
      <td><a href="#QueryRequest">QueryRequest</a></td>
      <td><a href="#QueryResult">QueryResult</a></td>
      <td>
        SQLException( undefined ) <br> 
        ConnectionError( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#executeTransaction">executeTransaction</a></td>
      <td><a href="#DatabaseTransactionRequest">DatabaseTransactionRequest</a></td>
      <td><a href="#DatabaseTransactionResult">DatabaseTransactionResult</a></td>
      <td>
        SQLException( undefined ) <br> 
        ConnectionError( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#update">update</a></td>
      <td><a href="#UpdateRequest">UpdateRequest</a></td>
      <td>int</td>
      <td>
        SQLException( undefined ) <br> 
        ConnectionError( undefined )
      </td>
    </tr>
    <tr>
      <td><a href="#close">close</a></td>
      <td>void</td>
      <td>void</td>
      <td>
      </td>
    </tr>
    <tr>
      <td><a href="#connect">connect</a></td>
      <td><a href="#ConnectionInfo">ConnectionInfo</a></td>
      <td>void</td>
      <td>
        InvalidDriver( undefined ) <br> 
        ConnectionError( undefined ) <br> 
        DriverClassNotFound( undefined )
      </td>
    </tr>
  </tbody>
</table>

### Operation Description



<h4 id="checkConnection">checkConnection</h4>
Operation documentation: 
	  Checks the connection with the database. Throws ConnectionError if the connection is not functioning properly.
	 

Invocation template: <code>checkConnection@Database( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>ConnectionError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( ConnectionError => /* error-handling code */ )</code>




<h4 id="query">query</h4>
Operation documentation: 
	  Queries the database and returns a result set
	 
	  Example with SQL parameters:
	  queryRequest =
	      "SELECT city, country, data FROM weather " +
	      "WHERE city=:city AND country=:country";
	  queryRequest.city = City;
	  queryRequest.country = Country;
	  query@Database( queryRequest )( queryResponse );
	 
	  _template:
	  Field _template allows for the definition of a specific output template.
	  Assume, e.g., to have a table with the following columns:
	  | col1 | col2 | col3 | col4 |
	  If _template is not used the output will be rows with the following format:
	  row
	   |-col1
	   |-col2
	   |-col3
	   |-col4
	  Now let us suppose we would like to have the following structure for each row:
	  row
	    |-mycol1			contains content of col1
	        |-mycol2		contains content of col2
	  	 |-mycol3		contains content of col3
	    |-mycol4			contains content of col4
	 
	  In order to achieve this, we can use field _template as it follows:
	    with( query_request._template ) {
	      .mycol1 = "col1";
	      .mycol1.mycol2 = "col2";
	      .mycol1.mycol2.mycol3 = "col3";
	      .mycol4 = "col4"
	    }
	  _template does not currently support vectors.
	 

Invocation template: <code>query@Database( request )( response )</code>

<h4 id="QueryRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type QueryRequest: undefined</pre>


<h4 id="QueryResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type QueryResult: void {
	.row*: undefined
}</pre>


**Possible faults thrown**


Fault <code>SQLException</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( SQLException => /* error-handling code */ )</code>



Fault <code>ConnectionError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( ConnectionError => /* error-handling code */ )</code>




<h4 id="executeTransaction">executeTransaction</h4>
Operation documentation: 
	  Executes more than one database command in a single transaction
	 

Invocation template: <code>executeTransaction@Database( request )( response )</code>

<h4 id="DatabaseTransactionRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type DatabaseTransactionRequest: void {
	.statement[1,2147483647]: undefined
}</pre>


<h4 id="DatabaseTransactionResult">Response type</h4>
Type documentation: no documentation provided 
<pre>type DatabaseTransactionResult: void {
	.result*: TransactionQueryResult
}</pre>


**Possible faults thrown**


Fault <code>SQLException</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( SQLException => /* error-handling code */ )</code>



Fault <code>ConnectionError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( ConnectionError => /* error-handling code */ )</code>




<h4 id="update">update</h4>
Operation documentation: 
	  Updates the database and returns a single status code
	 
	  Example with SQL parameters:
	  updateRequest =
	      "INSERT INTO weather(city, country, data) " +
	      "VALUES (:city, :country, :data)";
	  updateRequest.city = City;
	  updateRequest.country = Country;
	  updateRequest.data = r;
	  update@Database( updateRequest )( ret )
	 

Invocation template: <code>update@Database( request )( response )</code>

<h4 id="UpdateRequest">Request type</h4>

Type documentation: no documentation provided 
<pre>type UpdateRequest: undefined</pre>


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>SQLException</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( SQLException => /* error-handling code */ )</code>



Fault <code>ConnectionError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( ConnectionError => /* error-handling code */ )</code>




<h4 id="close">close</h4>
Operation documentation: 
	  Explicitly closes a database connection
	  Per default the close happens on reconnect or on termination of the
	  Database service, eg. when the enclosing program finishes.
	 

Invocation template: <code>close@Database( request )( response )</code>

<h4>Request type</h4>

Type documentation: no documentation provided 



<h4>Response type</h4>
Type documentation: no documentation provided 







<h4 id="connect">connect</h4>
Operation documentation: 
	  Connects to a database and eventually closes a previous connection
	 
	  Example with HSQLDB:
	  with ( connectionInfo ) {
	      .username = "sa";
	      .password = "";
	      .host = "";
	      .database = "file:weatherdb/weatherdb"; // "." for memory-only
	      .driver = "hsqldb_embedded"
	  };
	  connect@Database( connectionInfo )( void );
	 

Invocation template: <code>connect@Database( request )( response )</code>

<h4 id="ConnectionInfo">Request type</h4>

Type documentation: no documentation provided 
<pre>type ConnectionInfo: void {
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


<h4>Response type</h4>
Type documentation: no documentation provided 



**Possible faults thrown**


Fault <code>InvalidDriver</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( InvalidDriver => /* error-handling code */ )</code>



Fault <code>ConnectionError</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( ConnectionError => /* error-handling code */ )</code>



Fault <code>DriverClassNotFound</code> with type <code>undefined</code>

Fault-handling install template: <code>install ( DriverClassNotFound => /* error-handling code */ )</code>







