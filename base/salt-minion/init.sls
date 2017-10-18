#addrepo_salt:
#  pkgrepo.managed:
#    {% if grains['os'] == 'CentOS'%}
#    - name: saltstack-repo
#    - humanname: SaltStack repo for Red Hat Enterprise Linux $releasever
#    - baseurl: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest
#    - enabled: True
#    - gpgcheck: 1
#    - gpgkey: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/SALTSTACK-GPG-KEY.pub
#    {% endif %}

install_saltminion:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - salt-minion
      {% endif %}

master_conf:
  file.managed:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/salt/minion.d/master.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt-minion/templates/master.conf
    {% endif %}

hostnamectl status --static > /etc/salt/minion_id:
  {% if grains['os'] == 'CentOS'%}
  cmd.run
  {% endif %}

salt_service:
  service.running:
    {% if grains['os'] == 'CentOS'%}
    - name: salt-minion
    - enable: True
    {% endif %}