<!-- cSpell:ignore openapi -->

# Rest Services

This section is devoted in illustrating how to create REST services with Jolie. Differently from standard Jolie services which are agnostic to protocols, in a REST approach we must take into account how the underlying HTTP protocol works. In a REST service indeed, only the four basic http methods can be used for defining actions on a service, they are: GET, POST, PUT and DELETE. The consequence of such a strong limitation on the possible actions to be used, is that the resulting programming style must provide expressiveness on data instead of verbs. Such a characteristic has the main consequence to focus the programming style to the resources: we are not free to program all the actions we would like, but we are free to program all the resources we would like.

In jolie a developer can follow two different approaches for programming REST APIs:

- Programming a self-contained REST service by using the `http` protocol.
- Adding a router in front of an existing service.

## Programming a self-contained REST service

We demonstrate how to create a self-contained REST service with a simple example: a REST service that exposes an API for retrieving and changing information about users. Users are identified by username and associated to data that includes name, e-mail address, and an integer representing "karma" that the user has in the system. In particular, these operations are possible:

- Getting information about a specific user (name, e-mail, and karma counter) by passing its username, for example by requesting `/api/users/jane`.
- Listing the usernames of the users in the system, with the possibility of filtering them by karma. For example, to get the list of usernames associated to minimum karma 5, we could request `/api/users?minKarma=5`.
- Creating new users by means of a POST request to `/api/users`. The payload needs to match the `UserWithUsername` structure (username, name and karma). The response will provide the new record with an apposite resource location header.
- Updating a particular user over a PUT request with a username parameter e.g. `/api/users/jane`. The payload needs to contain the attributes of the `User` structure (name and karma). No payload will be returned.
- Removing a user by performing a DELETE request with its username e.g. `/api/users/jane`. Also here no payload will be returned.

The code for implementing this service follows.

```jolie
type User { name: string email: string karma: int }
type UserWithUsername { username: string name: string email: string karma: int }
type ListUsersRequest { minKarma?: int }
type ListUsersResponse { usernames*: string }
type UserRequest { username: string }

interface UsersInterface {
RequestResponse:
    createUser( UserWithUsername )( void ) throws UserExists( string ),
    listUsers( ListUsersRequest )( ListUsersResponse ),
    viewUser( UserRequest )( User ) throws UserNotFound( string ),
    updateUser( UserWithUsername )( void ) throws UserNotFound( string ),
    deleteUser( UserRequest )( void ) throws UserNotFound( string )
}

service App {
    execution: sequential

    inputPort Web {
        location: "socket://localhost:8080"
        protocol: http {
            format = "json"
            osc << {
                createUser << {
                    template = "/api/user"
                    method = "post"
                    statusCodes = 201 // 201 = Created
                    statusCodes.TypeMismatch = 400
                    statusCodes.UserExists = 400
                    response.headers -> responseHeaders
                }
                listUsers << {
                    template = "/api/user"
                    method = "get"
                }
                viewUser << {
                    template = "/api/user/{username}"
                    method = "get"
                    statusCodes.UserNotFound = 404
                }
                updateUser << {
                    template = "/api/user/{username}"
                    method = "put"
                    statusCodes.TypeMismatch = 400
                    statusCodes.UserNotFound = 404                    
                }
                deleteUser << {
                    template = "/api/user/{username}"
                    method = "delete"
                    statusCodes.UserNotFound = 404
                }
            }
        }
        interfaces: UsersInterface
    }

    init {
        global.users << {
            john << {
                name = "John Doe", email = "john@doe.com", karma = 4
            }
            jane << {
                name = "Jane Doe", email = "jane@doe.com", karma = 6
            }
        }
    }

    main {
        [ createUser( request )( ) {
            if( is_defined( global.users.(request.username) ) ) {
                throw( UserExists, request.username )
            } else {
                global.users.(request.username) << request
                undef( global.users.(request.username).username )
                responseHeaders.Location = "/api/user/" + request.username
            }
        } ]

        [ viewUser( request )( user ) {
            if( is_defined( global.users.(request.username) ) ) {
                user << global.users.(request.username)
            } else {
                throw( UserNotFound, request.username )
            }
        } ]

        [ listUsers( request )( response ) {
            i = 0
            foreach( username : global.users ) {
                user << global.users.(username)
                if( !( is_defined( request.minKarma ) && user.karma < request.minKarma ) ) {
                    response.usernames[i++] = username
                }
            }
        } ]

        [ updateUser( request )( ) {
            if( is_defined( global.users.(request.username) ) ) {
                global.users.(request.username) << request
                undef( global.users.(request.username).username )
            } else {
                throw( UserNotFound, request.username )
            }
        } ]

        [ deleteUser( request )( ) {
            if( is_defined( global.users.(request.username) ) ) {
                undef( global.users.(request.username) )
            } else {
                throw( UserNotFound, request.username )
            }
        } ]
    }
}
```

Above, notice the use of the `osc` parameter of the `http` protocol to map operations to their respective HTTP configurations.
For example, operation `viewUser` is configured to use:

- `/api/user` as URI template, by `template = "/api/user"`. See the [official RFC on URI templates](https://www.rfc-editor.org/rfc/rfc6570) for more information about them.
- GET as HTTP method, by `method = "get"`.

## Adding a router

Following this approach, a specific http router, called _jester_, is introduced between the caller and the Jolie service to expose as a REST service. The http router is in charge to convert all the rest calls into the corresponding Jolie operations.

![](../../assets/image/rest.png)

_jester_ is distributed together with Jolie and it is possible to use it in your projects. The interested reader may consult the project repo of jester at this [link](https://github.com/jolie/jester). Here we just point out that _jester_ requires a mapping between the operation of the target services and the http methods to expose together with the resource templates.

```text
target operation ---> http method, rest resource template
```

Such a kind of mapping must be provided to _jester_ in the form of a json file. In the section [jolier](../rest/jolier/README.md) we will explain how to correctly define a mapping file for _jester_.

### The tools for enabling the deployment of a Jolie service as a REST service

In the following sections we will show how some tools which come together with the jolie installation can facilitate the deployment of a jolie service as a REST service. The tools are:

- **jolier**: like the command `jolie`, `jolier` automatically executes a jolie service as a REST service transparently embedding _jester_
- **jolie2openapi**: it generates an [openapi](https://swagger.io/docs/specification/about/) definition of a jolie interface
- **openapi2jolie**: it generates a jolie client which enable to invoking a rest service described by an openapi definition
