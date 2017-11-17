# Install Elasticsearch
install_elasticsearch:
  pkg.installed:
    - pkgs: 
      - elasticsearch


#elasticsearch_service:
#  service.running:
#    - name: elasticsearch
#    - enable: True
#    - reload: True
#    - watch:
#      - file: /etc/elasticsearch/elasticsearch.yml