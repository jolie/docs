# Math

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| Math documentation: |  |  |  |
| Math | - | - | [MathInterface](math.md#MathInterface) |

### List of Available Interfaces

### MathInterface <a id="MathInterface"></a>

Interface documentation:

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [random](math.md#random) | void | double |  |
| [abs](math.md#abs) | int | int |  |
| [round](math.md#round) | [RoundRequestType](math.md#RoundRequestType) | double |  |
| [pi](math.md#pi) | void | double |  |
| [pow](math.md#pow) | [PowRequest](math.md#PowRequest) | double |  |
| [summation](math.md#summation) | [SummationRequest](math.md#SummationRequest) | int |  |

## Operation Description

### random <a id="random"></a>

Operation documentation: Returns a random number d such that 0.0 &lt;= d &lt; 1.0.

Invocation template:

```jolie
random@Math( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: double

`double : double`

### abs <a id="abs"></a>

Operation documentation: Returns the absolute value of the input integer.

Invocation template:

```jolie
abs@Math( request )( response )
```

#### Request type

Type: int

`int : int`

#### Response type

Type: int

`int : int`

### round <a id="round"></a>

Operation documentation: Returns the PI constant

Invocation template:

```jolie
round@Math( request )( response )
```

#### Request type <a id="RoundRequestType"></a>

Type: RoundRequestType

```jolie
type RoundRequestType: double {
    .decimals?: int
}
```

`RoundRequestType : double`

* `decimals : int`

#### Response type

Type: double

`double : double`

### pi <a id="pi"></a>

Operation documentation: Returns the PI constant

Invocation template:

```jolie
pi@Math( request )( response )
```

#### Request type

Type: void

`void : void`

#### Response type

Type: double

`double : double`

### pow <a id="pow"></a>

Operation documentation: Returns the result of .base to the power of .exponent \(see request data type\).

Invocation template:

```jolie
pow@Math( request )( response )
```

#### Request type <a id="PowRequest"></a>

Type: PowRequest

```jolie
type PowRequest: void {
    .base: double
    .exponent: double
}
```

`PowRequest : void`

* `base : double`
* `exponent : double`

#### Response type

Type: double

`double : double`

### summation <a id="summation"></a>

Operation documentation: Returns the summation of values from .from to .to \(see request data type\). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14.

Invocation template:

```jolie
summation@Math( request )( response )
```

#### Request type <a id="SummationRequest"></a>

Type: SummationRequest

```jolie
type SummationRequest: void {
    .from: int
    .to: int
}
```

`SummationRequest : void`

* `from : int`
* `to : int`

#### Response type

Type: int

`int : int`

