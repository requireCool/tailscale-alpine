#!/bin/bash
if command -v unzip > /dev/null 2>&1 ; then
  apk update && apk add unzip
fi

if command -v unzip > /dev/null 2>&1 ; then
  apk update && apk add wget
fi


PKG_ZIP_URL=https://github.com/requireCool/tailscale-alpine/raw/master/packages/1.52.1/tailscale-1.52.1.zip

wget $PKG_ZIP_URL -O tailscale.zip
unzip tailscale.zip

service tailscale stop
find . -name *.apk | xargs apk add --allow-untrusted
service tailscale start
