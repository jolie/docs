# JolieDoc for Port MetaJolie #

## From file `metajolie.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>MetaJolie</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  MetaJolieInterface 

--------------------

## Interface MetaJolieInterface ##

WARNING: the API of this service is experimental. Use it at your own risk.

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">checkNativeType</a></td>
   <td><a rel="nofollow">CheckNativeTypeRequest</a><br></td>
   <td><a rel="nofollow">CheckNativeTypeResponse</a><br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getInputPortMetaData</a></td>
   <td><a rel="nofollow">GetInputPortMetaDataRequest</a><br></td>
   <td><a rel="nofollow">GetInputPortMetaDataResponse</a><br></td>
   <td>ParserException( <a rel="nofollow">ParserExceptionType</a> )&nbsp;&nbsp;<br>InputPortMetaDataFault,&nbsp;<br>SemanticException( <a rel="nofollow">SemanticExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getMetaData</a></td>
   <td><a rel="nofollow">GetMetaDataRequest</a><br></td>
   <td><a rel="nofollow">GetMetaDataResponse</a><br></td>
   <td>ParserException( <a rel="nofollow">ParserExceptionType</a> )&nbsp;&nbsp;<br>SemanticException( <a rel="nofollow">SemanticExceptionType</a> )&nbsp;&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">messageTypeCast</a></td>
   <td><a rel="nofollow">MessageTypeCastRequest</a><br></td>
   <td><a rel="nofollow">MessageTypeCastResponse</a><br></td>
   <td>TypeMismatch,&nbsp;<br></td>
  </tr>
  <tr>
   <td><a rel="nofollow">parseRoles</a></td>
   <td><a rel="nofollow">ParseRoleRequest</a><br></td>
   <td><a rel="nofollow">Role</a><br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### getInputPortMetaData ###

    getInputPortMetaData( GetInputPortMetaDataRequest )( GetInputPortMetaDataResponse ) throws
    				ParserException( ParserExceptionType )
    				InputPortMetaDataFault
    				SemanticException( SemanticExceptionType )

### parseRoles ###

    parseRoles( ParseRoleRequest )( Role )

### getMetaData ###

    getMetaData( GetMetaDataRequest )( GetMetaDataResponse ) throws
    				ParserException( ParserExceptionType )
    				SemanticException( SemanticExceptionType )

### messageTypeCast ###

    messageTypeCast( MessageTypeCastRequest )( MessageTypeCastResponse ) throws
    				TypeMismatch

### checkNativeType ###

    checkNativeType( CheckNativeTypeRequest )( CheckNativeTypeResponse )

--------------------

## Message type list ##

### GetInputPortMetaDataRequest ###

    type GetInputPortMetaDataRequest: void { 
        .filename: string
        .name: Name
    }

### GetInputPortMetaDataResponse ###

    type GetInputPortMetaDataResponse: void { 
        .input*: Participant
    }

### ParserExceptionType ###

    type ParserExceptionType: void { 
        .line: int
        .sourceName: string
        .message: string
    }

### SemanticExceptionType ###

    type SemanticExceptionType: void { 
        .error*: void { 
            .line: int
            .sourceName: string
            .message: string
        }
    }

### ParseRoleRequest ###

    type ParseRoleRequest: void { 
        .filename: string
        .rolename: Name
    }

### Role ###

    type Role: void { 
        .output?: Participant
        .input: Participant
        .name: Name
        .conversation*: Conversation
    }

### GetMetaDataRequest ###

    type GetMetaDataRequest: void { 
        .filename: string
        .name: Name
    }

### GetMetaDataResponse ###

    type GetMetaDataResponse: void { 
        .output*: Participant
        .input*: Participant
        .interfaces*: Interface
        .types*: Type
        .service: Service
        .embeddedServices*: void { 
            .servicepath: string
            .type: string
            .portId: string
        }
    }

### MessageTypeCastRequest ###

    type MessageTypeCastRequest: void { 
        .types: void { 
            .types*: Type
            .messageTypeName: Name
        }
        .message: undefined
    }

### MessageTypeCastResponse ###

    type MessageTypeCastResponse: void { 
        .message: undefined
    }

### CheckNativeTypeRequest ###

    type CheckNativeTypeRequest: void { 
        .type_name: string
    }

### CheckNativeTypeResponse ###

    type CheckNativeTypeResponse: void { 
        .result: bool
    }

--------------------

## Type list ##

### Name ###

    type Name: void { 
        .registry?: string
        .domain?: string
        .name: string
    }

### Participant ###

    type Participant: void { 
        .protocol: string
        .interfaces*: Interface
        .name: Name
        .location: any
    }

### Interface ###

    type Interface: void { 
        .types*: Type
        .operations*: Operation
        .name: Name
    }

### Type ###

    type Type: void { 
        .root_type: NativeType
        .sub_type*: SubType
        .name: Name
    }

### NativeType ###

    type NativeType: void { 
        .string_type?: bool
        .void_type?: bool
        .raw_type?: bool
        .int_type?: bool
        .any_type?: bool
        .link?: void { 
            .domain?: string
            .name: string
        }
        .bool_type?: bool
        .double_type?: bool
        .long_type?: bool
    }

### SubType ###

    type SubType: void { 
        .type_inline?: Type
        .name: string
        .cardinality: Cardinality
        .type_link?: Name
    }

### Cardinality ###

    type Cardinality: void { 
        .min: int
        .max?: int
        .infinite?: int
    }

### Operation ###

    type Operation: void { 
        .operation_name: string
        .output?: Name
        .input: Name
        .documentation?: any
        .fault*: Fault
    }

### Fault ###

    type Fault: void { 
        .type_name?: Name
        .name: Name
    }

### Conversation ###

    type Conversation: void { 
        .participant_type: void { 
            .is_input?: int
            .is_output?: int
        }
        .operation: string
    }

### Service ###

    type Service: void { 
        .output*: Name
        .input*: void { 
            .domain: string
            .name: string
        }
        .name: Name
    }

### undefined ###

    type undefined: undefined