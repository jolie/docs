# JolieDoc for Port UriTemplates #

## From file `uri_templates.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>UriTemplates</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  UriTemplatesIface 

--------------------

## Interface UriTemplatesIface ##

WARNING: the API of this service is experimental. Use it at your own risk.

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">expand</a></td>
   <td><a rel="nofollow">ExpandRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">match</a></td>
   <td><a rel="nofollow">UriMatchRequest</a><br></td>
   <td>MatchResponse<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### expand ###

    expand( ExpandRequest )( string )

### match ###

    match( UriMatchRequest )( MatchResponse )

--------------------

## Message type list ##

### ExpandRequest ###

    type ExpandRequest: void { 
        .template: string
        .params?: undefined
    }

### UriMatchRequest ###

    type UriMatchRequest: void { 
        .template: string
        .uri: string
    }

### MatchResponse ###

    type MatchResponse: undefined Type list undefined type undefined: undefined