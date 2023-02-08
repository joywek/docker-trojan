FROM golang:alpine3.13 AS builder

WORKDIR /

RUN set -ex \
    && apk add --no-cache git make \
    && git clone https://github.com/p4gefau1t/trojan-go.git \
    && cd trojan-go \
    && make

FROM alpine

WORKDIR /

RUN apk add --no-cache tzdata ca-certificates
COPY --from=builder /trojan-go/build/trojan-go /usr/local/bin/
COPY ./server.json /etc/trojan-go/config.json

ENV TZ=Asia/Shanghai

ENTRYPOINT ["/usr/local/bin/trojan-go", "-config"]
CMD ["/etc/trojan-go/config.json"]