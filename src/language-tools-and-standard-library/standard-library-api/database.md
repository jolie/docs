# Database

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Database documentation: |  |  |  |
| Database | - | - | [DatabaseInterface](database.md#DatabaseInterface) |

### List of Available Interfaces

### DatabaseInterface <a id="DatabaseInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [checkConnection](database.md#checkConnection) | void | void |  ConnectionError\( undefined \) |
| [query](database.md#query) | [QueryRequest](database.md#QueryRequest) | [QueryResult](database.md#QueryResult) |  SQLException\( undefined \)  ConnectionError\( undefined \) |
| [executeTransaction](database.md#executeTransaction) | [DatabaseTransactionRequest](database.md#DatabaseTransactionRequest) | [DatabaseTransactionResult](database.md#DatabaseTransactionResult) |  SQLException\( undefined \)  ConnectionError\( undefined \) |
| [update](database.md#update) | [UpdateRequest](database.md#UpdateRequest) | int |  SQLException\( undefined \)  ConnectionError\( undefined \) |
| [close](database.md#close) | void | void |  |
| [connect](database.md#connect) | [ConnectionInfo](database.md#ConnectionInfo) | void |  InvalidDriver\( undefined \)  ConnectionError\( undefined \)  DriverClassNotFound\( undefined \) |

## Operation Description

### checkConnection <a id="checkConnection"></a>

Operation documentation: Checks the connection with the database. Throws ConnectionError if the connection is not functioning properly.

Invocation template:

```jolie
checkConnection@Database( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `ConnectionError` with type `undefined`

Fault-handling install template:

```jolie
install ( ConnectionError => /* error-handling code */ )
```

### query <a id="query"></a>

Operation documentation: Queries the database and returns a result set

```jolie
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
    |-mycol1            contains content of col1
        |-mycol2        contains content of col2
       |-mycol3        contains content of col3
    |-mycol4            contains content of col4

  In order to achieve this, we can use field _template as it follows:
    with( query_request._template ) {
      .mycol1 = "col1";
      .mycol1.mycol2 = "col2";
      .mycol1.mycol2.mycol3 = "col3";
      .mycol4 = "col4"
    }
  _template does not currently support vectors.
```

Invocation template:

```jolie
query@Database( request )( response )
```

#### Request type <a id="QueryRequest"></a>

Type: QueryRequest

```jolie
type QueryRequest: undefined
```

`QueryRequest : string`

#### Response type <a id="QueryResult"></a>

Type: QueryResult

```jolie
type QueryResult: void {
    .row*: undefined
}
```

`QueryResult : void`

* `row : void`

#### Possible faults thrown

Fault `SQLException` with type `undefined`

Fault-handling install template:

```jolie
install ( SQLException => /* error-handling code */ )
```

Fault `ConnectionError` with type `undefined`

Fault-handling install template:

```jolie
install ( ConnectionError => /* error-handling code */ )
```

### executeTransaction <a id="executeTransaction"></a>

Operation documentation: Executes more than one database command in a single transaction

Invocation template:

```jolie
executeTransaction@Database( request )( response )
```

#### Request type <a id="DatabaseTransactionRequest"></a>

Type: DatabaseTransactionRequest

```jolie
type DatabaseTransactionRequest: void {
    .statement[1,2147483647]: undefined
}
```

`DatabaseTransactionRequest : void`

* `statement : string`

#### Response type <a id="DatabaseTransactionResult"></a>

Type: DatabaseTransactionResult

```jolie
type DatabaseTransactionResult: void {
    .result*: TransactionQueryResult
}
```

`DatabaseTransactionResult : void`

* `result : int`

#### Possible faults thrown

Fault `SQLException` with type `undefined`

Fault-handling install template:

```jolie
install ( SQLException => /* error-handling code */ )
```

Fault `ConnectionError` with type `undefined`

Fault-handling install template:

```jolie
install ( ConnectionError => /* error-handling code */ )
```

### update <a id="update"></a>

Operation documentation: Updates the database and returns a single status code

```jolie
  Example with SQL parameters:
  updateRequest =
      "INSERT INTO weather(city, country, data) " +
      "VALUES (:city, :country, :data)";
  updateRequest.city = City;
  updateRequest.country = Country;
  updateRequest.data = r;
  update@Database( updateRequest )( ret )
```

Invocation template:

```jolie
update@Database( request )( response )
```

#### Request type <a id="UpdateRequest"></a>

Type: UpdateRequest

```jolie
type UpdateRequest: undefined
```

`UpdateRequest : string`

#### Response type

Type: int

`int : int`

#### Possible faults thrown

Fault `SQLException` with type `undefined`

Fault-handling install template:

```jolie
install ( SQLException => /* error-handling code */ )
```

Fault `ConnectionError` with type `undefined`

Fault-handling install template:

```jolie
install ( ConnectionError => /* error-handling code */ )
```

### close <a id="close"></a>

Operation documentation: Explicitly closes a database connection Per default the close happens on reconnect or on termination of the Database service, eg. when the enclosing program finishes.

Invocation template:

```jolie
close@Database( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: void

`void : void`

### connect <a id="connect"></a>

Operation documentation: Connects to a database and eventually closes a previous connection

```jolie
  Example with HSQLDB:
  with ( connectionInfo ) {
      .username = "sa";
      .password = "";
      .host = "";
      .database = "file:weatherdb/weatherdb"; // "." for memory-only
      .driver = "hsqldb_embedded"
  };
  connect@Database( connectionInfo )( void );
```

Invocation template:

```jolie
connect@Database( request )( response )
```

#### Request type <a id="ConnectionInfo"></a>

Type: ConnectionInfo

```jolie
type ConnectionInfo: void {
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
}
```

`ConnectionInfo : void`

* `database : string`
* `password : string`
* `checkConnection : int`
* `driver : string`
* `port : int`
* `toLowerCase : bool`
* `host : string`
* `toUpperCase : bool`
* `attributes : string`
* `username : string`

#### Response type

Type: void

`void : void`

#### Possible faults thrown

Fault `InvalidDriver` with type `undefined`

Fault-handling install template:

```jolie
install ( InvalidDriver => /* error-handling code */ )
```

Fault `ConnectionError` with type `undefined`

Fault-handling install template:

```jolie
install ( ConnectionError => /* error-handling code */ )
```

Fault `DriverClassNotFound` with type `undefined`

Fault-handling install template:

```jolie
install ( DriverClassNotFound => /* error-handling code */ )
```

### Subtypes

#### TransactionQueryResult <a id="TransactionQueryResult"></a>

```jolie
type TransactionQueryResult: int { .row*: undefined }
```

