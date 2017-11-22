# Install ntpd
install_ntp:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - ntp: 4.2.6p5-25.el7.centos.2
    - allow_updates: True
  service.running:
    - name: ntpd
    - enable: True
    {% endif %}

# Push out conf file
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

# Restart service if ntp.conf file changed
ntpd_restart:
  cmd.run:
    - name: systemctl restart ntpd
    - watch:
      - file: ntp_conf