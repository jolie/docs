# JolieDoc for Port Parser #

## From file `metaparser.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>Parser</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  ParserInterface 

--------------------

## Interface ParserInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">getCardinality</a></td>
   <td><a rel="nofollow">Cardinality</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getInterface</a></td>
   <td><a rel="nofollow">Interface</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getNativeType</a></td>
   <td><a rel="nofollow">NativeType</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getParticipantInput</a></td>
   <td><a rel="nofollow">Participant</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getParticipantOutput</a></td>
   <td><a rel="nofollow">Participant</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getSubType</a></td>
   <td><a rel="nofollow">SubType</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getSurface</a></td>
   <td><a rel="nofollow">Participant</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getSurfaceWithoutOutputPort</a></td>
   <td><a rel="nofollow">Participant</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getType</a></td>
   <td><a rel="nofollow">Type</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">getTypeInLine</a></td>
   <td><a rel="nofollow">Type</a><br></td>
   <td>string<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### getSurface ###

    getSurface( Participant )( string )

### getNativeType ###

    getNativeType( NativeType )( string )

### getInterface ###

    getInterface( Interface )( string )

### getTypeInLine ###

    getTypeInLine( Type )( string )

### getSurfaceWithoutOutputPort ###

    getSurfaceWithoutOutputPort( Participant )( string )

### getType ###

    getType( Type )( string )

### getParticipantOutput ###

    getParticipantOutput( Participant )( string )

### getSubType ###

    getSubType( SubType )( string )

### getParticipantInput ###

    getParticipantInput( Participant )( string )

### getCardinality ###

    getCardinality( Cardinality )( string )

--------------------

## Message type list ##

### Participant ###

    type Participant: void { 
        .protocol: string
        .interfaces*: Interface
        .name: Name
        .location: any
    }

--------------------

## Type list ##

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

### Name ###

    type Name: void { 
        .registry?: string
        .domain?: string
        .name: string
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