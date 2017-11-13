'''
File: # base\_grains\rp_type.py
Description: This determines whether a reverse proxy is HAProxy-based or Apache-based 
'''

from __future__ import absolute_import
import logging
import salt
import salt.modules.yumpkg


def proxy_type():
    grains = {}
    if (__grains__['os'] == 'CentOS' and __salt__['pkg.version'] == 'haproxy' and __salt__['pkg.version'] != 'httpd'):
        grains['proxy_type'] = 'haproxy'
        return grains
    elif (__grains__['os'] == 'CentOS' and __salt__['pkg.version'] == 'httpd' and __salt__['pkg.version'] != 'haproxy'):
        grains['proxy_type'] = 'apache'
        return grains