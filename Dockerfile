FROM golang:1.15-alpine AS build
RUN apk add -U git musl-dev
RUN go get github.com/rakyll/hey

FROM alpine:3.12

RUN apk add -U bash curl drill findutils iputils jq mtr netcat-openbsd sudo tcpdump
RUN curl -L https://github.com/fullstorydev/grpcurl/releases/download/v1.7.0/grpcurl_1.7.0_linux_x86_64.tar.gz | tar -C /usr/local/bin -xz grpcurl
COPY --from=build /go/bin/hey /usr/local/bin/

COPY install-gcloud.sh install-vault.sh /usr/local/bin/

RUN adduser -D -u 1000 toolbox && echo 'toolbox ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/toolbox
USER toolbox
WORKDIR /home/toolbox
COPY toolbox.sh /etc/profile.d/
