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

master_conf:
  file.managed:
    - name: /etc/salt/minion.d/master.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt-minion/templates/master.conf

hostnamectl status --static > /etc/salt/minion_id:
  cmd.run

echo {{ pillar['key'] }} > /etc/salt/testkey:
  cmd.run

salt_service:
  service.running:
    - name: salt-minion
    - enable: True