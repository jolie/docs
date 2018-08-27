# UriTemplates

## From file `uri_templates.iol`

| Port Name | Location | Protocol |
| :--- | :--- | :--- |
| UriTemplates |  |  |

## List of the available interfaces

* [UriTemplatesIface](uritemplates.md#UriTemplatesIface)

## Interface UriTemplatesIface {#UriTemplatesIface}

 WARNING: the API of this service is experimental. Use it at your own risk.

| Heading | Input type | Output type | Faults |
| :--- | :--- | :--- | :--- |
| [expand](uritemplates.md#expand) | [ExpandRequest](uritemplates.md#ExpandRequest)  | string  |  |
| [match](uritemplates.md#match) | [UriMatchRequest](uritemplates.md#UriMatchRequest)  | MatchResponse  |  |

## Operation list

### expand {#expand}

```text
expand( ExpandRequest )( string )
```

### match {#match}

```text
match( UriMatchRequest )( MatchResponse )
```

## Message type list

### ExpandRequest {#ExpandRequest}

```text
type ExpandRequest: void { 
    .template: string
    .params?: undefined
}
```

### UriMatchRequest {#UriMatchRequest}

```text
type UriMatchRequest: void { 
    .template: string
    .uri: string
}
```

### MatchResponse {#MatchResponse}

```text
type MatchResponse: undefined
```

## Type list

### undefined {#undefined}

```text
type undefined: undefined
```

