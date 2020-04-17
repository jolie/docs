# JSON files

As for XML, Jolie natively supports automatic conversions also between Jolie and JSON data structures.
This is leveraged by the `File` library service to give simple ways to read from and write to JSON files.

## Reading from a JSON file

Say that you have a JSON file called `note.json` with the following content.

```json
{
	"note": {
		"from": "John",
		"to": "Jane",
		"content": "I made pasta"
	}
}
```

You can read from this file and obtain a Jolie data structure as follows.

```jolie
include "file.iol"

main
{
	readFile@File( {
		filename = "note.json"
		format = "json"
	} )( data )
	// data is now { node << { from = "John" to = "Jane" content = "I made pasta" } }
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
		from = "John"
		to = "Jane"
		content = "I made pasta"
	}
}
```

You can do so by invoking `writeFile@File` and passing that data structure as the `content` to be written.

```jolie
include "file.iol"

main
{
	writeFile@File( {
		filename = "note.json"
		format = "json"
		content << {
			note << {
				from = "John"
				to = "Jane"
				content = "I made pasta"
			}
		}
	} )()
}
```

The file `note.json` will now contain the JSON data that we showed at the beginning of the tutorial.