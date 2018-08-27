# ConsoleInputPort

## From file `console.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| ConsoleInputPort | local | null |

## List of the available interfaces

* [ConsoleInputInterface](consoleinputport.md#ConsoleInputInterface)

## Interface ConsoleInputInterface {#ConsoleInputInterface}

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [in](consoleinputport.md#in) | [InRequest](consoleinputport.md#InRequest)  |   |   |

## Operation list

### in {#in}

in\( InRequest \)

## Message type list

### InRequest {#InRequest}

```text
type InRequest: string { 
    .token?: string
}
```

## Type list

