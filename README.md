# jolie-gitbook-docker

Docker image with Gitbook using the [xiroV/gitbook-plugin-highlight-jolie](https://github.com/xiroV/gitbook-plugin-highlight-jolie) plugin, to support Jolie syntax highlighting.

Place Markdown files in the `docs` directory.

Build the image with

```
docker build -t jolie-docs .
```

Then run with

```
docker run -p 8080:8080 -d jolie-docs
```

The Gitbook should then be accessible on [localhost:8080](http://localhost:8080).
