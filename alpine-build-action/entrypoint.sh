cd src

# load tun
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 666 /dev/net/tun

# replace version if needed
if [[ "pkgver=$PKGVER" != $(cat APKBUILD | grep "pkgver=") ]]; then
    echo "set pkgver to $PKGVER"
    sed -i "s/pkgver=.*/pkgver=$PKGVER/g" APKBUILD
fi
if [[ "pkgrel=$PKGREL" != $(cat APKBUILD | grep "pkgrel=") ]]; then
    echo "set pkgrel to $PKGREL"
    sed -i "s/pkgrel=.*/pkgrel=$PKGREL/g" APKBUILD
fi

# skip go test
sed -i 's/go test/msg2 "Skip check..."\n# &/' APKBUILD

# run abuild
abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

# copy apk packages
PKG_DIR=/github/workspace/packages
if [[ ! -d $PKG_DIR]]; then
    mkdir $PKG_DIR
fi
cp /github/home/packages/workspace/x86_64/*.apk $PKG_DIR
