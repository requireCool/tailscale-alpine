#!/bin/bash
if command -v unzip > /dev/null 2>&1 ; then
  apk update && apk add unzip
fi

if command -v unzip > /dev/null 2>&1 ; then
  apk update && apk add wget
fi


PKG_ZIP_URL=""

wget $PKG_ZIP_URL -O tailscale.zip
unzip tailscale.zip

find . -name *.apk | xargs apk add --allow-untrusted
