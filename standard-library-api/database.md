# Database

## From file `database.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| Database |  |  |

## List of the available interfaces

* [DatabaseInterface](database.md#DatabaseInterface)

## Interface DatabaseInterface {#DatabaseInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [checkConnection](database.md#checkConnection) | void  | void  |  ConnectionError,   |
| [close](database.md#close) | void  | void  |  |
| [connect](database.md#connect) | [ConnectionInfo](database.md#ConnectionInfo)  | void  |  InvalidDriver,   ConnectionError,   DriverClassNotFound,   |
| [executeTransaction](database.md#executeTransaction) | [DatabaseTransactionRequest](database.md#DatabaseTransactionRequest)  | [DatabaseTransactionResult](database.md#DatabaseTransactionResult)  |  SQLException,   ConnectionError,   |
| [query](database.md#query) | QueryRequest  | [QueryResult](database.md#QueryResult)  |  SQLException,   ConnectionError,   |
| [update](database.md#update) | UpdateRequest  | int  |  SQLException,   ConnectionError,   |

## Operation list

### checkConnection {#checkConnection}

```text
checkConnection( void )( void )
 throws


ConnectionError
```

Checks the connection with the database. Throws ConnectionError if the connection is not functioning properly.

### query {#query}

```text
query( QueryRequest )( QueryResult )
 throws


SQLException


ConnectionError
```

Queries the database and returns a result set  
  
 Example with SQL parameters:  
 queryRequest =  
 "SELECT city, country, data FROM weather " +  
 "WHERE city=:city AND country=:country";  
 queryRequest.city = City;  
 queryRequest.country = Country;  
 query@Database\( queryRequest \)\( queryResponse \);  
  
 \_template:  
 Field \_template allows for the definition of a specific output template.  
 Assume, e.g., to have a table with the following columns:  
 \| col1 \| col2 \| col3 \| col4 \|  
 If \_template is not used the output will be rows with the following format:  
 row  
 \|-col1  
 \|-col2  
 \|-col3  
 \|-col4  
 Now let us suppose we would like to have the following structure for each row:  
 row  
 \|-mycol1 contains content of col1  
 \|-mycol2 contains content of col2  
 \|-mycol3 contains content of col3  
 \|-mycol4 contains content of col4  
  
 In order to achieve this, we can use field \_template as it follows:  
 with\( query\_request.\_template \) {  
 .mycol1 = "col1";  
 .mycol1.mycol2 = "col2";  
 .mycol1.mycol2.mycol3 = "col3";  
 .mycol4 = "col4"  
 }  
 \_template does not currently support vectors.

### executeTransaction {#executeTransaction}

```text
executeTransaction( DatabaseTransactionRequest )( DatabaseTransactionResult )
 throws


SQLException


ConnectionError
```

Executes more than one database command in a single transaction

### update {#update}

```text
update( UpdateRequest )( int )
 throws


SQLException


ConnectionError
```

Updates the database and returns a single status code  
  
 Example with SQL parameters:  
 updateRequest =  
 "INSERT INTO weather\(city, country, data\) " +  
 "VALUES \(:city, :country, :data\)";  
 updateRequest.city = City;  
 updateRequest.country = Country;  
 updateRequest.data = r;  
 update@Database\( updateRequest \)\( ret \)

### close {#close}

```text
close( void )( void )
```

Explicitly closes a database connection  
 Per default the close happens on reconnect or on termination of the  
 Database service, eg. when the enclosing program finishes.

### connect {#connect}

```text
connect( ConnectionInfo )( void )
 throws


InvalidDriver


ConnectionError


DriverClassNotFound
```

Connects to a database and eventually closes a previous connection  
  
 Example with HSQLDB:  
 with \( connectionInfo \) {  
 .username = "sa";  
 .password = "";  
 .host = "";  
 .database = "file:weatherdb/weatherdb"; // "." for memory-only  
 .driver = "hsqldb\_embedded"  
 };  
 connect@Database\( connectionInfo \)\( void \);

## Message type list

### QueryRequest {#QueryRequest}

```text
type QueryRequest: undefined
```

### QueryResult {#QueryResult}

```text
type QueryResult: void { 
    .row*: undefined
}
```

### DatabaseTransactionRequest {#DatabaseTransactionRequest}

```text
type DatabaseTransactionRequest: void { 
    .statement[1,2147483647]: undefined
}
```

### DatabaseTransactionResult {#DatabaseTransactionResult}

```text
type DatabaseTransactionResult: void { 
    .result*: TransactionQueryResult
}
```

### UpdateRequest {#UpdateRequest}

```text
type UpdateRequest: undefined
```

### ConnectionInfo {#ConnectionInfo}

```text
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

## Type list

### TransactionQueryResult {#TransactionQueryResult}

```text
type TransactionQueryResult: int { 
    .row*: undefined
}
```

