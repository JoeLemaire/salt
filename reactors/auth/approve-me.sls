# This tells the reactor system to change the approved list, so that the newly created salt-minion can have it's key accepted.
# Arguments:
#  tgt="<server_name>"
#  secretkey="<secret_key>" (see below) 
# Example:
#  This appends the 'VIPMonitor' server name to the approved file 
#  curl -H "Accept: application/json" -d tgt='VIPMonitor' -d secretkey="replacethiswithsomethingbetter" -k https://salt.vtinfo.com:9090/hook/auth/approve-me
#

{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "replacethiswithsomethingbetter" %}
/etc/salt/to_be_approved_minions:
  file.append: 
    - name: /etc/salt/to_be_approved_minions
    - text: | 
      {{ postdata.tgt }}
{% endif %}