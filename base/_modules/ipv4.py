
'''
This module will be used to return the IPv4 information, which can then be evaulated by a state file
'''

import salt

def get_eth0():
    '''
    Returns the IPv4 IP address
    '''
    return __grains__['id']