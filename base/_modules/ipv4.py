def get_ipv4():
    return __grains__['ip4_interfaces'](eth0)