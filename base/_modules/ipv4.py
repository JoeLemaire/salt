'''
This module will be used to return the IPv4 information, which can then be evaulated by a state file
'''

from __future__ import absolute_import
import logging
import salt
import salt.modules.network
'''
Importing modules:
Reference: http://intothesaltmine.readthedocs.io/en/latest/chapters/development/writing-modules.html#imports
'''


LOG = logging.getLogger(__name__)

__virtualname__ = 'ipv4'''

def get_eth0():
    '''Returns the IPv4 IP address'''
    return __grains__['ip4_interfaces']['eth0']

def in_vt():
    '''Determines if the server is in VT or not'''
    ip = get_eth0()
    if __salt__['network.ip_in_subnet'](ip,'192.168.0.0/16'):
        return True
    elif __salt__['network.ip_in_subnet'](ip,'172.25.250.0/24'):
        return True
    else:
        return False

def in_ma():
    '''Determines if the server is in VT or not'''
    ip = get_eth0()
    if __salt__['network.ip_in_subnet'](ip,'172.20.0.0/16'):
        return True
    else:
        return False
