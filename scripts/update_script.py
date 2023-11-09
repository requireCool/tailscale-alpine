import os
import re
import requests


VERSION = os.environ.get('PKGVER')
INSTALL_SH = 'scripts/install.sh'


with open(INSTALL_SH, 'r') as f:
    f_read = f.read()

zip_url = f'https://github.com/requireCool/tailscale-alpine/raw/master/packages/{VERSION}/tailscale-{VERSION}.zip'
new_content = re.sub('PKG_ZIP_URL=.*', f'PKG_ZIP_URL={zip_url}', f_read)

with open(INSTALL_SH, 'w') as f:
    f.write(new_content)
