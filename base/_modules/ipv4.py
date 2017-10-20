'''
This module will be used to return the IPv4 information, which can then be evaulated by a state file
'''
__virtualname__ = 'ipv4'

import salt

def get_eth0():
	'''
	Returns the IPv4 IP address
	'''
    return __grains__['ip4_interfaces']