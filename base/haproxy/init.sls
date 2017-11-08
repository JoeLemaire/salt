install_haproxy:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - haproxy
    {% endif %}

ssl_certs:
  file.recurse:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/haproxy/ssl_cert
    - dir_mode: 700
    - file_mode: 600
    - makedirs: true
    - source: salt://haproxy/ssl_cert
    {% endif %}

update_conf_cert:
  file.replace:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/haproxy/haproxy.cfg
    - pattern: {{ '/ssl_2015/star_vtinfo_com.pem' | escape_regex }}
    - repl: "/ssl_cert/star_vtinfo_com_2015.pem"
    {% endif %}

haproxy_service:
  service.running:
    - name: haproxy
    - enable: True
    - watch:
      - file: /etc/haproxy/haproxy.cfg