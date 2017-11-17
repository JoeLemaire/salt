base:
  'os:Centos':
    - match: grain
    - local_repo
    - install_centos_tools
    - ntp
    - salt-minion
    - snmp

  '*RP* and G@os:Centos':
    - match: compound
    - install_haproxy

  '*LogData* and G@os:Centos':
    - match: compound
    - install_elasticsearch