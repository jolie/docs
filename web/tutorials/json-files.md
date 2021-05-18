# JSON files

As for XML, Jolie natively supports automatic conversions also between Jolie and JSON data structures.
This is leveraged by the `File` library service to give simple ways to read from and write to JSON files.

## Reading from a JSON file

Say that you have a JSON file called `note.json` with the following content.

```json
{
	"note": {
		"sender": "John",
		"receiver": "Jane",
		"content": "I made pasta"
	}
}
```

You can read from this file and obtain a Jolie data structure as follows.

```jolie
from file import File

service Example {
    embed File as File

	main
	{
		readFile@File( {
			filename = "note.json"
			format = "json"
		} )( data )
		// data is now { node << { sender = "John" receiver = "Jane" content = "I made pasta" } }
	}
}
```

Variable `data` now contains the data from the JSON structure, which you can access as usual using the standard Jolie syntax. For example, to print the `to` node of the note, you can `include "console.iol"` at the beginning of the program and write:

```jolie
println@Console( data.note.to )() // "Jane"
```

## Writing to a JSON file

Suppose that you wanted to store the following data structure as a JSON file.

```jolie
{
	note << {
		sender = "John"
		receiver = "Jane"
		content = "I made pasta"
	}
}
```

You can do so by invoking `writeFile@File` and passing that data structure as the `content` to be written.

```jolie
from file import File

service Example {
	embed File as File
	
	main
	{
		writeFile@File( {
			filename = "note.json"
			format = "json"
			content << {
				note << {
					sender = "John"
					receiver = "Jane"
					content = "I made pasta"
				}
			}
		} )()
	}
}
```

The file `note.json` will now contain the JSON data that we showed at the beginning of the tutorial.

### Another example
Let us consider to have a starting json file, named `file.json` like the following one:

```json
{
    "module": [
        {
            "moduleId": "ONE",
            "moduleName": "ONE",
            "moduleOverview": "ONE"
        },
        {
            "moduleId": "TWO",
            "moduleName": "TWO",
            "moduleOverview": "TWO"
        }
    ]
}
```
The need is to add one more module item to the file. In the following example a jolie script just reads the file and add a new item module, then it wrotes the result on the same file.

```jolie
from file import File

service ManagingJsonFiles {
    embed File as File

    main {
        readFile@File( { filename = "file.json", format = "json" } )( starting_json )
        starting_json.module[ #starting_json.module ] << {
            moduleId = "NEW"
            moduleName = "NEW"
            moduleOverview = "NEW"
        }
        writeFile@File({ filename = "file.json", format = "json", content << starting_json } )()
    }
}
```
It is worth noting that `readFile` and `writeFile` are two operations offerred by standard library `File`. The standard library has been imported at the first line `from file import File`, then it is embedded at line four `embed File as File`.

The final json file appears like the following one.
```json
{
    "module": [
        {
            "moduleOverview": "ONE",
            "moduleName": "ONE",
            "moduleId": "ONE"
        },
        {
            "moduleOverview": "TWO",
            "moduleName": "TWO",
            "moduleId": "TWO"
        },
        {
            "moduleOverview": "NEW",
            "moduleName": "NEW",
            "moduleId": "NEW"
        }
    ]
}

```
The complete example may be consulted at this [link](https://github.com/jolie/examples/tree/master/v1.10.x/tutorials/json-files).
