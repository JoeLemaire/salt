
'''
This module will be used to return the IPv4 information, which can then be evaulated by a state file
'''
from __future__ import absolute_import
import logging
import salt
import salt.modules.network

LOG = logging.getLogger(__name__)

__virtualname__ = 'ipv4'

def get_eth0():
    '''
    Returns the IPv4 IP address
    '''
    return __grains__['ip4_interfaces']['eth0']


def in_vt():

    ip = get_eth0
    vt1 = salt[network.ip_in_subnet](ip,192.168.0.0/16)
    vt2 = salt[network.ip_in_subnet](ip,172.25.250.0/24)

    if vt1|vt2 = True:
        return True
    else 
        return False