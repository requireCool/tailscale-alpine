echo "list env"
ls /env
echo "list current dir"
ls

abuild-keygen -a -i -n
# export PACKAGER_PUBKEY="${ABUILD_DIR}/$(ls -1rt ${ABUILD_DIR} | grep \.rsa\.pub | tail -n 1 | tail -n 1)"

abuild -F checksum && abuild -F -r -P .
