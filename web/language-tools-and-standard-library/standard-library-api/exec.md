# Exec

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Exec documentation: |  |  |  |
| Exec | - | - | [ExecInterface](exec.md#ExecInterface) |

### List of Available Interfaces

### ExecInterface <a id="ExecInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [exec](exec.md#exec) | [CommandExecutionRequest](exec.md#CommandExecutionRequest) | [CommandExecutionResult](exec.md#CommandExecutionResult) |  |

## Operation Description

### exec <a id="exec"></a>

Operation documentation:

Invocation template:

```jolie
exec@Exec( request )( response )
```

#### Request type <a id="CommandExecutionRequest"></a>

Type: CommandExecutionRequest

```jolie
type CommandExecutionRequest: string {
    .args*: string
    .workingDirectory?: string
    .stdOutConsoleEnable?: bool
    .waitFor?: int
}
```

`CommandExecutionRequest : string`

* `args : string`
* `workingDirectory : string`
* `stdOutConsoleEnable : bool`
* `waitFor : int`

#### Response type <a id="CommandExecutionResult"></a>

Type: CommandExecutionResult

```jolie
type CommandExecutionResult: any {
    .exitCode?: int
    .stderr?: string
}
```

`CommandExecutionResult : any`

* `exitCode : int`
* `stderr : string`

