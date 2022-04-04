FROM alpine:3.15

RUN apk add -U bash curl drill findutils hey iputils jq mtr netcat-openbsd sudo tcpdump

COPY install-gcloud.sh /usr/local/bin/

RUN adduser -D -u 1000 toolbox && echo 'toolbox ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/toolbox
USER toolbox
WORKDIR /home/toolbox
COPY toolbox.sh /etc/profile.d/
