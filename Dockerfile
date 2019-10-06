FROM alpine
RUN apk add -U bash curl drill findutils mtr tcpdump
RUN curl -L https://github.com/fullstorydev/grpcurl/releases/download/v1.4.0/grpcurl_1.4.0_linux_x86_64.tar.gz | tar -C /usr/local/bin -xz grpcurl
ADD entrypoint.sh /
ADD bashrc /root/.bashrc
ENTRYPOINT ["/entrypoint.sh"]
