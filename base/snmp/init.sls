install_snmp:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - net-snmp
      - net-snmp-utils
    {% endif %}

rename_snmpd:
  file.rename:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/snmp/snmpd.conf.orig
    - source: /etc/snmp/snmpd.conf
    - unless: /etc/snmp/snmpd.conf.orig
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
    - watch:
      - file: /etc/snmp/snmpd.conf