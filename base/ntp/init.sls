install_ntp:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - ntp: 4.2.6p5-25.el7.centos.2
    - allow_updates: True
    {% endif %}

ntp_conf:
  file.managed:
    {%- if salt['ipv4.in_vt'] %}
    - name: /etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://ntp/templates/vt_ntp.conf
    {%- elif salt['ipv4.in_ma'] %}
    - name: /etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://ntp/templates/ma_ntp.conf
    {% endif %}

#ntp_service_stop:
#  service.dead:
#    - name: ntpd
#    - enable: True
#    - reload: True
#    - watch:
#      - file: /etc/ntp.conf

ntp_service_start:
  service.running:
    - name: ntpd
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ntp.conf