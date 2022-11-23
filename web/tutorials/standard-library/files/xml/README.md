# XML files

Jolie natively supports automatic conversions between Jolie and XML data structures.
The `File` library service leverages this to offer simple ways of reading from and writing to XML files.

## Reading from an XML file

Suppose that you had an XML file called `note.xml` with the following content.

```xml
<note><from>John</from><to>Jane</to><content>I made pasta</content></note>
```

You can read from this file and obtain a Jolie data structure as follows.

```jolie
from file import File

service Example {

  embed File as file 

  main
  {
    readFile@file( {
    filename = "note.xml"
    format = "xml"
  } )( data )
  // data is now { node << { from = "John" to = "Jane" content = "I made pasta" } }
  }
}
```

Variable `data` now contains the data from the XML structure, which you can access as usual using the standard Jolie syntax. For example, to print the `to` node of the note, you can import the standard library  ```console``` at the beginning of the program and write and use the operation ` println@console(data.node.to)() `

```jolie
from file import File
from console import Console

service Example {

embed File as file 
embed Console as console

 main
 {
  readFile@file( {
   filename = "note.xml"
   format = "xml"
  } )( data )
  // data is now { node << { from = "John" to = "Jane" content = "I made pasta" } }
  println@console(data.node.to)()
 }
}
```

## Writing to an XML file

Suppose that you wanted to store the following data structure as an XML file.

```jolie
{
 note << {
  from = "John"
  to = "Jane"
  content = "I made pasta"
 }
}
```

You can do so by invoking `writeFile@file` and passing that data structure as the `content` to be written.

```jolie
from file import File

service Example {

  embed File as file 
  main
  {
    writeFile@file( {
      filename = "note.xml"
      format = "xml"
      content << {
        note << {
          from = "John"
          to = "Jane"
          content = "I made pasta"
        }
      }
    })()
  }
} 
```

The file `note.xml` will now contain the XML data that we showed at the beginning of the tutorial.
