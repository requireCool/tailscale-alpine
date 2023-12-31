FROM alpinelinux/alpine-gitlab-ci:latest
COPY . /env
RUN doas chmod +x /env/entrypoint.sh
ENTRYPOINT /env/entrypoint.sh
