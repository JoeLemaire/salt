base:
  'os:Centos':
    - match: grain
    - local_repo
    - salt-minion
    - ntp