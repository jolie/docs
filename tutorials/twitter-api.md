# Twitter API

[Twitter](https://twitter.com) offers an API that can be used to access the platform programmatically. In this tutorial, we are going to see how to access these APIs natively from Jolie.

## TL;DR

Get a bearer token to access the Twitter API from Twitter at the page [https://developer.twitter.com/en/docs/basics/authentication/oauth-2-0/bearer-tokens](https://developer.twitter.com/en/docs/basics/authentication/oauth-2-0/bearer-tokens). Replace `<YOUR BEARER TOKEN>` in the code below with your own bearer token.

```jolie
outputPort Twitter {
location: "socket://api.twitter.com:443/"
protocol: https {
	addHeader.header << "Authorization" { value = "Bearer " + "<YOUR BEARER TOKEN>" }
	osc << {
		user_timeline << { alias = "1.1/statuses/user_timeline.json" method = "get" }
		show << { alias = "1.1/statuses/show.json" method = "get" }
	}
}
RequestResponse: user_timeline, show
}
```

You can now access the operations `user_timeline` and `show` of the Twitter API through the Twitter output port given above.

Here is a full Jolie snippet that prints the latest 10 tweets by the [Jolie Twitter account](https://twitter.com/jolielang). Just copy-paste the code into a file, put your own bearer token, and launch it.

```jolie
// The output port from above
outputPort Twitter {
location: "socket://api.twitter.com:443/"
protocol: https {
	addHeader.header << "Authorization" { value = "Bearer " + "<YOUR BEARER TOKEN>" }
	osc << {
		user_timeline << { alias = "1.1/statuses/user_timeline.json" method = "get" }
		show << { alias = "1.1/statuses/show.json" method = "get" }
	}
}
RequestResponse: user_timeline, show
}

main
{
	user_timeline@Twitter( {
		screen_name = "jolielang"
		count = 10
		tweet_mode = "extended" // get full tweets
	} )( tweetList )
	for( tweet in tweetList._ ) { // JSON arrays are stored in _
		println@Console( tweet.full_text )()
	}
}
```

If you want to access more operations than `user_timeline` and `show`, just add them to the output port configuration. You can find the full Twitter API reference at [https://developer.twitter.com/en/docs/api-reference-index](https://developer.twitter.com/en/docs/api-reference-index).

## Learn the details

Here is a more step-by-step explanation.

### Get a bearer token

The Twitter API requires authentication for most operations. We will use an OAuth 2.0 Bearer Token. Before proceeding, you should go and [get your own token from Twitter](https://developer.twitter.com/en/docs/basics/authentication/oauth-2-0/bearer-tokens).

Got your token? Let's continue!

### Set up an output port

The key to accessing the Twitter API is to configure an output port using the `https` protocol, such that it can access the operations that you need.
You can see a complete list of the operations offered by the Twitter API at [https://developer.twitter.com/en/docs/api-reference-index](https://developer.twitter.com/en/docs/api-reference-index). What you are looking for is the resource URL and the HTTP method (GET, POST, etc.) of the operation(s) that you are interested in.

For example, say that you want to use operation `statuses/user_timeline`. Its documentation at [https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-user_timeline](https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-user_timeline) declares that its resource URL is `https://api.twitter.com/1.1/statuses/user_timeline.json` and its method is GET.

This translates to the following output port configuration in Jolie. You have to replace `<YOUR BEARER TOKEN>` with the bearer token that you have obtained previously.

```jolie
outputPort Twitter {
location: "socket://api.twitter.com:443/"
protocol: https {
	addHeader.header << "Authorization" { value = "Bearer " + "<YOUR BEARER TOKEN>" }
	osc << { // "operation-specific configuration"
		user_timeline << { // Configuration for operation user_timeline
			alias = "1.1/statuses/user_timeline.json" // the resource path
			method = "get" // the HTTP method to use
		}
	}
}
RequestResponse: user_timeline
}
```

### Use the output port

We can now use our output port to access the Twitter API. Continuing with our example, we use operation `user_timeline` to print all the latest 10 tweets by the [Jolie Twitter account](https://twitter.com/jolielang).

```jolie
include "console.iol"

outputPort Twitter {
	/* put the output port code from above here */
}

main
{
	user_timeline@Twitter( {
		screen_name = "jolielang"
		count = 10
		tweet_mode = "extended" // get full tweets
	} )( tweetList )
	for( tweet in tweetList._ ) { // JSON arrays are stored in _
		println@Console( tweet.full_text )()
	}
}
```

### Adding more operations

You can add more operations simply by adding the corresponding entries to the protocol configuratoin and the interface of the port. For example, the following code extends our previous output port to offer also the `home_timeline` operation (see [https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-home_timeline](https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-home_timeline)).

```jolie
outputPort Twitter {
location: "socket://api.twitter.com:443/"
protocol: https {
	addHeader.header << "Authorization" { value = "Bearer " + "<YOUR BEARER TOKEN>" }
	osc << {
		user_timeline << { alias = "1.1/statuses/user_timeline.json" method = "get" }
		home_timeline << { alias = "1.1/statuses/home_timeline.json" method = "get" }
	}
}
RequestResponse: user_timeline, home_timeline
}
```

### Passing the bearer token secret

If you do not want to hardcode the bearer token, you can make your program read it from an environment variable (a popular approach if you want to Dockerize your program, see [how to use Docker](../language-tools-and-standard-library/containerization/docker/README.md)), a file, a command-line argument, etc.

For example, to read the bearer token from an environment variable and use it to configure the Twitter output port, you can use the following code.

```jolie
include "runtime.iol" // Include the Runtime service

outputPort Twitter {
location: "socket://api.twitter.com:443/"
protocol: https {
	// No hardcoded authorization header
	osc << {
		user_timeline << { alias = "1.1/statuses/user_timeline.json" method = "get" }
		/* More operation configurations ... */
	}
}
RequestResponse: user_timeline /* More operations... */
}

init
{
	// Read the bearer token from the environment variable BEARER_TOKEN
	getenv@Runtime( "BEARER_TOKEN" )( bearerToken )
	Twitter.protocol.addHeader.header << "Authorization" { value = "Bearer " + bearerToken }
}
```
