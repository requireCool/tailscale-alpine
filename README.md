# tailscale-alpine

All build scripts will auto sync with alpine package repository.

Packages are built by Github Actions, and archives are available in 'packages' directory.

Due to lack of signature, apks only can be installed with args --allow-untrusted

Simply use:
`curl https://cdn.jsdelivr.net/gh/requireCool/tailscale-alpine@master/scripts/install.sh | sh`
