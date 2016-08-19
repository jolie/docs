---

##Running a Jolie service with parameters

Jolie services can read parameters from the command line. Parameters are stored in a vector called `args`, where the first parameter can be retrieved at index 0, the second parameter at index 1 and so on.

<pre><code class="language-jolie code">
include "console.iol"

main
{
	println@Console( args[0] )()
}

</code></pre>

Save the file with the name `mySecondJolieService.ol` and try to run it in the following way:

<pre><code class="language-jolie code">
jolie mySecondJolieService.ol Hi!

</code></pre>