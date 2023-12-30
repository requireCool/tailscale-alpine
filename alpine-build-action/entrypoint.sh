cd src
echo $PWD
abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

mkdir packages
find / -name tailscale-*.apk -exec cp {} packages \;
