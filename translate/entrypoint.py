#!env /usr/bin/python3

import configparser
import sys
import subprocess
import os

if __name__ == '__main__':
    token = os.environ.get('TRANSIFEX_API_TOKEN')
    if not token:
        print('not set TRANSIFEX_API_TOKEN environment variable')
        exit(1)
    if 0 == len(token):
        print('set workdir and token.')
        exit(1)
    config = configparser.ConfigParser()
    config.read('.tx/deepin.conf')
    branch = config['transifex']['branch']
    subprocess.run(['tx', 'pull', '--branch', branch])
