# JolieDoc for Port XmlUtils #

## From file `xml_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>XmlUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  XmlUtilsInterface 

--------------------

## Interface XmlUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">transform</a></td>
   <td><a rel="nofollow">XMLTransformationRequest</a><br></td>
   <td>string<br></td>
   <td>TransformerException( <a rel="nofollow">JavaExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">valueToXml</a></td>
   <td><a rel="nofollow">ValueToXmlRequest</a><br></td>
   <td>string<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">xmlToValue</a></td>
   <td><a rel="nofollow">XMLToValueRequest</a><br></td>
   <td>undefined<br></td>
   <td>IOException( <a rel="nofollow">IOExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### xmlToValue ###

    xmlToValue( XMLToValueRequest )( undefined ) throws
    				IOException( IOExceptionType )

Transforms the base value in XML format (data types string, raw) into a Jolie value  
  
The XML root node will be discarded, the rest gets converted recursively

### transform ###

    transform( XMLTransformationRequest )( string ) throws
    				TransformerException( JavaExceptionType )

### valueToXml ###

    valueToXml( ValueToXmlRequest )( string ) throws
    				IOException( IOExceptionType )

Transforms the value contained within the root node into an xml string.  
  
The base value of ValueToXmlRequest.root will be discarded, the rest gets converted recursively

--------------------

## Message type list ##

### XMLToValueRequest ###

    type XMLToValueRequest: any { 
        .options?: void { 
            .charset?: string
            .includeAttributes?: bool
            .schemaLanguage?: string
            .schemaUrl?: string
        }
    }

### IOExceptionType ###

    type IOExceptionType: JavaExceptionType XMLTransformationRequest type XMLTransformationRequest: void { 
        .source: string
        .xslt: string
    } JavaExceptionType type JavaExceptionType: string { 
        .stackTrace: string
    } ValueToXmlRequest type ValueToXmlRequest: void { 
        .omitXmlDeclaration?: bool
        .indent?: bool
        .plain?: bool
        .root: undefined
        .rootNodeName: string
    } Type list