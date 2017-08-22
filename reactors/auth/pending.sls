# This accepts a salt-key request
# Arguments:
#  tgt="<server_name>"
#  service="<service_name>"
#  secretkey="<secret_key>" (see below) 
# Example:
#  This restarts the ntpd service on VIPMonitor
#  curl -H "Accept: application/json" -d tgt='VIPMonitor' -d service="ntpd" -d secretkey="replacethiswithsomethingbetter" -k https://salt.vtinfo.com:9090/hook/services/restart
#

{% set postdata = data.get('post', {}) %}

{# Ink server is sending new key -- accept this key #}
{% if 'act' in data and data['act'] == 'pend' and data['id'].startswith('ink') %}
minion_add:
  wheel.key.accept:
    - match: {{ data['id'] }}
{% endif %}