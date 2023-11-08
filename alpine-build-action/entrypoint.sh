echo $PKGVER
echo $PKGREL
sed -i "s/pkgver=.*/pkgver=$PKGVER/g" APKBUILD
sed -i "s/pkgrel=.*/pkgrel=$PKGREL/g" APKBUILD
cat APKBUILD

abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

mkdir packages
cp /github/home/packages/github/x86_64/*.apk packages
