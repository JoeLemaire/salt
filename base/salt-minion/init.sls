
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
  cmd.run:
    - creates: /etc/salt/minion_id

salt_service:
  service.running:
    - name: salt-minion
    - enable: True
    - reload: True
    - watch:
      - file: /etc/salt/minion_id
#      - file: /etc/salt/minion.d/master.conf
