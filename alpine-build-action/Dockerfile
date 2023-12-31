FROM alpinelinux/alpine-gitlab-ci:latest
COPY . /env
RUN doas echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    doas echo 'https://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    doas apk update && \
    doas apk add sudo alpine-sdk go && \
    doas chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
