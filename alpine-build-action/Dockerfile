FROM alpine:latest
COPY . /env
COPY ../* /workdir
RUN apk update && \
    apk add sudo alpine-sdk && \
    chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
