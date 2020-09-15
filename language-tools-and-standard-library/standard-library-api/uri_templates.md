# UriTemplates

Inclusion code: 

| Service Deployment |  |  |  |
| :--- | :--- | :--- | :--- |
| Port Name | Location | Protocol | Interfaces |
| UriTemplates documentation: |  |  |  |
| UriTemplates | - | - | [UriTemplatesIface](uri_templates.md#UriTemplatesIface) |

### List of Available Interfaces

### UriTemplatesIface <a id="UriTemplatesIface"></a>

Interface documentation: WARNING: the API of this service is experimental. Use it at your own risk.

| Operation Name | Input Type | Output Type | Faults |
| :--- | :--- | :--- | :--- |
| [expand](uri_templates.md#expand) | [ExpandRequest](uri_templates.md#ExpandRequest) | string |  |
| [match](uri_templates.md#match) | [UriMatchRequest](uri_templates.md#UriMatchRequest) | [MatchResponse](uri_templates.md#MatchResponse) |  |

## Operation Description

### expand <a id="expand"></a>

Operation documentation:

Invocation template:

```jolie
expand@UriTemplates( request )( response )
```

#### Request type <a id="ExpandRequest"></a>

Type: ExpandRequest

```jolie
type ExpandRequest: void {
    .template: string
    .params?: undefined
}
```

`ExpandRequest : void`

* `template : string`
* `params : any`

#### Response type

Type: string

`string : string`

### match <a id="match"></a>

Operation documentation:

Invocation template:

```jolie
match@UriTemplates( request )( response )
```

#### Request type <a id="UriMatchRequest"></a>

Type: UriMatchRequest

```jolie
type UriMatchRequest: void {
    .template: string
    .uri: string
}
```

`UriMatchRequest : void`

* `template : string`
* `uri : string`

#### Response type <a id="MatchResponse"></a>

Type: MatchResponse

```jolie
type MatchResponse: undefined
```

`MatchResponse : bool`

