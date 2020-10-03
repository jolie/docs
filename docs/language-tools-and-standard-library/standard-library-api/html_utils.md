# HTMLUtils

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| HTMLUtils documentation: |  |  |  |
| HTMLUtils | - | - | [HTMLUtilsInterface](html_utils.md#HTMLUtilsInterface) |

### List of Available Interfaces

### HTMLUtilsInterface <a id="HTMLUtilsInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [escapeHTML](html_utils.md#escapeHTML) | string | string |  |
| [unescapeHTML](html_utils.md#unescapeHTML) | string | string |  |

## Operation Description

### escapeHTML <a id="escapeHTML"></a>

Operation documentation:

Invocation template:

```jolie
escapeHTML@HTMLUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

### unescapeHTML <a id="unescapeHTML"></a>

Operation documentation:

Invocation template:

```jolie
unescapeHTML@HTMLUtils( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

