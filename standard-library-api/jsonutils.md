# JsonUtils

## From file `json_utils.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| JsonUtils |  |  |

## List of the available interfaces

* [JsonUtilsInterface](jsonutils.md#JsonUtilsInterface)

## Interface JsonUtilsInterface {#JsonUtilsInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [getJsonString](jsonutils.md#getJsonString) | GetJsonStringRequest  | GetJsonStringResponse  |  JSONCreationError,   |
| [getJsonValue](jsonutils.md#getJsonValue) | [GetJsonValueRequest](jsonutils.md#GetJsonValueRequest)  | GetJsonValueResponse  |  JSONCreationError,   |

## Operation list

### getJsonString {#getJsonString}

```text
getJsonString( GetJsonStringRequest )( GetJsonStringResponse )
 throws


JSONCreationError
```

Returns the value converted into a JSON string  
  
 Each child value corresponds to an attribute, the base values are saved as the default values \(attribute "$" or singular value\), the "\_" helper childs disappear \(e.g. a.\_\[i\].\_\[j\] -&gt; a\[i\]\[j\]\), the rest gets converted recursively

### getJsonValue {#getJsonValue}

```text
getJsonValue( GetJsonValueRequest )( GetJsonValueResponse )
 throws


JSONCreationError
```

Returns the JSON string converted into a value  
  
 Each attribute corresponds to a child value, the default values \(attribute "$" or singular value\) are saved as the base values, nested arrays get mapped with the "\_" helper childs \(e.g. a\[i\]\[j\] -&gt; a.\_\[i\].\_\[j\]\), the rest gets converted recursively

## Message type list

### GetJsonStringRequest {#GetJsonStringRequest}

```text
type GetJsonStringRequest: undefined
```

### GetJsonStringResponse {#GetJsonStringResponse}

```text
type GetJsonStringResponse: string
```

### GetJsonValueRequest {#GetJsonValueRequest}

```text
type GetJsonValueRequest: any { 
    .strictEncoding?: bool
    .charset?: string
}
```

### GetJsonValueResponse {#GetJsonValueResponse}

```text
type GetJsonValueResponse: undefined
```

## Type list

