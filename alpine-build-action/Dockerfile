FROM alpinelinux/alpine-gitlab-ci:latest
COPY . /env
RUN chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
