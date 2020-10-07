# Synchronous vs Asynchronous Communication

Input and output primitives allows for the programming of both synchronous and asynchronous communications. Synchronous communication always deal with a message exchange between the sender and the receiver where the sender is blocked until the reply is received. Asynchronous communication deal with a single message exchange where the sender can continue to work after sending the message. The two communication patterns can be summarized in the following diagram:

![](../../../.gitbook/assets/asyncvssync.png)

It is worth noting that both of them have always an impact on the architecture of the system. The synchrOnous communication permits to have a double message exchange on the port of the receiver whereas the asynchronous one deals only with a single message exchange. Thus, if we need to implement an asynchronous request/reply message exchange we are forced to modify the architecture adding an input port to the sender and an output port to the receiver just for dealing with the reply message.

![](../../../.gitbook/assets/async.png)

In the example reported at [https://github.com/jolie/examples/tree/master/02\_basics/6\_async\_vs\_sync](https://github.com/jolie/examples/tree/master/02_basics/6_async_vs_sync) we modelled a message exchange both using a synchronous communication and an asynchronous one. Note that the synchronous version can be easily considered as a common pattern to be used as is in your projects, whereas the asynchronous one could require some more analysis from the point of view of the session management. Please, read the section about [sessions](../sessions.md) in order to learn about session management.

