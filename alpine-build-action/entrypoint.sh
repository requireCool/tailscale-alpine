echo "list env"
ls /env
echo "list workdir"
ls /workdir

cd /workdir
abuild checksum && abuild -r
ls
