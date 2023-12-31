FROM alpinelinux/alpine-gitlab-ci:latest
COPY . /env
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo 'https://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    apk update && \
    apk add sudo alpine-sdk go && \
    chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
