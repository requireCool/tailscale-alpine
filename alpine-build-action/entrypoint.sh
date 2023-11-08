echo $PKGVER
echo $PKGREL
sed -i "s/pkgver=.*/pkgver=$pkgver/g" APKBUILD
sed -i "s/pkgrel=.*/pkgrel=$pkgrel/g" APKBUILD
cat APKBUILD

abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

mkdir packages
cp /github/home/packages/github/x86_64/*.apk packages
