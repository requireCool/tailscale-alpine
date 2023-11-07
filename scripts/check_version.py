import os
import requests


tailscale_latest_release_url = 'https://api.github.com/repos/tailscale/tailscale/releases/latest'
version = requests.get(tailscale_latest_release_url).json()['name']
print('current latest version: ' + version)

if version == '1.52.1':
  os.setenv('HAS_UPDATE', 'false')
else:
  os.setenv('HAS_UPDATE', 'true')
