addrepo_salt:
  pkgrepo.managed:
    - name: saltstack-repo
    - humanname: SaltStack repo for Red Hat Enterprise Linux $releasever
    - baseurl: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest
    - enabled: True
    - gpgcheck: 1
    - gpgkey: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/SALTSTACK-GPG-KEY.pub

  install_saltminion:
    pkg.installed:
      - pkgs: 
        - salt-minion