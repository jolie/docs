# Mustache
In this section we briefly show an example on how to use module Mustache from the Standard Library.

* The documentation related to mustache can be found at this [link](https://mustache.github.io/).
* The full code of this tutorial can be found [here](https://github.com/jolie/examples/tree/master/Tutorials/mustache)

[TOC]


## Importing modules
The module to import is the following one:

```jolie
from mustache import Mustache
```
## Loading a template
In this tutorial, we show how to apply the following mustahce template to a set of data:

```json
{
  "applicationName": "{{applicationName}}",
  "version": "{{version}}",
  "description": "{{description}}",
  "author": {
    "name": "{{author.name}}",
    "email": "{{author.email}}"
  },
  "configuration": {
    "environment": "{{configuration.environment}}", 
    "port": {{configuration.port}},
    "database": {
      "host": "{{configuration.database.host}}",
      "port": {{configuration.database.port}},
      "name": "{{configuration.database.name}}",
      "user": "{{configuration.database.user}}",
      "password": "{{configuration.database.password}}"
    }
  },
  "features": [
    {{#features}}
    {
      "name": "{{name}}",
      "enabled": {{enabled}}
    }{{^last}},{{/last}}
    {{/features}}
  ]
}
```

Loading it from a file is very simple, just use module File 

```jolie
readFile@File( { filename = "template.mustache" } )( template )
```
The template is now store within variable `template` as a string.

## Rendering a mustache template
Just invoke operation `render` of module `Mustache` for getting the final document
```jolie
render_req << {
    template = template
    data << {
        applicationName = "Task Manager"
        version = "1.0.0"
        description = "A simple application for managing tasks and projects."
        author << {
            name = "Jane Doe"
            email = "jane.doe@example.com"
        }
        configuration << {
            environment = "production"
            port = 8080
            database << {
                host = "localhost"
                port = 5432
                name = "task_manager_db"
                user = "admin"
                password = "securepassword"
            }
        }
        features[ 0 ] << {
            name = "Task Management"
            enabled = true
        }
        features[ 1 ] << {
            name = "Notifications"
            enabled = false
        }
        features[ 2 ] << {
            name = "Reporting"
            enabled = true
            last = true 
        }
    }
}
render@Mustache( render_req )( rendered_document )
```
Note that operation `render` requires two varibles:
* `template` that contains the template as a string 
* `data` that containes the set of data to use as a replacement in the template