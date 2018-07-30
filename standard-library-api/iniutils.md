# IniUtils

## From file `ini_utils.iol`

| Port Name | Location | Protocol |
| --- | --- |
| IniUtils |  |  |

## List of the available interfaces

* [IniUtilsInterface](iniutils.md#IniUtilsInterface)

## Interface IniUtilsInterface {#IniUtilsInterface}

| Heading | Input type | Output type | Faults |
| --- | --- |
| [parseIniFile](iniutils.md#parseIniFile) | [parseIniFileRequest](iniutils.md#parseIniFileRequest)  | IniData  |  |

## Operation list

### parseIniFile {#parseIniFile}

```text
parseIniFile( parseIniFileRequest )( IniData )
```

## Message type list

### parseIniFileRequest {#parseIniFileRequest}

```text
type parseIniFileRequest: string { 
    .charset?: string
}
```

### IniData {#IniData}

```text
type IniData: undefined
```

## Type list

