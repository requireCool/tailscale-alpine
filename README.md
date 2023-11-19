# tailscale-alpine

All build scripts came from alpine package repository.

Packages are built by Github Actions, and available in 'packages' directory.

Due to lack of signature, apks only can be installed with args --allow-untrusted

Simply use:
`curl https://cdn.jsdelivr.net/gh/requireCool/tailscale-alpine@master/scripts/install.sh | sh`
