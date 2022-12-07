# Package Manager for Jolie

The jolie package manager **JPM** is can be installed from [jpm](https://www.npmjs.com/package/@jolie/jpm), being a package npm it is required that on your machine you have installed NodeJs using the following command

```bash
npm install -g @jolie/jpm
```

the    **-g** option makes sure the installation is global and available for any project

## Initiate a project Jolie with JPM

It must be stated that you can program a jolie without having to use **jpm** , yet jpm will help you to access to the community packages and to managed then via commands , these packages can be found in [npm](https://www.npmjs.com).
To initiate a project you need to use the command

```bash
jpm init
```

this command will create the project json descriptor jpm.json

```json

{
    "name": "testProject",
    "description": "",
    "author": "",
    "version": "1.0.0",
    "license": "ISC",
    "keywords": [],
    "scripts": {
        "jolive": "npx nodemon --exec jolie ./server.ol",
        "clean": "rm ./hs_err_pid*"
    },
    "dependencies": {}
}

```

you can alter the node like:

- name
- description
- author

the **dependencies** node **must not** modified by hand.

to add dependencies please use the following command

```bash
jpm add nameOfThePackage

```

for example to add the [tquery](https://www.npmjs.com/package/@jolie/tquery)

```bash
jpm add @jolie/tquery
```

jpm will take care of of downloading the correct files composing the package and place then under the packages directory that if not present will be created

By default the jolie language interpreter looks for its packages in the local directory packages if it exists so for using the tquery package now installed in your local project directory can be used

```bash
from @jolie.tquery.main import TQuery
```

that can be red as

```jolie
from directory.directory.naneOfTheServiceFile    import nameOfTheService
```

to remove

```bash
jpm remove @jolie/tquery
```
