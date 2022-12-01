<!-- markdown-link-check-disable -->

# Jolie Documentation

Documentation for Jolie `v1.9.x`.

Before making a pull request, test your changes by building the documentation
locally. Use the Docker image provided in this branch to build a mdBook
accessible on [localhost:3000](http://localhost:3000). Edit the files in the
directory `src` and wait for mdBook to reload the page to see your edits (be
patient, it may take up to a minute).

## Using `docker-compose`

run it with

```bash
docker compose up -d
```

and stop it with

```bash
docker compose down
```

## Using `docker`

Build the image with

```bash
docker build -t jolie-docs .
```

Then run it with

```bash
docker run --rm -it \
    -p 3000:3000 \
    -v "$(pwd)"/src:/jolie-docs:ro \
    jolie-docs
```
