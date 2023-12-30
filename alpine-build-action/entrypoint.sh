# load tun
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 666 /dev/net/tun
ls /dev/net && cat /dev/net/tun

# run abuild
cd src
abuild-keygen -a -i -n
abuild -F checksum && abuild -F -r

# copy apk packages
mkdir packages
find / -name tailscale-*.apk -exec cp {} packages \;
