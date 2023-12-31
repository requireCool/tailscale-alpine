cd src

# load tun
doas mkdir -p /dev/net
doas mknod /dev/net/tun c 10 200
doas chmod 666 /dev/net/tun

# replace version if needed
if [[ "pkgver=$PKGVER" != $(cat APKBUILD | grep "pkgver=") ]]; then
    echo "set pkgver to $PKGVER"
    doas sed -i "s/pkgver=.*/pkgver=$PKGVER/g" APKBUILD
fi
if [[ "pkgrel=$PKGREL" != $(cat APKBUILD | grep "pkgrel=") ]]; then
    echo "set pkgrel to $PKGREL"
    doas sed -i "s/pkgrel=.*/pkgrel=$PKGREL/g" APKBUILD
fi

# skip go test
# sed -i 's/go test/msg2 "Skip check..."\n# &/' APKBUILD

# run abuild
doas abuild-keygen -a -i -n
doas abuild -F checksum && doas abuild -F -r

# copy apk packages
cd ..
cp /github/home/packages/workspace/x86_64/*.apk packages
