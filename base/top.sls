base:
  'os:Centos':
    - match: grain
    - local_repo
    - locate
    - ntp
    - salt-minion
    - snmp
    - haproxy