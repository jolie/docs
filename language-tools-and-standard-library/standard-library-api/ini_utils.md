# IniUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| IniUtils documentation: |  |  |  |
| IniUtils | - | - | [IniUtilsInterface](ini_utils.md#IniUtilsInterface) |

### List of Available Interfaces

### IniUtilsInterface <a id="IniUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [parseIniFile](ini_utils.md#parseIniFile) | [parseIniFileRequest](ini_utils.md#parseIniFileRequest) | [IniData](ini_utils.md#IniData) |  |

## Operation Description

### parseIniFile <a id="parseIniFile"></a>

Operation documentation:

Invocation template:

```jolie
parseIniFile@IniUtils( request )( response )
```

#### Request type <a id="parseIniFileRequest"></a>

Type: parseIniFileRequest

```jolie
type parseIniFileRequest: string {
    .charset?: string
}
```

`parseIniFileRequest : string`

* `charset : string`

#### Response type <a id="IniData"></a>

Type: IniData

```jolie
type IniData: undefined
```

`IniData : void`

