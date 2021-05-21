# Jolie Documentation

Documentation for Jolie `v1.10.x`.

Before making a pull request, test your changes by building the documentation
locally. Use the Docker image provided in this branch to build a Gitbook
accessible on [localhost:8080](http://localhost:8080). Edit the files in the
directory `web` and wait for Gitbook to reload the page to see your edits (be
patient, it may take up to a minute).

## Build the Docker image

Docker image with Gitbook using the
[highlight-jolie](https://github.com/xiroV/gitbook-plugin-highlight-jolie)
plugin, to support Jolie syntax highlighting.

### Using `docker-compose`

Build the image with

```
docker-compose build
```

Then run it with

```
docker-compose up -d
```

and stop it with

```
docker-compose down
```

### Using `docker`

Build the image with

```
docker build -t jolie-docs .
```

Then run it with

```
docker run --rm -it \
    -p 8080:8080 -p 35729:35729 \
    -v "$(pwd)"/web:/home/web:ro \
    jolie-docs
```
