install_snmp:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - net-snmp
      - net-snmp-utils
    {% endif %}

snmpd_conf:
  file.managed:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/snmp/snmpd.conf
    - user: root
    - group: root
    - mode: 600
    - source: salt://snmp/templates/snmpd.conf
    {% endif %}

snmpd_service:
  service.running:
    - name: snmpd
    - enable: True
    - reload: True
    - watch:
      - file: /etc/snmp/snmpd.conf