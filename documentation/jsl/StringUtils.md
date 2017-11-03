# JolieDoc for Port StringUtils #

## From file `string_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>StringUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  StringUtilsInterface 

--------------------

## Interface StringUtilsInterface ##

An interface for supporting string manipulation operations.

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">contains</a></td>
   <td><a rel="nofollow">ContainsRequest</a><br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">endsWith</a></td>
   <td><a rel="nofollow">EndsWithRequest</a><br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">find</a></td>
   <td><a rel="nofollow">MatchRequest</a><br></td>
   <td><a rel="nofollow">MatchResult</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getRandomUUID</a></td>
   <td>void<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">indexOf</a></td>
   <td><a rel="nofollow">IndexOfRequest</a><br></td>
   <td>IndexOfResponse<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">join</a></td>
   <td><a rel="nofollow">JoinRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">leftPad</a></td>
   <td><a rel="nofollow">PadRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">length</a></td>
   <td>string<br></td>
   <td>int<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">match</a></td>
   <td><a rel="nofollow">MatchRequest</a><br></td>
   <td><a rel="nofollow">MatchResult</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">replaceAll</a></td>
   <td><a rel="nofollow">ReplaceRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">replaceFirst</a></td>
   <td><a rel="nofollow">ReplaceRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">rightPad</a></td>
   <td><a rel="nofollow">PadRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">sort</a></td>
   <td><a rel="nofollow">StringItemList</a><br></td>
   <td><a rel="nofollow">StringItemList</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">split</a></td>
   <td><a rel="nofollow">SplitRequest</a><br></td>
   <td><a rel="nofollow">SplitResult</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">splitByLength</a></td>
   <td><a rel="nofollow">SplitByLengthRequest</a><br></td>
   <td><a rel="nofollow">SplitResult</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">startsWith</a></td>
   <td><a rel="nofollow">StartsWithRequest</a><br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">substring</a></td>
   <td><a rel="nofollow">SubStringRequest</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">toLowerCase</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">toUpperCase</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">trim</a></td>
   <td>string<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">valueToPrettyString</a></td>
   <td>undefined<br></td>
   <td>string<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### leftPad ###

    leftPad( PadRequest )( string )

### valueToPrettyString ###

    valueToPrettyString( undefined )( string )

### toLowerCase ###

    toLowerCase( string )( string )

### length ###

    length( string )( int )

### match ###

    match( MatchRequest )( MatchResult )

### replaceFirst ###

    replaceFirst( ReplaceRequest )( string )

### sort ###

    sort( StringItemList )( StringItemList )

### replaceAll ###

    replaceAll( ReplaceRequest )( string )

### substring ###

    substring( SubStringRequest )( string )

### getRandomUUID ###

    getRandomUUID( void )( string )

it returns a random UUID

### rightPad ###

    rightPad( PadRequest )( string )

### contains ###

    contains( ContainsRequest )( bool )

Returns true if the string contains .substring

### split ###

    split( SplitRequest )( SplitResult )

### splitByLength ###

    splitByLength( SplitByLengthRequest )( SplitResult )

### trim ###

    trim( string )( string )

### find ###

    find( MatchRequest )( MatchResult )

### endsWith ###

    endsWith( EndsWithRequest )( bool )

checks if a string ends with a given suffix

### toUpperCase ###

    toUpperCase( string )( string )

### join ###

    join( JoinRequest )( string )

### indexOf ###

    indexOf( IndexOfRequest )( IndexOfResponse )

### startsWith ###

    startsWith( StartsWithRequest )( bool )

checks if the passed string starts with a given prefix

--------------------

## Message type list ##

### PadRequest ###

    type PadRequest: string { 
        .length: int
        .char: string
    }

### MatchRequest ###

    type MatchRequest: string { 
        .regex: string
    }

### MatchResult ###

    type MatchResult: int { 
        .group*: string
    }

### ReplaceRequest ###

    type ReplaceRequest: string { 
        .regex: string
        .replacement: string
    }

### StringItemList ###

    type StringItemList: void { 
        .item*: string
    }

### SubStringRequest ###

    type SubStringRequest: string { 
        .end: int
        .begin: int
    }

### ContainsRequest ###

    type ContainsRequest: string { 
        .substring: string
    }

### SplitRequest ###

    type SplitRequest: string { 
        .regex: string
        .limit?: int
    }

### SplitResult ###

    type SplitResult: void { 
        .result*: string
    }

### SplitByLengthRequest ###

    type SplitByLengthRequest: string { 
        .length: int
    }

### EndsWithRequest ###

    type EndsWithRequest: string { 
        .suffix: string
    }

### JoinRequest ###

    type JoinRequest: void { 
        .piece*: string
        .delimiter: string
    }

### IndexOfRequest ###

    type IndexOfRequest: string { 
        .word: string
    }

### IndexOfResponse ###

    type IndexOfResponse: int StartsWithRequest type StartsWithRequest: string { 
        .prefix: string
    } Type list