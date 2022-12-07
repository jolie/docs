# Understanding errors

This section is devoted to explain some errors that can be raised by the interpreter which could be difficult to understand due to the service oriented model used by Jolie:

- __If execution is not single, the body of main must be either an input choice or a sequence that starts with an input statement (request-response or one-way)__ :
In Jolie a service may have different [execution modalities](../../language-tools-and-standard-library/basics/processes-and-sessions/processes/README.md): `concurrent`, `sequential`, and `single`.
If no execution modality is specified, `single` is used by default, meaning that the service is going to be executed once (this is suitable for one-shot programs like scripts).
If the execution modality is set to `concurrent` or `sequential`, the service will start to listen for requests to be served.
In this last case, the behaviour defined within scope `main` must either be an[input choice](../../language-tools-and-standard-library/basics/composing-statements/README.md#input-choice) or a sequence of statements that starts with an [input primitive](../../language-tools-and-standard-library/basics/communication-primitives/README.md).
An input primitive can be a request-response or a one-way input. In all other cases, the engine will raise the error `If execution is not single, the body of main must be either an input choice or a sequence that starts with an input statement (request-response or one-way)`.
So if you get this error, check your `main` definition and verify that it consists of either an input choice or a sequence that starts with an input statement.
