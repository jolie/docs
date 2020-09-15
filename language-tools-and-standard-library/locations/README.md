# Locations

A location defines the medium on which a port sends and receive messages.

A location is always a URI in the form medium\[:parameters\], where medium is the medium identifier and the optional parameters is a medium-specific string

Jolie natively supports five media:

* local \(Jolie in-memory communication\);
* socket \(TCP/IP sockets\);
* btl2cap \(Bluetooth L2CAP\);
* rmi \(Java RMI\);
* localsocket \(Unix local sockets\).

In the following sections we explain the medium-specific properties of the locations provided by Jolie.

## Automatic configuration of a location using extension `auto`

Both inputPort locations and outputPort locations cna be automatically set from an external file by using the extension `auto`. `auto` is a special extension which can be defined instead of a usual location. When using `auto` two different kind of external files can be exploited for defining the locations: `ini` and `json`.

The form of the extension string for auto is:

```text
auto:<file format ini|json>:<variable path>:file:<path to file>
```

### `ini` file

Here we show an example of port definition which exploits the extension `auto` together with a file `ini`.

```jolie
inputPort MyInput {
location: "auto:ini:/Location/MyInput:file:config.ini"
protocol: sodep
interfaces: DummyInterface
}

outputPort MyOutput {
location: "auto:ini:/Location/MyOutput:file:config.ini"
protocol: sodep
interfaces: DummyInterface
}
```

where the `ini` file is:

```text
[Location]
MyInput=socket://localhost:8000
MyOutput=socket://100.100.100.100:8000
```

Note that the `<variable path>` take the following forms:

```text
/Location/MyInput
/Location/MyOutput
```

where `Location` is the name of the section inside the `ini` file.

### `json` file

Here we show an example of port definition which exploits the extension `auto` together with a file `json`.

```jolie
inputPort MyInput {
location: "auto:json:MyInput.location:file:config.json"
protocol: sodep
interfaces: DummyInterface
}

outputPort MyOutput {
location: "auto:json:MyOutput.location:file:config.json"
protocol: sodep
interfaces: DummyInterface
}
```

where the `json` file is:

```json
{
  "MyInput": {
    "location":"socket://localhost:8000"
  },
  "MyOutput": {
    "location":"socket://100.100.100.100:8000"
  }
}
```

Note that the `<variable path>` take the following forms:

```text
MyInput.location
MyOutput.location
```

