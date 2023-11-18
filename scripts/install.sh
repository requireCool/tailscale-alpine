#!/bin/bash
if command -v unzip > /dev/null 2>&1 ; then
  apk update && apk add unzip
fi

if command -v wget > /dev/null 2>&1 ; then
  apk update && apk add wget
fi


PKG_ZIP_URL=https://cdn.jsdelivr.net/gh/requireCool/tailscale-alpine@master/packages/tailscale-1.54.0.zip

wget $PKG_ZIP_URL -O tailscale.zip
unzip tailscale.zip

service tailscale stop
find . -name *.apk | xargs apk add --allow-untrusted
service tailscale start

rm -f tailscale.zip
