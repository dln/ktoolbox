FROM golang:1.13-alpine AS build
RUN apk add -U git musl-dev
RUN go get github.com/rakyll/hey

FROM alpine
RUN apk add -U bash curl drill findutils mtr netcat-openbsd tcpdump
RUN curl -L https://github.com/fullstorydev/grpcurl/releases/download/v1.4.0/grpcurl_1.4.0_linux_x86_64.tar.gz | tar -C /usr/local/bin -xz grpcurl
COPY --from=build /go/bin/hey /usr/local/bin/
COPY entrypoint.sh /
COPY bashrc /root/.bashrc
ENTRYPOINT ["/entrypoint.sh"]
