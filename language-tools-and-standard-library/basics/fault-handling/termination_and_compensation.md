# Termination and Compensation

## Termination and compensation

_Termination_ and _compensation_ are mechanisms which deal with the recovery of activities.

Termination deals with the recovery of an activity that is still running.

Compensation deals with the recovery of an activity that has successfully completed its execution.

Each scope can be equipped with an error handler that contains the code to be executed for its recovery. As for fault handlers, recovery handlers can be dynamically installed by means of the `install` statement. Besides using a specific fault name, which installs the handler as a _fault handler_, the handler can refer to `this`. The term `this` refers to a _termination_ or a _recovery handler_ for the enclosing scope.

## Termination and Compensation: concepts

Each scope is equipped with a termination handler and a compensation handler by default. If no code is joint with these handlers they will never be executed. The termination handler permits to finalize a scope when it is interrupted during its execution, whereas a compensation handler permits to recover a scope which successfully finished its activities. A termination handler is automatically executed when the related scope is interrupted by a parallel activity. A compensation handler is always executed by a fault handler of the parent scope which receives that handler from the child scope when successfully finishes. The most important fact is that in Jolie, a termination handler and a compensation handler are the same with the exception that: a termination becomes a compensation handler when the related scope finishes with success.

Let us clarify a little but more these concepts with the help of Fig 1. The diagram displays a scenario in which a scope A contains an activity that executes:

* an activity _P_;
* the scope _B_;
* the scope _C_.

Let us suppose that _C_ finishes its execution. As a result, its compensation handler is promoted at the level of its parent's compensation handler \(1\). Afterwards, if _P_ rises a fault _f_ while the scope _B_ is still running its execution \(2\), the scope _B_ is stopped and its termination handler is executed \(3\). When the termination handler of _B_ is finished, the fault handler of _A_ can be executed \(4\).

Fault handlers can execute compensations by invoking the compensation handlers loaded within the corresponding scope, e.g., in the previous scenario the fault handler of A invokes the compensation handler of C.

![](../../../.gitbook/assets/termination_and_compensation.jpg)

**Fig.1** Code _P_ is executed in parallel with scopes _B_ and _C_ within scope _A_. _C_ is supposed to be successfully ended, whereas _B_ is terminated during its execution by the fault _f_ raised by _P_. The fault handler of _A_ can execute the compensation handler loaded by _C_.

## Termination

Termination is a mechanism used to recover from errors: it is automatically triggered when a scope is unexpectedly terminated from a parallel behaviour and must be smoothly stopped.

Termination is triggered when a sibling activity raises a fault. Let us consider the following example:

```jolie
include "console.iol"

main
{
    scope ( scope_name )
    {
        install( this => 
            println@Console( "This is the recovery activity for scope_name" )()
        );
        println@Console( "I am scope_name" )()
    }
    |
    throw( FaultName )
}
```

In the example above, the code at Lines 7 and 13 is executed concurrently. In `scope_name`, a recovery handler is initially installed and then the code at Line 10 is executed. Besides, the parallel activity may raise the fault at line 13. In that case a termination is triggered and the corresponding recovery code is executed. The complete code of this example can be found [here](https://github.com/jolie/examples/tree/master/03_fault_handling/05_termination)

### Terminating child scopes

When termination is triggered on a scope, the latter recursively terminates its own child scopes. Once all child scopes terminated, the recovery handler is executed. Let us consider the following example:

```jolie
include "console.iol"
include "time.iol"

main
{
    scope( grandFather )
    {
        install( this => 
            println@Console( "recovering grandFather" )()
        );
        scope( father )
        {
            install( this => 
                println@Console( "recovering father" )()
            );
            scope ( son )
            {
                install( this => 
                    println@Console( "recovering son" )()
                );
                sleep@Time( 500 )();
                println@Console( "Son's code block" )()
            }
        }
    }
    |
    throw( FaultName )
}
```

If the fault is raised when the scope `son` is still executing \(we use Jolie's standard library `time` for making the child process wait for 500 milliseconds\), a termination is triggered for scope `grandFather`, which triggers the termination of scope `father`. Finally, scope `father` triggers the termination of the scope `son`, which executes its own recovery handler. Inside-out, `son`'s, `father`'s and `grandFather`'s recovery handlers are executed subsequently. You can find the code of this example [here](https://github.com/jolie/examples/tree/master/03_fault_handling/06_terminating_child_scopes).

## Dynamic installation of recovery handlers

Recovery handlers can be dynamically updated like fault handlers. Such a feature is particularly useful when we intend to update the termination handler depending on the activities executed successfully. As an example, let us consider the following script whose code can be downloaded [here](https://github.com/jolie/examples/tree/master/03_fault_handling/07_dynamic_install):

```jolie
include "console.iol"
include "time.iol"

main
{
    scope( scope_name )
    {
        println@Console( "step 1" )();
        install( this => println@Console( "recovery step 1" )() );
        sleep@Time( 1 )();
        println@Console( "step 2" )();
        install( this => println@Console( "recovery step 2" )() );
        sleep@Time( 2 )();
        println@Console( "step 3" )();
        install( this => println@Console( "recovery step 3" )() );
        sleep@Time( 3 )();
        println@Console( "step 4" )();
        install( this => println@Console( "recovery step 4" )() )
    }
    |
    sleep@Time( 3 )();
    throw( FaultName )
}
```

When `a_fault` is raised, the lastly installed recovery handler is executed.

## Handler composition - the `cH` placeholder

Besides replacing a recovery handlers, it may be useful to add code to the current handler, without replacing the entire previously installed code. Jolie provides the keyword `cH` as a placeholder for the _current handler_.

Let us consider the following example whose executable code can be found [here](https://github.com/jolie/examples/tree/master/03_fault_handling/08_cH):

```jolie
include "console.iol"
include "time.iol"

main
{
    scope( scope_name )
    {
        println@Console( "step 1" )();
        sleep@Time( 1 )();
        install( this =>
            println@Console( "recovery step 1" )() 
        );
        println@Console( "step 2" )();
        sleep@Time( 2 )();
        install( this => 
            cH; 
            println@Console( "recovery step 2" )() 
        );
        println@Console( "step 3" )();
        sleep@Time( 3 )();
        install( this => 
            cH;
            println@Console( "recovery step 3" )() 
        );
        println@Console( "step 4" )();
        sleep@Time( 4 )();
        install( this => 
            cH;
            println@Console( "recovery step 4" )()
        )
    }
    |
    sleep@Time( 3 )();
    throw( FaultName )
}
```

`cH` can be composed within another handler by means of the sequence and parallel operators. The resulting handler will be the composition of the previous one \(represented by `cH`\) and the new one.

## Compensation, the primitive `comp`

Compensation allows to handle the recovery of a scope which has successfully executed. When a scope finishes with success its own activities, its current recovery handler is promoted to the parent scope in order to be available for compensation.

Compensation is invoked by means of the `comp` statement, which can be used only within a handler.

Let us consider the following example showing how to perform a compensation. The executable code can be found [here](https://github.com/jolie/examples/tree/master/03_fault_handling/09_compensation):

```jolie
include "console.iol"

main
{
    install( a_fault => 
        println@Console( "Fault handler for a_fault" )();
        comp( example_scope )
    );
    scope( example_scope )
    {
        install( this => 
            println@Console( "recovering step 1" )()
        );
        println@Console( "Executing code of example_scope" )();
        install( this => 
            cH;
            println@Console( "recovering step 2" )()
        )
    };
    throw( FaultName )
}
```

When scope `example_scope` ends with success, its current recovery handler is promoted to the parent scope \(`main`\) in order to be available for compensation. At the end of the program, the `a_fault` is raised, triggering the execution of its fault handler, defined at Lines 5-8. At Line 7 the compensation of scope `example_scope` is executed, triggering the execution of the corresponding recovery handler \(in this case, the one at Line 15, including the first at Line 11\).

### The electronic purchase example

Here we consider a simplified scenario of an electronic purchase where termination and compensation handlers are used. The full code can be checked [here](https://github.com/jolie/examples/tree/master/03_fault_handling/12_transaction_example) whereas the reference architecture of the example follows:

![](../../../.gitbook/assets/transactions.png)

In this example a user wants to electronically buy ten beers invoking the transaction service which is in charge to contact the product store service, the logistics service and the bank account service. It is clearly an over simplification w.r.t. a real scenario, but it is useful to our end for showing how termination and compensation work. In the following we report the implementation of the operation _buy_ of the transaction service:

```jolie
[ buy( request )( response ) {
          getProductDetails@ProductStore({ .product = request.product })( product_details );
          scope( locks ) {
              install( default =>
                    { comp( lock_product ) | comp( account ) }
                    ;
                    valueToPrettyString@StringUtils( locks.( locks.default ) )( s );
                    msg_failure = "ERROR: " + locks.default + "," + s;
                    throw( TransactionFailure, msg_failure )
              );
              scope( lock_product ) {
                  /* lock product availability */
                  with( pr_req ) {
                      .product = request.product;
                      .quantity = request.quantity
                  };
                  lockProduct@ProductStore( pr_req )( pr_res );
                  install( this =>
                      println@Console("unlocking product...")();
                      unlockProduct@ProductStore( { .token = pr_res.token })();
                      println@Console("product unlocking done")()
                  );
                  /* lock logistics delivery time */
                  getCurrentTimeMillis@Time()( now );
                  with( log_req ) {
                      .weight = product_details.weight * request.quantity;
                      .expected_delivery_date = now + 1000*60*60*72; // three days
                      .product = request.product
                  };
                  bookTransportation@Logistics( log_req )( log_res );
                  install( this =>
                      cH;
                      println@Console("cancelling logistics booking..." )();
                      cancelBooking@Logistics({ .reservation_id = log_res.reservation_id } )();
                      println@Console("cancelling logistics booking done")()
                  )
              }
              |
              scope( account ) {
                  /* lock account availability */
                  with( cba ) {
                      .card_number = request.card_number;
                      .amount = request.quantity * product_details.price
                  };
                  lockCredit@BankAccount( cba )( lock_credit );
                  install( this =>
                      println@Console("cancelling account lock..")();
                      cancelLock@BankAccount( { .token = lock_credit.token })();
                      println@Console("cancelling account lock done")()
                  )
              }
          }
          ;
          /* commit */
          {
              commit@BankAccount({ .token = lock_credit.token })()
              |
              confirmBooking@Logistics({ .reservation_id = log_res.reservation_id })()
              |
              commitProduct@ProductStore({ .token = pr_res.token })()
          }
          ;
          response.delivery_date = log_res.actual_delivery_date
    }]
```

Here the transaction service starts two parallel activities:

* contact the product store and the logistics for booking the product and the transportation service. In particular it executes a sequence of two calls: _lockProduct@ProductStore_ and _bookTransportation_. The former locks the requested product on the Product Store whereas the latter books the transportation service. 
* contact the bank account for locking the neccesary amount

Note that in the former activity, after each invocation a termination handler is installed:

```jolie
  with( pr_req ) {
      .product = request.product;
      .quantity = request.quantity
  };
  lockProduct@ProductStore( pr_req )( pr_res );
  install( this =>
      println@Console("unlocking product...")();
      unlockProduct@ProductStore( { .token = pr_res.token })();
      println@Console("product unlocking done")()
  );
  /* lock logistics delivery time */
  getCurrentTimeMillis@Time()( now );
  with( log_req ) {
      .weight = product_details.weight * request.quantity;
      .expected_delivery_date = now + 1000*60*60*72; // three days
      .product = request.product
  };
  bookTransportation@Logistics( log_req )( log_res );
  install( this =>
      cH;
      println@Console("cancelling logistics booking..." )();
      cancelBooking@Logistics({ .reservation_id = log_res.reservation_id } )();
      println@Console("cancelling logistics booking done")()
  )
```

In particular, in the second one, the termination handler is installed as an update of the previous one thanks to the usage of the keyword `cH`. Indeed, after the second installation the handler will appear as it follows:

```jolie
println@Console("unlocking product...")();
unlockProduct@ProductStore( { .token = pr_res.token })();
println@Console("product unlocking done")();
println@Console("cancelling logistics booking..." )();
cancelBooking@Logistics({ .reservation_id = log_res.reservation_id } )();
println@Console("cancelling logistics booking done")()
```

On the other hand a termination is installed for unlocking the amount of money. All these termination handlers are promoted at the parent scope, and in case of fault, they will be compensated:

```jolie
  install( default =>
                        { comp( lock_product ) | comp( account ) }
                        ...
```

If we simulate that the user has not enough money into the bank account, teh fault _CreditNotPresent_ is raised by the bank account service. In this case, the compensation handlers of the sibling activities are executed by rolling back the lock of the product and the book of the transportation service.

In case there are no faults, all the activities are finalized in the last parallel of the operation _buy_ where all the involved services are called for commiting the previous lock of resources.

## Installation-time variable evaluation

Handlers need to use and manipulate variable data often and a handler may need to refer to the status of a variable at the moment of its installation. Hence, Jolie provides the `^` operator which "freezes" a variable state within an installed handler. `^` is applied to a variable by prefixing it, as shown in the example below whose executable code can be found [here](https://github.com/jolie/examples/tree/master/03_fault_handling/10_installation_time_variable_evaluation).

```jolie
include "console.iol"

main
{
    install( a_fault => 
        comp( example_scope )
    );
    scope( example_scope )
    {
        install( this => println@Console( "initiating recovery" )() );
        i = 1;
        while( true ){
            install( this =>
                cH;
                println@Console( "recovering step" + ^i )()
            );
            i++
        }
    }
    |
    throw( FaultName )
}
```

The install primitive contained in the `while` loop updates the scope recovery handler at each iteration. In the process the value of the variable `i` is frozen within the handler.

At this [link](https://github.com/jolie/examples/tree/master/03_fault_handling/13_transaction_example_multiple_products) we modified the electronic purchase example described above, introducing the possibility to buy a set of products instead of a single one. In such a case, the transaction service performs a locking call to the store service for each received product and, for each of these calls, it installs a related termination handler. In the termination handler, we exploits the freeze operator for freezing variables _i_, _token_ and _reservation\_id_ at the values they have in the moment of the installation:

```jolie
scope( locks ) {
  install( default =>
        { comp( lock_product ) | comp( account ) }
        ;
        valueToPrettyString@StringUtils( locks.( locks.default ) )( s );
        msg_failure = "ERROR: " + locks.default + "," + s;
        throw( TransactionFailure, msg_failure )
  );
  scope( lock_product ) {
      /* lock product availability */
      for( i = 0, i < #request.product, i++ ) {
            println@Console("processing product " + request.product[ i ] )();
            with( pr_req ) {
                .product = request.product[ i ];
                .quantity = request.product[ i ].quantity
            };
            println@Console("locking " + request.product[ i ])();
            lockProduct@ProductStore( pr_req )( pr_res );
            token = product.( request.product[ i ]).token = pr_res.token ;
            install( this =>
                cH;
                println@Console("unlocking product " + request.product[ ^i ] )();
                unlockProduct@ProductStore( { .token = ^token })()
            );
            /* lock logistics delivery time */
            getCurrentTimeMillis@Time()( now );
            with( log_req ) {
                .weight = products.( request.product[ i ] ).weight * request.product[ i ].quantity;
                .expected_delivery_date = now + 1000*60*60*72; // three days
                .product = request.product[ i ]
            };
            bookTransportation@Logistics( log_req )( log_res );
            reservation_id = product.( request.product[ i ]).reservation_id = log_res.reservation_id;
            install( this =>
                cH;
                println@Console("cancelling logistics booking for product " + request.product[ ^i ] )();
                cancelBooking@Logistics({ .reservation_id = ^reservation_id } )()
            )
      }
  }
  |
  scope( account ) {
      /* lock account availability */
      for( y = 0, y < #request.product, y++ ) {
          amount = amount + request.product[ y ].quantity * products.( request.product[ y ] ).price
      };
      with( cba ) {
          .card_number = request.card_number;
          .amount = amount
      };
      lockCredit@BankAccount( cba )( lock_credit );
      install( this =>
          println@Console("cancelling account lock..")();
          cancelLock@BankAccount( { .token = lock_credit.token })();
          println@Console("cancelling account lock done")()
      )
  }
}
```

At lines 22-23 and 36-37 it is possible to find the usage of the freeze operator. Note that the operator `cH` allows for queueing all the installed handlers.

## Solicit-Response handler installation

Solicit-Responses communication primitives allow for synchrnously sending a request and receiving a reply. Since the sending and the receiving are performed atomically in the same primitive, apparently it is not possible to install a handler after the request sending and before the reply reception. In Jolie it is possible to program such a behaviour using the following syntax:

```jolie
operation_name@Port_name( request )( response ) [ this => handler code here ]
```

between the square brackets it is possible to install a termination handler which is installed after the sending of the request and before receiving a reply. **Note that the handler is installed only in case of a successfull reply, not in the case of a fault one**.

At this [link](https://github.com/jolie/examples/tree/master/03_fault_handling/13_transaction_example_multiple_products) we report an executable example where a client calls a server with a solicit-response operation named _hello_. In particular, we install a _println_ command after sending the request message:

```jolie
scope( calling ) {
    install( this => println@Console( "Before calling" )() );
    hello@Server("hello")( response )
    [
          this => println@Console("Installed Solicit-response handler")()
    ]
}
```

In the same example the solicit-response is programmed with a fake activity which raises a fault thus trigerring the termination handler of the Solicit-Response. It is woth noting how the solicit-response handler is installed before executing the termination trigerred by the parallel fault.

