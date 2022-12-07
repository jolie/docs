
# build highlight jolie highlight.js
FROM node:alpine AS highlight-jolie
LABEL build_date="2022-12-07" \
	  author="Brian Alberg <alberg@imada.sdu.dk>" \
	  description="Jolie Documentation" \
	  url="https://jolie-lang.org"

WORKDIR /highlight-jolie
COPY highlight-jolie .
RUN npm install
RUN npm run build

# build mdbook
FROM nginx:alpine

RUN apk update && \
    apk add --no-cache curl git
# download mdbook and plugins binary
RUN curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.22/mdbook-v0.4.22-x86_64-unknown-linux-musl.tar.gz | tar -xvz --directory=/usr/bin
RUN curl -sSL https://github.com/badboy/mdbook-mermaid/releases/download/v0.12.3/mdbook-mermaid-v0.12.3-x86_64-unknown-linux-musl.tar.gz | tar -xvz --directory=/usr/bin

# copy shared content
COPY docker/versions.json docker/index.html /usr/share/nginx/html/
COPY docker/nginx/conf.d /etc/nginx/conf.d

COPY theme /jolie-docs/theme
COPY --from=highlight-jolie /highlight-jolie/dist/highlight.js /jolie-docs/theme/highlight.js
COPY book.toml /jolie-docs/book.toml

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
