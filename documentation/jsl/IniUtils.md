# JolieDoc for Port IniUtils #

## From file `ini_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>IniUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  IniUtilsInterface 

--------------------

## Interface IniUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">parseIniFile</a></td>
   <td><a rel="nofollow">parseIniFileRequest</a><br></td>
   <td>IniData<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### parseIniFile ###

    parseIniFile( parseIniFileRequest )( IniData )

--------------------

## Message type list ##

### parseIniFileRequest ###

    type parseIniFileRequest: string { 
        .charset?: string
    }

### IniData ###

    type IniData: undefined Type list