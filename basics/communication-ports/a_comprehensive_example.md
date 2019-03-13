# Example

Here we discuss a simple example where both OneWay/Notification and RequestResponse/SolicitResponse primitives are used.
The complete code can be checked and downloaded at this [link](https://github.com/jolie/examples/tree/master/02_basics/1_ports/newspaper).

The example's architecture is reported below.

![](../../.gitbook/assets/newspaper.png)

A newspaper service collects news sent by authors, users can get all the registered news into the newspaper.
The interface of the newspaper service defines two operations: 

* *sendNews* which is a OneWay operation used by authors for sending news to the newspaper service
* *getNews* which is a RequestResponse operation used by users for getting the list of the registered news

```text
type News: void {
    .category: string
    .title: string
    .text: string
    .author: string
}

type GetNewsResponse: void {
    .news*: News
}

type SendNewsRequest: News

interface NewsPaperInterface {
  RequestResponse:
      getNews( void )( GetNewsResponse )

  OneWay:
      sendNews( SendNewsRequest )
}
```
The implementation of the two operations is very simple; we exploit a global variable for storing all the incoming news. When the *getNews* is invoked, we just return the list of the stored news.
Details about the global variables can be found in section [Processes](basics/processes.md).

```text
include "NewsPaperInterface.iol"

execution{ concurrent }

inputPort NewsPaperPort {
  Location:"auto:ini:/Locations/NewsPaperPort:file:locations.ini"
  Protocol: sodep
  Interfaces: NewsPaperInterface
}

main {
    [ getNews( request )( response ) {
        response.news -> global.news
    }]

    [ sendNews( request ) ] { global.news[ #global.news ] << request }
}
```

The author and the user can invoke the *NewsPaper* by exploiting two jolie scripts, *author.ol* and *user.ol* respectively.
The two scripts can be run in a separate shell with respect to the newspaper one.
In the following we report the code of the twi scripts:

```text
//author.ol
include "NewsPaperInterface.iol"

include "console.iol"

outputPort NewsPaper {
  Location: "socket://localhost:9000"
  Protocol: sodep
  Interfaces: NewsPaperInterface
}

main {
    /* in order to get parameters from the console we need to register the service to the console one
    by using the operatio registerForInput. After this, we are enabled to receive messages from the console
    on input operation in (defined in console.iol)*/
    registerForInput@Console()();
    print@Console("Insert category:")(); in( request.category );
    print@Console("Insert title:")(); in( request.title );
    print@Console("Insert news text:")(); in( request.text );
    print@Console("Insert your name:")(); in( request.author );
    sendNews@NewsPaper( request );
    println@Console("The news has been sent to the newspaper")()
}
```



```text
//user.ol

include "NewsPaperInterface.iol"
include "console.iol"

outputPort NewsPaper {
  Location: "socket://localhost:9000"
  Protocol: sodep
  Interfaces: NewsPaperInterface
}

main {
    getNews@NewsPaper()( response );
    for( i = 0, i < #response.news, i++ ) {
        println@Console( "CATEGORY: " + response.news[ i ].category )();
        println@Console( "TITLE: " + response.news[ i ].title )();
        println@Console( "TEXT: " + response.news[ i ].text )();
        println@Console( "AUTHOR: " + response.news[ i ].author )();
        println@Console("------------------------------------------")()
    }
}
```


