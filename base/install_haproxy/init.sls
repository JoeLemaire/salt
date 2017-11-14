


# Install HAProxy
{% if pkg.version != 'httpd'%}
install_haproxy:
  pkg.installed:
    - pkgs: 
      - haproxy
      - keepalived
    - unless:
      - rpm -q httpd
      - systemctl status httpd
{% endif %}

# Reload service if conf file changed

{% for service in 'haproxy', 'keepalived' %}
restart_service:
  service.running:
    - name: {{ service }}
    - enable: True
    - reload: True
    - watch:
      - pkg: {{ service }}
{% endfor %}

# Add custom grain as a marker for haproxy servers
# Make sure to trigger refresh when adding grain