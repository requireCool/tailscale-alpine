import os
import requests
from bs4 import BeautifulSoup


has_update = False


def write_output(key: str, value: str):
    os.system(f'echo "{key}={value}" >> $GITHUB_OUTPUT')


def check_update():
    global has_update

    tailscale_latest_release_url = 'https://api.github.com/repos/tailscale/tailscale/releases/latest'
    remote_version = requests.get(tailscale_latest_release_url).json()['name']
    print('latest remote version:', remote_version)

    build_version = ''
    if os.path.exists('packages'):
        dirs = os.listdir('packages')
        dirs.sort(reverse=True)
        if len(dirs) > 0:
            build_version = dirs[0].split('-')[1].rstrip('.zip')
            print('all files in "packages":', dirs)
            print('latest build version:', build_version)

    if remote_version == build_version:
        write_output('has_update', 'false')
    else:
        has_update = True
        write_output('has_update', 'true')
        write_output('pkgver', remote_version)


def sync_files_with_upstream():
    base_url = 'https://git.alpinelinux.org/aports/plain/community/tailscale'
    bs = BeautifulSoup(requests.get(base_url).text, 'html.parser')
    file_list = [li.text for li in bs.find_all('li')]
    file_list.remove('../')

    for file_name in file_list:
        with open(f'src/{file_name}', 'wb') as f:
            f.write(requests.get(base_url + '/' + file_name).content)
        print(f'Sync {file_name} with upstream success.')


if __name__ == '__main__':
    check_update()
    if has_update:
        sync_files_with_upstream()
