# Install HAProxy
install_haproxy:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - haproxy
      - keepalived
    - unless:
      - rpm -q httpd
      - systemctl status httpd
    {% endif %}

# Install required certs
ssl_certs:
  file.recurse:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/haproxy/ssl_cert
    - dir_mode: 700
    - file_mode: 600
    - makedirs: true
    - source: salt://haproxy/ssl_cert
    - require:
      - pkg: install_haproxy
    {% endif %}

# Update existing config (if needed) with new certs
update_conf_cert:
  file.replace:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/haproxy/haproxy.cfg
    - pattern: "/ssl_2015/star_vtinfo_com.pem"
    - repl: "/ssl_cert/star_vtinfo_com_2015.pem"
    - ignore_if_missing: True     
    {% endif %}

# Reload service if conf file changed
haproxy_service:
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - watch:
      - file: /etc/haproxy/haproxy.cfg