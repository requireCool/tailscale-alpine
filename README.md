[![CI](https://github.com/requireCool/tailscale-alpine/actions/workflows/build.yml/badge.svg)](https://github.com/requireCool/tailscale-alpine/actions/workflows/build.yml)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/requireCool/tailscale-alpine/master?logo=github&label=Last%20Commit&labelColor=%23363636)

# tailscale-alpine

All build scripts will auto sync with alpine package repository.

Packages are built by Github Actions, and archives are available in 'packages' directory.

Due to lack of signature, apks only can be installed with args --allow-untrusted

Simply use:

```shell
curl https://cdn.jsdelivr.net/gh/requireCool/tailscale-alpine@master/scripts/install.sh | sh
```
