FROM alpine:latest
COPY . /env
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo 'https://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    apk update && \
    apk add sudo alpine-sdk go && \
    chmod +x /env/entrypoint.sh
RUN mkdir -p /dev/net &&\
    mknod /dev/net/tun c 10 200 &&\
    chmod 600 /dev/net/tun &&\
    cat /dev/net/tun
ENTRYPOINT /env/entrypoint.sh
