---

##Running a Jolie service with parameters

Jolie services can read parameters from the command line. Parameters are stored in a vector called `args`, where the first parameter can be retrieved at index 0, the second parameter at index 1 and so on.

<pre class="code">
include "console.iol"

main
{
	println@Console( args[0] )()
}

</pre>

Save the file with the name `mySecondJolieService.ol` and try to run it in the following way:

<pre class="code">
jolie mySecondJolieService.ol Hi!

</pre>