## Debug a Jolie program via Netbeans debugger

Sometimes it is useful to debug the execution of a Jolie program from Netbeans. The following is an example of how to do that on Linux, assuming that:

* Jolie is installed in `/opt/jolie ` ;
* the path to the Jolie program to run is `main.ol `;
* the path to the directory of the Jolie program to run is `/path/to/your/jolie_service/ `.



Run -&gt; Set Main Project -&gt; jolie

Run -&gt; Set Project Configuration -&gt; Customize

* Main Class: `jolie.Jolie`
* Arguments: `-l /opt/jolie/lib:/opt/jolie/javaServices/*:/opt/jolie/extensions/* -i /opt/jolie/include main.ol`
* Working Directory: `/path/to/your/jolie_service/`



