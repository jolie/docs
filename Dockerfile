###############################################################
### ---- Create a Docker image for Jolie Documentation ---- ###
###############################################################
FROM node:alpine
RUN npm install -g gitbook-cli
# patch a gitbook dependency
COPY overrides/usr/ /usr/local
WORKDIR home
# the directory web will be mounted under home as read-only, thus we serve the
# book from home so that install/build/serve commands can create a directory
# _book (this is particularly relevant for the install command)
COPY book.json .
# install gitbook plugins listed in book.json
RUN gitbook install
# port 35729 is the live-reload port of gitbook
EXPOSE 8080 35729
CMD ["gitbook", "--port", "8080", "serve"]
