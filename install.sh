#!/bin/bash
PKG_VER=1.66.2
PKG_ZIP_NAME=tailscale-$PKG_VER.zip
PKG_ZIP_URL=https://cdn.jsdelivr.net/gh/requireCool/tailscale-alpine@master/packages/$PKG_ZIP_NAME

wget $PKG_ZIP_URL
if [ ! -n $PKG_ZIP_NAME ]; then
  echo "archive not exist"
  exit 1
fi

unzip $PKG_ZIP_NAME -d tailscale-$PKG_VER

service tailscale stop
find ./tailscale-$PKG_VER -name "*.apk" | xargs apk add --allow-untrusted
service tailscale start

rm -f $PKG_ZIP_NAME
rm -rf tailscale-$PKG_VER
