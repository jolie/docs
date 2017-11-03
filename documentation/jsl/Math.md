# JolieDoc for Port Math #

## From file `math.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Math</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  MathInterface 

--------------------

## Interface MathInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">abs</a></td>
   <td>int<br></td>
   <td>int<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">pi</a></td>
   <td>void<br></td>
   <td>double<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">pow</a></td>
   <td><a rel="nofollow">PowRequest</a><br></td>
   <td>double<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">random</a></td>
   <td>void<br></td>
   <td>double<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">round</a></td>
   <td><a rel="nofollow">RoundRequestType</a><br></td>
   <td>double<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">summation</a></td>
   <td><a rel="nofollow">SummationRequest</a><br></td>
   <td>int<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### random ###

    random( void )( double )

Returns a random number d such that 0.0 <= d < 1.0.

### abs ###

    abs( int )( int )

Returns the absolute value of the input integer.

### round ###

    round( RoundRequestType )( double )

### pi ###

    pi( void )( double )

Returns the PI constant

### pow ###

    pow( PowRequest )( double )

Returns the result of .base to the power of .exponent (see request data type).

### summation ###

    summation( SummationRequest )( int )

Returns the summation of values from .from to .to (see request data type). For example, .from=2 and .to=5 would produce a return value of 2+3+4+5=14.

--------------------

## Message type list ##

### RoundRequestType ###

    type RoundRequestType: double { 
        .decimals?: int
    }

### PowRequest ###

    type PowRequest: void { 
        .base: double
        .exponent: double
    }

### SummationRequest ###

    type SummationRequest: void { 
        .from: int
        .to: int
    }

--------------------

## Type list ##