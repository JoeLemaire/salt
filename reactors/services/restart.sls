{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "replacethiswithsomethingbetter" %}
restart_services:
  cmd.service.restart:
    - tgt: '{{ postdata.tgt }}'
    - arg:
      - {{ postdata.service }}
{% endif %}