# Jolie project structure


```
├── cmd (contains executable commands)
│   ├── executable1 (directory containing executable1)
│   │   ├── someExecutableFile1.ol
│   └── executable2 (directory containing executable2)
│   │   ├── someExecutableFile2.ol
│   │   └── internal (executable2 has internal project dependencies)
|   │   │   └── leonardo (Leonardo project directory, as git submodule)
├── docker (Docker files)
│   ├── Dockerfile (default Dockerfile)
│   └── Dockerfile.jre8 (example of alternative Dockerfile)
├── interfaces (published interfaces)
├── internal (internal files that are not supposed to be used by other projects, e.g., internal .iol files)
├── scripts (scripts for building, installing, etc.)
├── test (for tests)
├── types (utility directory for sharing data type definitions to clients or among interfaces)
│   ├── SomeDataTypes.iol
│   └── SomeInterface.iol
├── web (web files, e.g., CSS and HTML files)
└── README.md
```

