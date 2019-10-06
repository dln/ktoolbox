FROM golang:1.13-alpine AS build
RUN apk add -U git musl-dev
RUN go get github.com/rakyll/hey

FROM alpine

RUN apk add -U bash curl drill findutils iputils mtr netcat-openbsd sudo tcpdump
RUN curl -L https://github.com/fullstorydev/grpcurl/releases/download/v1.4.0/grpcurl_1.4.0_linux_x86_64.tar.gz | tar -C /usr/local/bin -xz grpcurl
COPY --from=build /go/bin/hey /usr/local/bin/

RUN adduser -D -u 1000 toolbox && echo 'toolbox ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/toolbox
USER toolbox
WORKDIR /home/toolbox
COPY bashrc .bashrc
