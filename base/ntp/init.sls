install_ntp:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - ntp
    {% endif %}

ntp_conf:
  file.managed:
    {% if grains['ip4_interfaces'].eth0[0] | regex_match('192.168.*') %}
    - name: /etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://ntp/templates/vt_ntp.conf
    {% elif grains['ip4_interfaces'].eth0[0] | regex_match('172.20.*') %}   
    - name: /etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://ntp/templates/ma_ntp.conf
    {% endif %}

ntp_service:
  service.running:
    - name: ntp
    - enable: True