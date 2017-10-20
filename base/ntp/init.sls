install_ntp:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - ntp
    {% endif %}

ntp_conf:
  file.managed:
    {%- if ipv4.in_vt %}
    - name: /etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://ntp/templates/vt_ntp.conf
    {%- elif ipv4.in_ma %}
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