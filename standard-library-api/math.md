# Math

## From file `math.iol`

| Port Name | Location | Protocol |
| --- | --- |
| Math |  |  |

## List of the available interfaces

* [MathInterface](math.md#MathInterface)

## Interface MathInterface {#MathInterface}

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- | --- | --- |
| [abs](math.md#abs) | int  | int  |  |
| [pi](math.md#pi) | void  | double  |  |
| [pow](math.md#pow) | [PowRequest](math.md#PowRequest)  | double  |  |
| [random](math.md#random) | void  | double  |  |
| [round](math.md#round) | [RoundRequestType](math.md#RoundRequestType)  | double  |  |
| [summation](math.md#summation) | [SummationRequest](math.md#SummationRequest)  | int  |  |

## Operation list

### random {#random}

```text
random( void )( double )
```

Returns a random number d such that 0.0

### abs {#abs}

```text
abs( int )( int )
```

Returns the absolute value of the input integer.

### round {#round}

```text
round( RoundRequestType )( double )
```

### pi {#pi}

```text
pi( void )( double )
```

Returns the PI constant

### pow {#pow}

```text
pow( PowRequest )( double )
```

Returns the result of .base to the power of .exponent \(see request data type\).

### summation {#summation}

```text
summation( SummationRequest )( int )
```

Returns the summation of values from .from to .to \(see request data type\). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14.

## Message type list

### RoundRequestType {#RoundRequestType}

```text
type RoundRequestType: double { 
    .decimals?: int
}
```

### PowRequest {#PowRequest}

```text
type PowRequest: void { 
    .base: double
    .exponent: double
}
```

### SummationRequest {#SummationRequest}

```text
type SummationRequest: void { 
    .from: int
    .to: int
}
```

## Type list

