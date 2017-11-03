# JolieDoc for Port SemaphoreUtils #

## From file `semaphore_utils.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>SemaphoreUtils</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  SemaphoreUtilsInterface 

--------------------

## Interface SemaphoreUtilsInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">acquire</a></td>
   <td><a rel="nofollow">SemaphoreRequest</a><br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
  <tr>
   <td><a rel="nofollow">release</a></td>
   <td><a rel="nofollow">SemaphoreRequest</a><br></td>
   <td>bool<br></td>
   <td></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### release ###

    release( SemaphoreRequest )( bool )

Releases permits to a semaphore.  
If there exists no semaphore with the given ".name", "release" creates a  
new semaphore with that name and as many permits as indicated in ".permits".  
The default behaviour when value ".permits" is absent is to release one permit.

### acquire ###

    acquire( SemaphoreRequest )( bool )

Acquires permits from a semaphore.  
If there exists no semaphore with the given ".name", "acquire" creates a  
new semaphore with 0 permits with that name.  
The operation returns a response when a new permit is released (see operation "release").  
The default behaviour when value ".permits" is absent is to acquire one permit.

--------------------

## Message type list ##

### SemaphoreRequest ###

    type SemaphoreRequest: void { 
        .permits?: int
        .name: string
    }

--------------------

## Type list ##