def get_ipv4(eth0):
    return __grains__['ip4_interfaces'](eth0)