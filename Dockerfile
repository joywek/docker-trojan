FROM golang:alpine3.13 AS builder

WORKDIR /root

RUN set -ex \
    && apk add --no-cache git make \
    && git clone https://github.com/p4gefau1t/trojan-go.git \
    && cd trojan-go \
    && make

FROM alpine

WORKDIR /root

RUN apk add --no-cache tzdata ca-certificates
COPY --from=builder /root/trojan-go/build/trojan-go /usr/local/bin/

ENV TZ=Asia/Shanghai
