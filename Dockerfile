FROM alpine
RUN apk add -U bash curl drill findutils mtr tcpdump
ADD entrypoint.sh /
ADD bashrc /root/.bashrc
ENTRYPOINT ["/entrypoint.sh"]
