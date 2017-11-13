'''
File: # base\_grains\rp_type.py
Description: This determines whether a reverse proxy is HAProxy-based or Apache-based 
'''

from __future__ import absolute_import
import logging
import salt
import salt.modules.yumpkg


def proxy_type():
    if (__grains__['os'] == 'CentOS' and __salt__['pkg.version'] == 'haproxy' and __salt__['pkg.version'] != 'httpd'):
        return {'proxy_type':'haproxy'}
    elif (__grains__['os'] == 'CentOS' and __salt__['pkg.version'] == 'httpd' and __salt__['pkg.version'] != 'haproxy'):
        return {'proxy_type':'apache'}
    else:
        return {'proxy_type:'n/a'}