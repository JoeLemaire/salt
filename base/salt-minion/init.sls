
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
  cmd.run:
    - creates: /etc/salt/minion_id

salt_service:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - pkg: salt-minion
      - file: /etc/salt/minion.d/master.conf
      - file: /etc/salt/minion_id