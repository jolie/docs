###############################################################
### ---- Create a Docker image for Jolie Documentation ---- ###
###############################################################

# build highlight jolie highlight.js
FROM node:20-alpine AS highlight-jolie
WORKDIR /highlight-jolie
COPY highlight-jolie .
RUN npm install
RUN npm run build --verbose

# install mdbook
FROM rust:1.80 AS builder
ENV MDBOOK_VERSION="0.4.40"
ENV ARC="x86_64-unknown-linux-musl"
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    musl-tools
RUN rustup target add "${ARC}"
RUN cargo --version
# RUN cargo install mdbook
RUN cargo install mdbook --version "${MDBOOK_VERSION}" --target "${ARC}" --locked
# RUN cargo install mdbook-mermaid
RUN cargo install mdbook-mermaid --target "${ARC}"

# serve mdbook
FROM alpine:3.16
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/bin/mdbook
COPY --from=builder /usr/local/cargo/bin/mdbook-mermaid /usr/bin/mdbook-mermaid
WORKDIR /jolie-docs
COPY src /jolie-docs/src
COPY theme /jolie-docs/theme
COPY book.toml book.toml
COPY --from=highlight-jolie /highlight-jolie/dist/highlight.js /jolie-docs/theme/highlight.js

EXPOSE 3000

ENTRYPOINT [ "mdbook", "serve", "--hostname", "0.0.0.0" ]
# # the directory web will be mounted under home as read-only, thus we serve the
# # book from home so that install/build/serve commands can create a directory
# # _book (this is particularly relevant for the install command)
# COPY web/book.json .
# # tell gitbook that the book is inside the web directory
# RUN sed -i '/^{/a \    "root": "./web",' book.json
# # install gitbook plugins listed in book.json
# RUN gitbook install
# # port 35729 is the live-reload port of gitbook
# CMD ["gitbook", "--port", "8080", "serve"]
