# Exec

## From file `exec.iol`

| Port Name | Location | Protocol |
| --- | --- |
| Exec |  |  |

## List of the available interfaces

* [ExecInterface](exec.md#ExecInterface)

## Interface ExecInterface {#ExecInterface}

| Heading | Input type | Output type | Faults |
| --- | --- |
| [exec](exec.md#exec) | [CommandExecutionRequest](exec.md#CommandExecutionRequest)  | [CommandExecutionResult](exec.md#CommandExecutionResult)  |  |

## Operation list

### exec {#exec}

```text
exec( CommandExecutionRequest )( CommandExecutionResult )
```

## Message type list

### CommandExecutionRequest {#CommandExecutionRequest}

```text
type CommandExecutionRequest: string { 
    .args*: string
    .workingDirectory?: string
    .stdOutConsoleEnable?: bool
    .waitFor?: int
}
```

### CommandExecutionResult {#CommandExecutionResult}

```text
type CommandExecutionResult: any { 
    .exitCode?: int
    .stderr?: string
}
```

## Type list

