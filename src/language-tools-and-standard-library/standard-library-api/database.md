<!-- markdownlint-disable -->
<!-- editorconfig-checker-disable -->
<!-- cSpell:disable -->

# Service Database

> from database import Database

| Port Name | Location | Protocol | Interfaces |
| --- | --- | --- | --- |
| ip | local | | <a href='#DatabaseInterface'>DatabaseInterface</a> |

### List of Available Interfaces

### DatabaseInterface

| Operation Name | Input Type | Output Type | Faults | Description |
| --- | --- | --- | --- | --- |
| beginTx | <a href="#void">void</a> | <a href='#TxHandle'>TxHandle</a> | <details><summary>SQLException</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details> | <br>	  Designates a connection from the connection pool as an open transaction, and returns an int which can be used to refer to the now open transaction.	<br>	 |
| checkConnection | <a href="#void">void</a> | <a href='#void'>void</a> | <details><summary>ConnectionError</summary>undefined</details> | <br>	  Checks the connection with the database. Throws ConnectionError if the connection is not functioning properly.<br>	  |
| close | <a href="#void">void</a> | <a href='#void'>void</a> | - | <br>	  Explicitly closes a database connection<br>	  Per default the close happens on reconnect or on termination of the<br>	  Database service, eg. when the enclosing program finishes.<br>	  |
| commitTx | <a href="#TxHandle">TxHandle</a> | <a href='#void'>void</a> | <details><summary>TransactionException</summary>undefined</details><details><summary>SQLException</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details> | <br>	  Commits and closes the connection associated with the transaction handle in CommitTransactionRequest. The connection is<br>	  then returned to the connection pool, and any further actions attempted using the transaction handle will throw a TransactionException.<br>	 |
| connect | <a href="#ConnectionInfo">ConnectionInfo</a> | <a href='#void'>void</a> | <details><summary>InvalidDriver</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details><details><summary>DriverClassNotFound</summary>undefined</details> | <br>	  Connects to a database and closes any potential preexisting database connection.  <br>	 <br>	  Example with HSQLDB:<br>	  with ( connectionInfo ) {<br>	      .username = "sa";<br>	      .password = "";<br>	      .host = "";<br>	      .database = "file:weatherdb/weatherdb"; // "." for memory-only<br>	      .driver = "hsqldb_embedded"<br>	  };<br>	  connect@Database( connectionInfo )( void );<br>	  |
| executeTransaction | <a href="#DatabaseTransactionRequest">DatabaseTransactionRequest</a> | <a href='#DatabaseTransactionResult'>DatabaseTransactionResult</a> | <details><summary>SQLException</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details> | <br>	  Executes more than one database command in a single transaction<br>	  |
| query | <a href="#QueryRequest">QueryRequest</a> | <a href='#QueryResult'>QueryResult</a> | <details><summary>TransactionException</summary>undefined</details><details><summary>SQLException</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details> | <br>	  Queries the database and returns a result set<br>	 <br>	  Example with SQL parameters:<br>	  queryRequest =<br>	      "SELECT city, country, data FROM weather " +<br>	      "WHERE city=:city AND country=:country";<br>	  queryRequest.city = City;<br>	  queryRequest.country = Country;<br>	  query@Database( queryRequest )( queryResponse );<br>	 <br>	  _template:<br>	  Field _template allows for the definition of a specific output template.<br>	  Assume, e.g., to have a table with the following columns:<br>	  | col1 | col2 | col3 | col4 |<br>	  If _template is not used the output will be rows with the following format:<br>	  row<br>	   |-col1<br>	   |-col2<br>	   |-col3<br>	   |-col4<br>	  Now let us suppose we would like to have the following structure for each row:<br>	  row<br>	    |-mycol1			contains content of col1<br>	        |-mycol2		contains content of col2<br>	  	 |-mycol3		contains content of col3<br>	    |-mycol4			contains content of col4<br>	 <br>	  In order to achieve this, we can use field _template as it follows:<br>	    with( query_request._template ) {<br>	      .mycol1 = "col1";<br>	      .mycol1.mycol2 = "col2";<br>	      .mycol1.mycol2.mycol3 = "col3";<br>	      .mycol4 = "col4"<br>	    }<br>	  _template does not currently support vectors.<br>	  <br>	   To run the query within specific transaction, a transaction handle can be provided along with the updateRequest.<br>	 	 	To execute the queryRequest above in an open transaction with txHandle 42, we can call update in the following way:<br>	 		updateDatabase@Database( {<br>	 			txHandle = 42<br>	  			query = updateRequest	<br>	 		} )( ret )<br>	  |
| rollbackTx | <a href="#TxHandle">TxHandle</a> | <a href='#void'>void</a> | <details><summary>TransactionException</summary>undefined</details><details><summary>SQLException</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details> | <br>	  Rolls back and closes the connection associated with the handle TxHandle. The connection is<br>	  then returned to the connection pool, and any further actions attempted using the transaction handle will throw a TransactionException.<br>	 |
| update | <a href="#UpdateRequest">UpdateRequest</a> | <a href='#int'>int</a> | <details><summary>TransactionException</summary>undefined</details><details><summary>SQLException</summary>undefined</details><details><summary>ConnectionError</summary>undefined</details> | <br>	  Updates the database and returns a single status code<br>	 <br>	  Example with SQL parameters:<br>	  updateRequest =<br>	      "INSERT INTO weather(city, country, data) " +<br>	      "VALUES (:city, :country, :data)";<br>	  updateRequest.city = City;<br>	  updateRequest.country = Country;<br>	  updateRequest.data = r;<br>	  update@Database( updateRequest )( ret )<br>	 <br>	  To run the update within specific transaction, a transaction handle can be provided along with the updateRequest.<br>	  	To execute the updateRequest above in an open transaction with txHandle 42, we can call update in the following way:<br>	 	updateDatabase@Database( {<br>	 		txHandle = 42<br>	  		update = updateRequest	<br>	 	} )( ret )<br>	  <br>	  |


### Types

<details>
<summary><span id="ConnectionInfo">ConnectionInfo: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;database[1,1]: string // 
&nbsp;&nbsp;password[1,1]: string // 
&nbsp;&nbsp;checkConnection[0,1]: int // 
&nbsp;&nbsp;driver[1,1]: string &#123;
&nbsp;&nbsp;&nbsp;&nbsp;class[0,1]: string //  it allows for specifying a specific driver Java class
&nbsp;&nbsp;&#125; // 
&nbsp;&nbsp;port[0,1]: int // 
&nbsp;&nbsp;connectionPoolConfig[0,1]: <a href='#ConnectionPoolConfig'>ConnectionPoolConfig</a> // 
&nbsp;&nbsp;toLowerCase[0,1]: bool // 
&nbsp;&nbsp;host[1,1]: string // 
&nbsp;&nbsp;toUpperCase[0,1]: bool // 
&nbsp;&nbsp;attributes[0,1]: string // 
&nbsp;&nbsp;username[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="ConnectionPoolConfig">ConnectionPoolConfig: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;transactionIsolation[0,1]: string // 
&nbsp;&nbsp;initializationFailTimeout[0,1]: int // 
&nbsp;&nbsp;validationTimeout[0,1]: int // 
&nbsp;&nbsp;catalog[0,1]: string // 
&nbsp;&nbsp;readOnly[0,1]: bool // 
&nbsp;&nbsp;isolateInternalQueries[0,1]: bool // 
&nbsp;&nbsp;maxLifetime[0,1]: int // 
&nbsp;&nbsp;connectionInitSql[0,1]: string // 
&nbsp;&nbsp;minimumIdle[0,1]: int // 
&nbsp;&nbsp;idleTimeout[0,1]: int // 
&nbsp;&nbsp;connectionTestQuery[0,1]: string // 
&nbsp;&nbsp;maximumPoolSize[0,1]: int // 
&nbsp;&nbsp;connectionTimeout[0,1]: int // 
&nbsp;&nbsp;poolName[0,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="DatabaseTransactionRequest">DatabaseTransactionRequest: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;statement[1,1]: string // 
&#125;
</pre>
</details>
<details>
<summary><span id="DatabaseTransactionResult">DatabaseTransactionResult: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;result[0,1]: <a href='#TransactionQueryResult'>TransactionQueryResult</a> // 
&#125;
</pre>
</details>
<details>
<summary><span id="QueryRequest">QueryRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string
|void &#123;
&nbsp;&nbsp;txHandle[1,1]: <a href='#TxHandle'>TxHandle</a> // 
&nbsp;&nbsp;query[1,1]: string // 
&#125;

</pre>
</details>
<details>
<summary><span id="QueryResult">QueryResult: 
</span>
</summary>

##### Type Declaration
<pre>
void &#123;
&nbsp;&nbsp;row[0,1]: void // 
&#125;
</pre>
</details>
<details>
<summary><span id="TransactionQueryResult">TransactionQueryResult: 
</span>
</summary>

##### Type Declaration
<pre>
int &#123;
&nbsp;&nbsp;row[0,1]: void // 
&#125;
</pre>
</details>
<details>
<summary><span id="TxHandle">TxHandle: 
</span>
</summary>

##### Type Declaration
<pre>
long
</pre>
</details>
<details>
<summary><span id="UpdateRequest">UpdateRequest: 
</span>
</summary>

##### Type Declaration
<pre>
string
|void &#123;
&nbsp;&nbsp;txHandle[1,1]: <a href='#TxHandle'>TxHandle</a> // 
&nbsp;&nbsp;update[1,1]: string // 
&#125;

</pre>
</details>
