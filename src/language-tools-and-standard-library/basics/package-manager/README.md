# Package Manager for Jolie

The jolie package manager **jpm** is the tool for managing packages in Jolie. jpm can be installed using npm with following command

```bash
npm install -g @jolie/jpm
```

**Note that jpm requires NodeJS version 18 or newer to operate.**

Jolie packages uses the benefit of node ecosystem to provide the developer-friendly experience on building the packages. jpm manages a jolie specific field in the package.json. Which specify Jolie packages that the project is depended on.

## Create Jolie project with `npm create`

Jolie provides an easy way to create a jolie project via `npm create` command. In an empty directory, execute the following command and follow the instruction. The command will create a bootstrap Jolie project based on type user choosing and automatically activate jpm on the fly.

```bash
npm create jolie
```

## Activate jpm on a Jolie project

In order to activate jpm on an existing Jolie project, it requires package.json file to be present on the root directory of the project. Which can be done via executing `npm init` command. Following with jpm init command

```bash
npm init --y # Creates npm project

jpm init # Adds jolie's specific field to package.json
```

## jpm Usage

`jpm` capable of fetching packages from both `npm` and `maven`. The latter is useful for the project that only required importing java classes to the classpath e.g. database driver. A dependency can be install using the following command

### Adding dependency

```bash
jpm install [TARGET[@version]] [-r mvn|npm]

ARGUMENTS
    TARGET  Target package to add to dependency

FLAGS
    -r, --repo=(mvn|npm) the lookup repository (mvn for maven)

EXAMPLES
    $ jpm install
    scan entries from package.json and download all dependencies

    $ jpm install @jolie/websocket
    add @jolie/websocket into the project

    $ jpm install org.xerial:sqlite-jdbc
    add sqlite's jdbc driver to the project
```

jpm will download and extract the dependency to the proper directory in the project.

### Removing dependency

```bash
USAGE
    $ jpm remove [TARGET]

ARGUMENTS
    TARGET  Target package

DESCRIPTION
    Remove Jolie related dependency to the project

    Currently, it removes the corresponding entry on package.json file and perform install command



EXAMPLES
    $ jpm remove jolie-jsoup
        Remove jolie-jsoup from the dependencies
```

## Under the hood of jpm's package.json

jpm operate only on `jolie` field in `package.json`. The field itself contains the information of the dependency and which repository to fetch the data from. The rest of the content inside `package.json` is left to be managed by `npm`, so we can fully use the potential of npm on development to publishing the package to `npm` repository. The **jolie** field **should not** be modified manually.

For more information, inquiry, or suggestion, please use jpm's [github](https://github.com/jolie/jpm) or join the [discord](https://discord.gg/M24EbU7ja9).
