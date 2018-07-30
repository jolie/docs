# StringUtils

## From file `string_utils.iol`

| Port Name | Location | Protocol |
| --- | --- |
| StringUtils |  |  |

## List of the available interfaces

* [StringUtilsInterface](stringutils.md#StringUtilsInterface)

## Interface StringUtilsInterface {#StringUtilsInterface}

 An interface for supporting string manipulation operations.

| Heading | Input type | Output type | Faults |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [contains](stringutils.md#contains) | [ContainsRequest](stringutils.md#ContainsRequest)  | bool  |  |
| [endsWith](stringutils.md#endsWith) | [EndsWithRequest](stringutils.md#EndsWithRequest)  | bool  |  |
| [find](stringutils.md#find) | [MatchRequest](stringutils.md#MatchRequest)  | [MatchResult](stringutils.md#MatchResult)  |  |
| [getRandomUUID](stringutils.md#getRandomUUID) | void  | string  |  |
| [indexOf](stringutils.md#indexOf) | [IndexOfRequest](stringutils.md#IndexOfRequest)  | IndexOfResponse  |  |
| [join](stringutils.md#join) | [JoinRequest](stringutils.md#JoinRequest)  | string  |  |
| [leftPad](stringutils.md#leftPad) | [PadRequest](stringutils.md#PadRequest)  | string  |  |
| [length](stringutils.md#length) | string  | int  |  |
| [match](stringutils.md#match) | [MatchRequest](stringutils.md#MatchRequest)  | [MatchResult](stringutils.md#MatchResult)  |  |
| [replaceAll](stringutils.md#replaceAll) | [ReplaceRequest](stringutils.md#ReplaceRequest)  | string  |  |
| [replaceFirst](stringutils.md#replaceFirst) | [ReplaceRequest](stringutils.md#ReplaceRequest)  | string  |  |
| [rightPad](stringutils.md#rightPad) | [PadRequest](stringutils.md#PadRequest)  | string  |  |
| [sort](stringutils.md#sort) | [StringItemList](stringutils.md#StringItemList)  | [StringItemList](stringutils.md#StringItemList)  |  |
| [split](stringutils.md#split) | [SplitRequest](stringutils.md#SplitRequest)  | [SplitResult](stringutils.md#SplitResult)  |  |
| [splitByLength](stringutils.md#splitByLength) | [SplitByLengthRequest](stringutils.md#SplitByLengthRequest)  | [SplitResult](stringutils.md#SplitResult)  |  |
| [startsWith](stringutils.md#startsWith) | [StartsWithRequest](stringutils.md#StartsWithRequest)  | bool  |  |
| [substring](stringutils.md#substring) | [SubStringRequest](stringutils.md#SubStringRequest)  | string  |  |
| [toLowerCase](stringutils.md#toLowerCase) | string  | string  |  |
| [toUpperCase](stringutils.md#toUpperCase) | string  | string  |  |
| [trim](stringutils.md#trim) | string  | string  |  |
| [valueToPrettyString](stringutils.md#valueToPrettyString) | undefined  | string  |  |

## Operation list

### leftPad {#leftPad}

```text
leftPad( PadRequest )( string )
```

### valueToPrettyString {#valueToPrettyString}

```text
valueToPrettyString( undefined )( string )
```

### toLowerCase {#toLowerCase}

```text
toLowerCase( string )( string )
```

### length {#length}

```text
length( string )( int )
```

### match {#match}

```text
match( MatchRequest )( MatchResult )
```

### replaceFirst {#replaceFirst}

```text
replaceFirst( ReplaceRequest )( string )
```

### sort {#sort}

```text
sort( StringItemList )( StringItemList )
```

### replaceAll {#replaceAll}

```text
replaceAll( ReplaceRequest )( string )
```

### substring {#substring}

```text
substring( SubStringRequest )( string )
```

### getRandomUUID {#getRandomUUID}

```text
getRandomUUID( void )( string )
```

it returns a random UUID

### rightPad {#rightPad}

```text
rightPad( PadRequest )( string )
```

### contains {#contains}

```text
contains( ContainsRequest )( bool )
```

Returns true if the string contains .substring

### split {#split}

```text
split( SplitRequest )( SplitResult )
```

### splitByLength {#splitByLength}

```text
splitByLength( SplitByLengthRequest )( SplitResult )
```

### trim {#trim}

```text
trim( string )( string )
```

### find {#find}

```text
find( MatchRequest )( MatchResult )
```

### endsWith {#endsWith}

```text
endsWith( EndsWithRequest )( bool )
```

checks if a string ends with a given suffix

### toUpperCase {#toUpperCase}

```text
toUpperCase( string )( string )
```

### join {#join}

```text
join( JoinRequest )( string )
```

### indexOf {#indexOf}

```text
indexOf( IndexOfRequest )( IndexOfResponse )
```

### startsWith {#startsWith}

```text
startsWith( StartsWithRequest )( bool )
```

checks if the passed string starts with a given prefix

## Message type list

### PadRequest {#PadRequest}

```text
type PadRequest: string { 
    .length: int
    .char: string
}
```

### MatchRequest {#MatchRequest}

```text
type MatchRequest: string { 
    .regex: string
}
```

### MatchResult {#MatchResult}

```text
type MatchResult: int { 
    .group*: string
}
```

### ReplaceRequest {#ReplaceRequest}

```text
type ReplaceRequest: string { 
    .regex: string
    .replacement: string
}
```

### StringItemList {#StringItemList}

```text
type StringItemList: void { 
    .item*: string
}
```

### SubStringRequest {#SubStringRequest}

```text
type SubStringRequest: string { 
    .end: int
    .begin: int
}
```

### ContainsRequest {#ContainsRequest}

```text
type ContainsRequest: string { 
    .substring: string
}
```

### SplitRequest {#SplitRequest}

```text
type SplitRequest: string { 
    .regex: string
    .limit?: int
}
```

### SplitResult {#SplitResult}

```text
type SplitResult: void { 
    .result*: string
}
```

### SplitByLengthRequest {#SplitByLengthRequest}

```text
type SplitByLengthRequest: string { 
    .length: int
}
```

### EndsWithRequest {#EndsWithRequest}

```text
type EndsWithRequest: string { 
    .suffix: string
}
```

### JoinRequest {#JoinRequest}

```text
type JoinRequest: void { 
    .piece*: string
    .delimiter: string
}
```

### IndexOfRequest {#IndexOfRequest}

```text
type IndexOfRequest: string { 
    .word: string
}
```

### IndexOfResponse {#IndexOfResponse}

```text
type IndexOfResponse: int
```

### StartsWithRequest {#StartsWithRequest}

```text
type StartsWithRequest: string { 
    .prefix: string
}
```

## Type list

