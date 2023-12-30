cd src
echo $PWD
abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

mkdir packages
cp /github/home/packages/github/x86_64/*.apk packages
