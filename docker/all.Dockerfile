
# build highlight jolie highlight.js
FROM node:alpine AS highlight-jolie
WORKDIR /highlight-jolie
COPY highlight-jolie .
RUN npm install
RUN npm run build

# install mdbook
FROM rust:1.65 AS builder
ENV MDBOOK_VERSION="0.4.21"
ENV ARC="x86_64-unknown-linux-musl"
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    musl-tools
RUN rustup target add "${ARC}"
RUN cargo --version
# RUN cargo install mdbook
RUN cargo install mdbook --version "${MDBOOK_VERSION}" --target "${ARC}"
# RUN cargo install mdbook-mermaid
RUN cargo install mdbook-mermaid --target "${ARC}"


# build mdbook
FROM nginx:alpine
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/bin/mdbook
COPY --from=builder /usr/local/cargo/bin/mdbook-mermaid /usr/bin/mdbook-mermaid

COPY docker/versions.json docker/index.html /usr/share/nginx/html/
COPY docker/nginx/conf.d /etc/nginx/conf.d

COPY theme /jolie-docs/theme
COPY --from=highlight-jolie /highlight-jolie/dist/highlight.js /jolie-docs/theme/highlight.js
COPY book.toml /jolie-docs/book.toml

RUN apk update && \
    apk add git

RUN git clone https://github.com/jolie/docs.git
WORKDIR /docs


RUN for version in $(git for-each-ref --shell --format='%(refname:lstrip=3)' | grep 'v[0-9]*\.[0-9]*\.x' | tr -d "'"); \
    do \
        echo "Copying version ${version}"; \
        git checkout -f ${version}; \
        cp /jolie-docs/book.toml /docs/book.toml; \
        cp -r /jolie-docs/theme /docs/; \
        mdbook build;\
        ## Copy static webserver
        mkdir -p /usr/share/nginx/html/${version}; \
        chown -R nginx:nginx book;\
        cp -r -v book/. /usr/share/nginx/html/${version}; \
    done
EXPOSE 8080
