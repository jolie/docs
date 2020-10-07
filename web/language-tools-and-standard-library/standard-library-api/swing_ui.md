# SwingUI

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| SwingUI documentation: |  |  |  |
| SwingUI | - | - | [UserInterface](swing_ui.md#UserInterface) |

### List of Available Interfaces

### UserInterface <a id="UserInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [showMessageDialog](swing_ui.md#showMessageDialog) | string | void |  |
| [showYesNoQuestionDialog](swing_ui.md#showYesNoQuestionDialog) | string | int |  |
| [showInputDialog](swing_ui.md#showInputDialog) | string | string |  |

## Operation Description

### showMessageDialog <a id="showMessageDialog"></a>

Operation documentation:

Invocation template:

```jolie
showMessageDialog@SwingUI( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: void

`void : void`

### showYesNoQuestionDialog <a id="showYesNoQuestionDialog"></a>

Operation documentation:

Invocation template:

```jolie
showYesNoQuestionDialog@SwingUI( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: int

`int : int`

### showInputDialog <a id="showInputDialog"></a>

Operation documentation:

Invocation template:

```jolie
showInputDialog@SwingUI( request )( response )
```

#### Request type

Type: string

`string : string`

#### Response type

Type: string

`string : string`

