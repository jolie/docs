FROM nginx:alpine
LABEL build_date="2020-09-30" \
	  author="Brian Alberg <alberg@imada.sdu.dk>" \
	  description="Jolie Documentation" \
	  url="https://jolie-lang.org"
MAINTAINER Brian Alberg "alberg@imada.sdu.dk"
WORKDIR /home
RUN apk update && \
    apk add git && \
    apk add nodejs npm --no-cache
RUN npm install -g gitbook-cli
RUN git clone https://github.com/jolie/docs.git
WORKDIR /home/docs
RUN cp -r -v docker/overrides/* /
RUN cp docker/versions.json docker/index.html /usr/share/nginx/html
RUN cp -r docker/nginx/conf.d /etc/nginx

RUN for version in $(git for-each-ref --shell --format='%(refname:lstrip=3)' | grep 'v[0-9]*\.[0-9]*\.x' | tr -d "'"); \
    do \
        echo "Copying version ${version}"; \
        git checkout -f ${version}; \
        cd web; \
        cp logo.png /usr/share/nginx/html; \
        gitbook install; \
        gitbook build;\
        ## Copy static webserver
        mkdir -p /usr/share/nginx/html/${version}; \
        chown -R nginx:nginx _book;\
        cp -r -v _book/. /usr/share/nginx/html/${version}; \
        cd ..; \
    done
WORKDIR /
EXPOSE 8080
