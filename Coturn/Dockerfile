FROM alpine:latest
MAINTAINER Ian Blenke <ian@blenke.com>

ENV COTURN_VERSION 4.5.0.3

RUN apk add --no-cache --update bash curl git make build-base automake autoconf readline readline-dev gettext openssl openssl-dev libevent libevent-dev linux-headers jq && \
    git clone https://github.com/coturn/coturn /build && \
    cd /build && \
    ./configure --prefix=/app && \
    make install && \
    rm -fr /build && \
    apk del linux-headers libevent-dev openssl-dev readline-dev automake autoconf build-base make git && \
    rm -rf /var/cache/apk/*

WORKDIR /app

ADD coturn.sh /coturn.sh
RUN chmod u+rx /coturn.sh

CMD /coturn.sh