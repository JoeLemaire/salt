base:
  'os:Centos':
    - match: grain
    - local_repo
    - centos_tools
    - ntp
    - salt-minion
    - snmp

  '*RP* and '
    - match: compound
    - haproxy