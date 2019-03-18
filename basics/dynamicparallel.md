# Dynamic Parallel
In Jolie, dynamic parallelism can be used for instantiating parallel activities within a service behaviour. It is achieved by using the primitive *spawn* but, differently from the [parallel](../basics/composing_statements#parallel) operator
which allows for the parallel composion of statically defined activities, the spawn primitive permits to design a set of parallel activities whose number is defined at runtime.

The syntax of the spawn follows:
```text
spawn( var over range ) in resultVar {
    spawned session
}
```
where *var* is the index variable which ranges over *range*. *resultVar* is the variable vector which will containt all the results from each spawned activity. *spawn session* represents the session code to be  executed in parallel for each spawn instantiation.

**Semantics**
The execution of a spawn statement is completed when all its spawned sessions are completed.
All the spawned sessions must be considered as common*service sessions* instantiated by the spawn primitive and executed in parallel under the following conditions:
* they cannot contain input operations, thus they cannot receive messages from an external service (with the exception of the response messages of solicit responses). 
* they can be instantiated only by means of the spawn primitive
* they cannot exploit correlation sets
* they inherit all the variable values and the outputPort declarations of the current service session which is executing the spawn
* as usual sessions, all the variables they manage are local to the scope of the spawned session
* they can exploit global variables. Note that global variables are in common to all the sessions of the service

# Example: Temperature Average 
In the following example whose code can be found at this [link](https://github.com/jolie/examples/tree/master/02_basics/9_dynamicparallel/1_temperature_average), the spawn primitive is used for collecting the temperature read from a bunch of sensors. This is the case of a IoT scenario, where several sensors are placed in different places of a building. Each sensor is modelled with a specific service called *temparature_sensor.ol* which just returns the current temperature at that node. The service *temperature_collector.ol* is a central service able to communicate with all the sensors. Each sensor registers itself to the central collector during the *init*.

![](../../.gitbook/assets/temperature_collector.png)

In the following, we report the implementation of the operation *getAverageTemperature* which exploits the primitive *spawn* for collecting the temperatures reading from the sensors.

```jolie
[ getAverageTemperature( request )( response ) {
        index = 0;
        foreach( sensor : global.sensor_hashlist ) {
            /* creates the vector for ranging over in the spawn primitive */
            sensor_vector[ index ] << global.sensor_hashlist.( sensor );
            index++
        };
        /* calling the spawn primitive */
        spawn( i over #sensor_vector ) in resultVar {
            scope( call_sensor ) {
                install( IOException =>
                    undef( global.sensor_hashlist.( sensor_vector[ i ].id ) )
                );
                Sensor.location = sensor_vector[ i ].location;
                getTemperature@Sensor()( resultVar )
            }
        }
        ;
        /* calculate the average */
        for( y = 0, y < #resultVar, y++ ) {
            total = total + resultVar[ y ]
        };
        response = total / #resultVar
    }]
```



## Advanced usage of the spawn primitive
If you need to spawn sessions which are able to receive messages from other services, please consult the service oriented pattern <a id="navlink_language_advanced_spawn">Advanced Spawn</a></li>
