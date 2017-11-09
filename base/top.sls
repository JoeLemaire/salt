base:
  'os:Centos':
    - match: grain
    - local_repo
    - centos_tools
    - ntp
    - salt-minion
    - snmp

  '*RP* and G@os:Centos':
    - match: compound
    - haproxy