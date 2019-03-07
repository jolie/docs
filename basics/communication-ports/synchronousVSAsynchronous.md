# Synchronous vs Asynchronous communications
Input and output primitives allows for the programming of both synchronous and asynchronous communications. Synchronous communication always deal with a message exchange between the sender and the receiver where the sender is blocked until the reply is received. Asynchronous communication deal with a single message exchange where the sender can continue to work after sending the message. The two communication patterns can be summarized in the following diagram:

![](../../.gitbook/assets/asyncVSsync.png)

It is worth noting that both of them have always an impact on the architecture of the system. The synchrnous communication permits to have a double message exchange on the port of the receiver whereas the asynchronous one deal only with a single message exchange. Thus, if we need to implement an asynchronous request/reply message exchange we are forced to modify the architecture adding an input port to the sender and an output port to the receiver just for dealing with the reply message.

![](../../.gitbook/assets/async.png)

