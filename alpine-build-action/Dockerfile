FROM alpine:latest
COPY . /env
RUN apk update && \
    apk add sudo alpine-sdk && \
    chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
