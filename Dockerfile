FROM alpine

MAINTAINER Neszt Tibor <tibor@neszt.hu>

RUN \
	apk add --no-cache -t .required_apks build-base git make g++ && \
	mkdir -p /usr/src /src && cd /usr/src && \
	git clone https://github.com/neszt/hello_world.git && \
	cd hello_world && \
	make hello_world && cp hello_world / && \
	apk del .required_apks && \
	rm -rf /usr/src

ENTRYPOINT ["/hello_world"]
