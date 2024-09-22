FROM nginx:1.19.5-alpine

LABEL maintainer="Daniel Isaksen <daniel.isaksen@banenor.no>"

RUN apk add --no-cache git

WORKDIR /var/www/drawio

RUN \
	git clone --depth 1 https://github.com/jgraph/drawio.git 2>&1 && \
	mv drawio/src/main/webapp/* . && \
	rm -rf drawio META-INF WEB-INF

# COPY nginx.conf /etc/nginx/nginx.conf
COPY drawio.conf /etc/nginx/conf.d/default.conf

