FROM alpine:latest
COPY . /env
RUN apk update && \
    apk add sudo alpine-sdk 'go>1.21' && \
    chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
