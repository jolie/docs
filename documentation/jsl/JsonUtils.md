# JolieDoc for Port JsonUtils #

## From file `json_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>JsonUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  JsonUtilsInterface 

--------------------

## Interface JsonUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">getJsonString</a></td>
   <td>GetJsonStringRequest<br></td>
   <td>GetJsonStringResponse<br></td>
   <td>JSONCreationError,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getJsonValue</a></td>
   <td><a rel="nofollow">GetJsonValueRequest</a><br></td>
   <td>GetJsonValueResponse<br></td>
   <td>JSONCreationError,&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### getJsonString ###

    getJsonString( GetJsonStringRequest )( GetJsonStringResponse ) throws
    				JSONCreationError

Returns the value converted into a JSON string  
  
Each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "\_" helper childs disappear (e.g. a.\_\[i\].\_\[j\] -> a\[i\]\[j\]), the rest gets converted recursively

### getJsonValue ###

    getJsonValue( GetJsonValueRequest )( GetJsonValueResponse ) throws
    				JSONCreationError

Returns the JSON string converted into a value  
  
Each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "\_" helper childs (e.g. a\[i\]\[j\] -> a.\_\[i\].\_\[j\]), the rest gets converted recursively

--------------------

## Message type list ##

### GetJsonStringRequest ###

    type GetJsonStringRequest: undefined GetJsonStringResponse type GetJsonStringResponse: string GetJsonValueRequest type GetJsonValueRequest: any { 
        .strictEncoding?: bool
        .charset?: string
    } GetJsonValueResponse type GetJsonValueResponse: undefined Type list