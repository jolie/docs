# Download a zip file from the Internet

In this simple tutorial we'll see how to download derby.jar from _apache.org_.
The full code can be downloaded [here](https://github.com/jolie/examples/blob/master/Tutorials/download-a-zip-from-the-web/download-a-zip-from-the-web.ol)

The steps we'll follows are:


1. Downloading the zip file `db-derby-10.14.2.0-lib.zip` with the libs from `https://archive.apache.org:443/dist/db/derby/db-derby-10.14.2.0/`
1. Saving the downloaded file in the current directory
1. Unzipping the file
1. Extracting the file `derby.jar` and copying in teh current directory
1. Removing unuseful directories

## Downloading the zip file from the Internet
In order to download the file we need to create an outputPort as it follows:

```jolie
...

interface ApacheDerbyDownloadInterface {
    RequestResponse:
        downloadDerby
}

...

outputPort ApacheDerby1_10_14 {
    location: "socket://archive.apache.org:443/dist/db/derby/db-derby-10.14.2.0/"
    protocol: https {
        .osc.downloadDerby.alias = "db-derby-10.14.2.0-lib.zip"
        .osc.downloadDerby.method = "get"
    }
    interfaces: ApacheDerbyDownloadInterface
}

...
```

Note that:

1. The location is set without the name of the file, and the https token is replaced with medium `socket`
1. The protocol https is defined in the parameter `protocol`
1. The interface `ApacheDerbyDownloadInterface` has been attached to the outputPort where the operation `downloadDerby` is defined
1. Protocol https is defines with two extra parameters `.osc.downloadDerby.alias` and `.osc.downloadDerby.method`. The former one defines an alias to use for making a request for operation _downloadDerby_, the latter one defines the http method to use when invoking the endpoint using operation _downloadDerby_

In the behaviour, it is sufficient to program the related solicit-response:
```jolie
...
downloadDerby@ApacheDerby1_10_14()( derby )
...
```
Variable `derby` contains the downloaded file.

## Saving the downloaded file
This step is quite simple, just use the File standard library. Pay attentio to use the format `binary` for keeping safe the file encoding.
```jolie
writeFile@File( { filename = DOWNLOADED_ZIP, content << derby } )()
```
where `DOWNLOADED_ZIP` is a constant with the name of the file.

## Unzipping the file
Now it is possibile to unzip the file by using the standard library `zip-utils`

```jolie 
from zip-utils import ZipUtils
...
embed ZipUtils as ZipUtils
...
unzip@ZipUtils( { filename = DOWNLOADED_ZIP, targetPath = TARGET_PATH_UNZIP} )()
```
where `TARGET_PATH_UNZIP` is a constant with the target path where saving the unzipped files.

## Extraction of the derby.jar file
This step is quite simple because it is sufficient to exploit the standard library File

```jolie
derbyDbJarFilename = TARGET_PATH_UNZIP + "/db-derby-10.14.2.0-lib/lib/derby.jar"
readFile@File( { filename = derbyDbJarFilename, format = "binary" } )( derbyJar )
writeFile@File( { filename = "derby.jar", format = "binary", content << derbyJar })()
```

## Unuseful directories removal
Also this step exploits the standard library for files
```jolie
delete@File( DOWNLOADED_ZIP )()
deleteDir@File( TARGET_PATH_UNZIP )()
```