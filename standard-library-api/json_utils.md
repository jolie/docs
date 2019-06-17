# JsonUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| JsonUtils documentation: |  |  |  |
| JsonUtils | - | - | [JsonUtilsInterface](json_utils.md#JsonUtilsInterface) |

### List of Available Interfaces

### JsonUtilsInterface <a id="JsonUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [getJsonString](json_utils.md#getJsonString) | [GetJsonStringRequest](json_utils.md#GetJsonStringRequest) | GetJsonStringResponse |  JSONCreationError\( undefined \) |
| [getJsonValue](json_utils.md#getJsonValue) | [GetJsonValueRequest](json_utils.md#GetJsonValueRequest) | [GetJsonValueResponse](json_utils.md#GetJsonValueResponse) |  JSONCreationError\( undefined \) |

## Operation Description

### getJsonString <a id="getJsonString"></a>

Operation documentation: Returns the value converted into a JSON string

```text
  Each child value corresponds to an attribute, the base values are saved as the default values (attribute "$" or singular value), the "_" helper childs disappear (e.g. a._[i]._[j] -> a[i][j]), the rest gets converted recursively
```

Invocation template:

```text
getJsonString@JsonUtils( request )( response )
```

#### Request type <a id="GetJsonStringRequest"></a>

Type: GetJsonStringRequest

```text
type GetJsonStringRequest: undefined
```

`GetJsonStringRequest : any`

#### Response type

Type: GetJsonStringResponse

`GetJsonStringResponse : string`

#### Possible faults thrown

Fault `JSONCreationError` with type `undefined`

Fault-handling install template:

```text
install ( JSONCreationError => /* error-handling code */ )
```

### getJsonValue <a id="getJsonValue"></a>

Operation documentation: Returns the JSON string converted into a value

```text
  Each attribute corresponds to a child value, the default values (attribute "$" or singular value) are saved as the base values, nested arrays get mapped with the "_" helper childs (e.g. a[i][j] -> a._[i]._[j]), the rest gets converted recursively
```

Invocation template:

```text
getJsonValue@JsonUtils( request )( response )
```

#### Request type <a id="GetJsonValueRequest"></a>

Type: GetJsonValueRequest

```text
type GetJsonValueRequest: any {
    .strictEncoding?: bool
    .charset?: string
}
```

`GetJsonValueRequest : any`

* `strictEncoding : bool`
* `charset : string`

#### Response type <a id="GetJsonValueResponse"></a>

Type: GetJsonValueResponse

```text
type GetJsonValueResponse: undefined
```

`GetJsonValueResponse : any`

#### Possible faults thrown

Fault `JSONCreationError` with type `undefined`

Fault-handling install template:

```text
install ( JSONCreationError => /* error-handling code */ )
```

