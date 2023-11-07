echo "list env"
ls /env
echo "list current dir"
ls

abuild -F checksum && abuild -F -r
ls
