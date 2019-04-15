# Jolie project structure

**FM: I've taken a lot of inspiration from the Go language where it makes sense, and adapted some names to Jolie (e.g., ports)**

```
├── cmd (contains executable commands)
│   ├── executable1 (directory containing executable1)
│   │   ├── main.ol
│   └── executable2 (directory containing executable2)
│   │   ├── main.ol
│   │   └── internal (executable2 has internal project dependencies)
|   │   │   └── leonardo (Leonardo project directory, as git submodule)
├── docker (Docker files)
│   ├── Dockerfile (default Dockerfile)
│   └── Dockerfile.jre8 (example of alternative Dockerfile)
├── interfaces (published interfaces)
├── internal (internal files that are not supposed to be used by other projects, e.g., internal .iol files)
├── ports (output ports exposed to clients)
│   ├── Port1.iol (client can include this to access some input port at the service)
│   └── Port2.iol (client can include this to access some input port at the service)
├── scripts (scripts for building, installing, etc.)
├── test (for tests)
├── types (utility directory for sharing data type definitions to clients or among interfaces)
│   ├── SomeDataTypes.iol
│   └── SomeInterface.iol
├── web (web files, e.g., CSS and HTML files)
├── build.sh (file for building the docker image)
├── run.sh (file for running the containerised service with docker)
└── README.md
```

**FM: cmd could become app if you like, for applications**
