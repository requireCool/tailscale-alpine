import os
import re
import requests

def write_output(key: str, value: str):
  os.system(f'echo "{key}={value}" >> $GITHUB_OUTPUT')


tailscale_latest_release_url = 'https://api.github.com/repos/tailscale/tailscale/releases/latest'
remote_version = requests.get(tailscale_latest_release_url).json()['name']

with open('README.md', 'r') as f:
  build_version = re.findall(r'Latest build version: ([0-9.]+)', f.read())[0]

if remote_version == build_version:
  write_output('has_update', 'false')
else:
  write_output('has_update', 'true')
  write_output('pkgver', remote_version)
