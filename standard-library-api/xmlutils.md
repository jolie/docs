# XmlUtils

## From file `xml_utils.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| XmlUtils |  |  |

## List of the available interfaces

* [XmlUtilsInterface](xmlutils.md#XmlUtilsInterface)

## Interface XmlUtilsInterface {#XmlUtilsInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [transform](xmlutils.md#transform) | [XMLTransformationRequest](xmlutils.md#XMLTransformationRequest)  | string  |  TransformerException\( [JavaExceptionType](xmlutils.md#JavaExceptionType) \)    |
| [valueToXml](xmlutils.md#valueToXml) | [ValueToXmlRequest](xmlutils.md#ValueToXmlRequest)  | string  |  IOException\( [IOExceptionType](xmlutils.md#IOExceptionType) \)    |
| [xmlToValue](xmlutils.md#xmlToValue) | [XMLToValueRequest](xmlutils.md#XMLToValueRequest)  | undefined  |  IOException\( [IOExceptionType](xmlutils.md#IOExceptionType) \)    |

## Operation list

### xmlToValue {#xmlToValue}

```text
xmlToValue( XMLToValueRequest )( undefined )
 throws


IOException( IOExceptionType )
```

Transforms the base value in XML format \(data types string, raw\) into a Jolie value  
  
 The XML root node will be discarded, the rest gets converted recursively

### transform {#transform}

```text
transform( XMLTransformationRequest )( string )
 throws


TransformerException( JavaExceptionType )
```

### valueToXml {#valueToXml}

```text
valueToXml( ValueToXmlRequest )( string )
 throws


IOException( IOExceptionType )
```

Transforms the value contained within the root node into an xml string.  
  
 The base value of ValueToXmlRequest.root will be discarded, the rest gets converted recursively

## Message type list

### XMLToValueRequest {#XMLToValueRequest}

```text
type XMLToValueRequest: any { 
    .options?: void { 
        .charset?: string
        .includeAttributes?: bool
        .schemaLanguage?: string
        .schemaUrl?: string
    }
}
```

### IOExceptionType {#IOExceptionType}

```text
type IOExceptionType: JavaExceptionType
```

### XMLTransformationRequest {#XMLTransformationRequest}

```text
type XMLTransformationRequest: void { 
    .source: string
    .xslt: string
}
```

### JavaExceptionType {#JavaExceptionType}

```text
type JavaExceptionType: string { 
    .stackTrace: string
}
```

### ValueToXmlRequest {#ValueToXmlRequest}

```text
type ValueToXmlRequest: void { 
    .omitXmlDeclaration?: bool
    .indent?: bool
    .plain?: bool
    .root: undefined
    .rootNodeName: string
}
```

## Type list

