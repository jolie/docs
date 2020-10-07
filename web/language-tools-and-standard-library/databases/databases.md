# Databases

Jolie can be used with various relational/SQL databases, using the Database service from the standard library. The Database service uses JDBC, so you need the correct driver JAR placed in the `lib` subdirectory \(the one of the program or the global one, e.g., `/usr/lib/jolie/lib/` in Linux\).

Attention: if your JAR driver is called differently, you will have to rename it or create an apposite link, otherwise Jolie is not able to load it. The list of correct names for JAR drivers is given below.

| Database | Driver name \(`driver` \) | JAR filename |
| :--- | :--- | :--- |
| PostgreSQL | `postgresql` | `jdbc-postgresql.jar` |
| MySQL | `mysql` | `jdbc-mysql.jar` |
| Apache Derby | `derby_embedded` or `derby` | `derby.jar` or `derbyclient.jar` |
| SQLite | `sqlite` | `jdbc-sqlite.jar` |
| SQLServer | `sqlserver` | `sqljdbc4.jar` |
| HSQLDB | `hsqldb_hsql` , `hsqldb_hsqls` , `hsqldb_http` or `hsqldb_https` | `hsqldb.jar` |
| IBM DB 2 | `db2` | `db2jcc.jar` |
| IBM AS 400 | `as400` | `jt400.jar` |

The Database service officially supports only the listed DB systems, which were tested and are known to work. If your DB system has not been covered, please contact us \(jolie-devel@lists.sourceforge.net\) and we will help you to get it added.

## Using multiple databases

By default, the Database service included by `database.iol` works for connecting to a single database. If you need to use multiple databases from the same Jolie service, you can run additional instance by creating another output port and embedding the Database Java service again, as in the following:

```jolie
outputPort Database2 {
Interfaces: DatabaseInterface
}

embedded {
Java:
        "joliex.db.DatabaseService" in Database2
}
```

## First example: WeatherService

This is a modification of the WeatherService client mentioned in section \[Web Services/web\_services\] \(web\_services/web\_services.html\). It fetches meteorologic data of a particular location \(constants `City` and `Country`\) and stores it in HSQLDB. If the DB has not been set up yet, the code takes care of the initialisation. The idea is to run the program in batch \(eg. by a cronjob\) to collect data, which could be interesting in Internet of Things \(IoT\) scenarios.

```jolie
include "weatherService.iol"
include "string_utils.iol"
include "xml_utils.iol"
include "database.iol"
include "console.iol"

/*
 * weatherServiceCallerSql.ol - stores weather data in a HSQLDB DB
 */

constants { City = "Bolzano", Country = "Italy" }

main
{
    // fetch weather
    with( request ) {
        .CityName = City;
        .CountryName = Country
    };
    GetWeather@GlobalWeatherSoap( request )( response );
    r = response.GetWeatherResult;

    // connect to DB
    with ( connectionInfo ) {
        .username = "sa";
        .password = "";
        .host = "";
        .database = "file:weatherdb/weatherdb"; // "." for memory-only
        .driver = "hsqldb_embedded"
    };
    connect@Database( connectionInfo )( void );

    // create table if it does not exist
    scope ( createTable ) {
        install ( SQLException => println@Console("Weather table already there")() );
        updateRequest =
            "CREATE TABLE weather(city VARCHAR(50) NOT NULL, " +
            "country VARCHAR(50) NOT NULL, data VARCHAR(1024) NOT NULL, " +
            "PRIMARY KEY(city, country))";
        update@Database( updateRequest )( ret )
    };

    // insert/update current record
    scope ( update ) {
        install ( SQLException =>
            updateRequest =
                "UPDATE weather SET data = :data WHERE city = :city " +
                "AND country = :country";
            updateRequest.city = City;
            updateRequest.country = Country;
            updateRequest.data = r;
            update@Database( updateRequest )( ret )
        );
        updateRequest =
            "INSERT INTO weather(city, country, data) " +
            "VALUES (:city, :country, :data)";
        updateRequest.city = City;
        updateRequest.country = Country;
        updateRequest.data = r;
        update@Database( updateRequest )( ret )
    };

    // print inserted content
    queryRequest =
        "SELECT city, country, data FROM weather " +
        "WHERE city=:city AND country=:country";
    queryRequest.city = City;
    queryRequest.country = Country;
    query@Database( queryRequest )( queryResponse );

    // HSQLDB needs the attributes to be upcased when requesting content
    println@Console("City: " + queryResponse.row[0].CITY)();
    println@Console("Country: " + queryResponse.row[0].COUNTRY)();
    println@Console("Data: " + queryResponse.row[0].DATA)();

    // shutdown DB
    update@Database( "SHUTDOWN" )( ret )
}
```

## Second example: TodoList

The next example provides a very easy CRUD \(create, retrieve, update, delete\) webservice for a TODO list. The example is shown with HSQLDB but theoretically each DB could have been used. The HTTP's server output format is set to JSON, the input can be approached by both GET or POST requests.

```jolie
include "console.iol"
include "database.iol"
include "string_utils.iol"

execution { concurrent }

interface Todo {
RequestResponse:
    retrieveAll(void)(undefined),
    create(undefined)(undefined),
    retrieve(undefined)(undefined),
    update(undefined)(undefined),
    delete(undefined)(undefined)
}

inputPort Server {
    Location: "socket://localhost:8000/"
    Protocol: http { .format = "json" }
    Interfaces: Todo
}

init
{
    with (connectionInfo) {
        .username = "sa";
        .password = "";
        .host = "";
        .database = "file:tododb/tododb"; // "." for memory-only
        .driver = "hsqldb_embedded"
    };
    connect@Database(connectionInfo)();
    println@Console("connected")();

    // create table if it does not exist
    scope (createTable) {
        install (SQLException => println@Console("TodoItem table already there")());
        update@Database(
            "create table TodoItem(id integer generated always as identity, " +
            "text varchar(255) not null, primary key(id))"
        )(ret)
    }
}

main
{
    [ retrieveAll()(response) {
        query@Database(
            "select * from TodoItem"
        )(sqlResponse);
        response.values -> sqlResponse.row
    } ]
    [ create(request)(response) {
        update@Database(
            "insert into TodoItem(text) values (:text)" {
                .text = request.text
            }
        )(response.status)
    } ]
    [ retrieve(request)(response) {
        query@Database(
            "select * from TodoItem where id=:id" {
                .id = request.id
            }
        )(sqlResponse);
        if (#sqlResponse.row == 1) {
            response -> sqlResponse.row[0]
        }
    } ]    
    [ update(request)(response) {
        update@Database(
            "update TodoItem set text=:text where id=:id" {
                .text = request.text,
                .id = request.id
            }
        )(response.status)
    } ]
    [ delete(request)(response) {
        update@Database(
            "delete from TodoItem where id=:id" {
                .id = request.id
            }
        )(response.status)
    } ]
}
```

Client requests using curl:

* Create new record: `curl -v "http://localhost:8000/create?text=Shopping"`
* Retrieve all records: `curl -v "http://localhost:8000/retrieveAll"`
* Retrieve record - GET in x-www-form-urlencoded \(webbrowser form\): `curl -v "http://localhost:8000/retrieve?id=0"`
* Retrieve record - GET request in JSON: `curl -v "http://localhost:8000/retrieve?=\{\"id\":0\}"`
* Retrieve record - POST request in x-www-form-urlencoded \(webbrowser form\): `curl -v -d "id=0" -H "Content-Type: application/x-www-form-urlencoded" "http://localhost:8000/retrieve"`
* Retrieve record - POST request in JSON: `curl -v -d "{\"id\":0}" -H "Content-Type: application/json" "http://localhost:8000/retrieve"`

