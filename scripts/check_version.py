import os
import re
import requests

def write_output(key: str, value: str):
  os.system(f'echo "{key}={value}" >> $GITHUB_OUTPUT')


tailscale_latest_release_url = 'https://api.github.com/repos/tailscale/tailscale/releases/latest'
remote_version = requests.get(tailscale_latest_release_url).json()['name']
print('Latest remote version:', remote_version)

build_version = ''
if os.path.exists('packages'):
  dirs = os.listdir('packages')
  dirs.sort(reverse=True)
  build_version = dirs[0]
  print('All dirs in packages:', dirs)
  print('Latest build version:', build_version)

if remote_version == build_version:
  write_output('has_update', 'false')
else:
  write_output('has_update', 'true')
  write_output('pkgver', remote_version)
