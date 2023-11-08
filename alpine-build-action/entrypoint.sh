echo $1
echo $2
sed -i "s/pkgver=.*/pkgver=$1/g" APKBUILD
sed -i "s/pkgrel=.*/pkgrel=$2/g" APKBUILD
cat APKBUILD

abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

mkdir packages
cp /github/home/packages/github/x86_64/*.apk packages
