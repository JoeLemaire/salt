#!/usr/bin/env python
'''
File: # base\_grains\rp_type.py
Description: This determines whether a reverse proxy is HAProxy-based or Apache-based 
'''

from __future__ import absolute_import
import logging
import salt
import os
import salt.modules.yumpkg


def _get_os():
    return salt['grains.get']('os')

def _get_haproxy_ver():
    return __grains__['os']

def _get_apache_ver():
    return __grains__['os']
'''
def proxy_type():

    os_family = _get_os()

    grains = {}
    if os_family == 'CentOS':
        grains['proxy_type'] = 'Centos!'
'''        
    '''
    #if (__grains__['os'] == 'CentOS' and __salt__['pkg.version'] == 'haproxy' and __salt__['pkg.version'] != 'httpd'):.
    if __grains__['os'] == 'CentOS':
        grains['proxy_type'] = 'haproxy'

    elif (__grains__['os'] == 'CentOS' and __salt__['pkg.version'] == 'httpd' and __salt__['pkg.version'] != 'haproxy'):
        return {'proxy_type':'apache'}
    else:
        return {'proxy_type:'natta'}
    '''

    
    return grains