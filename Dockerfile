###############################################################
### ---- Create a Docker image for Jolie Documentation ---- ###
###############################################################
FROM nginx:alpine
LABEL build_date="2020-08-31" \
	  author="Brian Alberg <alberg@imada.sdu.dk>" \
	  description="Jolie Documentation" \
	  url="https://jolie-lang.org"
MAINTAINER Brian Alberg "alberg@imada.sdu.dk"
ENV REFRESHED_AT 2020-08-31
## Install NodeJS
RUN apk update && \
	apk add --update nodejs npm --no-cache
WORKDIR /home/jolie-docs
COPY gitbook/* ./
# sed append line after match
RUN sed -i '/^{/a \    "root": "./web",' book.json
RUN npm update
RUN npm install -g gitbook-cli
RUN npm install mv
RUN npm install gitbook-plugin-highlight-jolie
RUN npm install gitbook-plugin-theme-jolie
RUN npm install gitbook-plugin-logo
RUN npm install gitbook-plugin-collapsible-chapters
COPY overrides/ /
RUN gitbook init
EXPOSE 8080
CMD gitbook --port 8080 serve
