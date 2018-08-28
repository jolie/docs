---

##Running a Jolie service with arguments

Jolie services can read arguments from the command line. Arguments are stored in a vector called `args`, where the first argument can be retrieved at index 0, the second argument at index 1 and so on.

<pre><code class="language-jolie code">include "console.iol"

main
{
	println@Console( args[0] )()
}
</code></pre>

Save the file with the name `mySecondJolieService.ol` and try to run it in the following way:

<pre><code class="language-jolie code">jolie mySecondJolieService.ol Hi!</code></pre>