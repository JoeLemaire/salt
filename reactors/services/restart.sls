# This restarts a service on a server
# Arguments:
#  tgt="<server_name>"
#  service="<service_name>"
#  secretkey="<secret_key>" (see below) 
# Example:
#  This restarts the ntpd service on VIPMonitor
#  curl -H "Accept: application/json" -d tgt='VIPMonitor' -d service="ntpd" -d secretkey="replacethiswithsomethingbetter" -k https://salt.vtinfo.com:9090/hook/services/restart
#

{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "replacethiswithsomethingbetter" %}
restart_services:
  cmd.service.restart:
    - tgt: '{{ postdata.tgt }}'
    - arg:
      - {{ postdata.service }}
{% endif %}