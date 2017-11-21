# Install Elasticsearch
install_elasticsearch:
  pkg.installed:
    - pkgs: 
      - elasticsearch

# This is all the elasticsearch settings
elasticsearch_yml:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml
    - user: root
    - group: elasticsearch
    - mode: 660
    - source: salt://install_elasticsearch/templates/elasticsearch.yml

# This is all the elasticsearch settings
log4j2_properties:
  file.managed:
    - name: /etc/elasticsearch/log4j2.properties
    - user: root
    - group: elasticsearch
    - mode: 660
    - source: salt://install_elasticsearch/templates/log4j2.properties


# This sets the recommended service overrides for the elasticsearch service
elasticsearch_conf:
  file.managed:
    - name: /etc/systemd/system/elasticsearch.service.d/elasticsearch.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://install_elasticsearch/templates/elasticsearch.conf

# This sets the recommended java settings for the elasticsearch service
jvm_options:
  file.managed:
    - name: /etc/elasticsearch/jvm.options
    - user: root
    - group: elasticsearch
    - mode: 660
    - source: salt://install_elasticsearch/templates/jvm.options

# This sets the recommended server limits for the elasticsearch service
limits_conf:
  file.managed:
    - name: /etc/security/limits.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://install_elasticsearch/templates/limits.conf

# Make sure max_map_count is large enough
# https://www.elastic.co/guide/en/elasticsearch/reference/5.4/_maximum_map_count_check.html
sysctl -w vm.max_map_count=262144:
  cmd.run:
    - onlyif:
      - grep 262144 /proc/sys/vm/max_map_count

# Configure virtual memory
# https://www.elastic.co/guide/en/elasticsearch/reference/5.4/vm-max-map-count.html
sysctl -w vm.max_map_count=262144:
  cmd.run:
    - onlyif:
      - grep 262144 /proc/sys/vm/max_map_count

# Perform a daemon-reload
service.systemctl_reload:
  module.run:
    - onchanges:
      - file: /etc/systemd/system/unbound.service


elasticsearch_service:
  service.running:
    - name: elasticsearch
    - enable: True
    - reload: True
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml