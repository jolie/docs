# JolieDoc for Port Exec #

## From file `exec.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Exec</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ExecInterface 

--------------------

## Interface ExecInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">exec</a></td>
   <td><a rel="nofollow">CommandExecutionRequest</a><br></td>
   <td><a rel="nofollow">CommandExecutionResult</a><br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### exec ###

    exec( CommandExecutionRequest )( CommandExecutionResult )

--------------------

## Message type list ##

### CommandExecutionRequest ###

    type CommandExecutionRequest: string { 
        .args*: string
        .workingDirectory?: string
        .stdOutConsoleEnable?: bool
        .waitFor?: int
    }

### CommandExecutionResult ###

    type CommandExecutionResult: any { 
        .exitCode?: int
        .stderr?: string
    }

--------------------

## Type list ##