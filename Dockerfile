FROM nginx:1.21.4-alpine

LABEL maintainer="Daniel Isaksen"

ARG DRAWIO_VERSION="24.7.8"
ARG DRAWIO_REPO="https://github.com/jgraph/drawio.git"

RUN apk add --no-cache git

WORKDIR /var/www/drawio

RUN \
	git clone --depth 1 --branch "v$DRAWIO_VERSION" \
		"$DRAWIO_REPO" > /dev/null 2>&1 && \
	mv drawio/src/main/webapp/* . && \
	rm -rf drawio META-INF WEB-INF

# COPY nginx.conf /etc/nginx/nginx.conf
COPY drawio.conf /etc/nginx/conf.d/default.conf

