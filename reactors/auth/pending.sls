# This accepts a salt-key request automatically
# Arguments:
#  <none>
# Example:
#  <none>
#  

# List of minion public keys to automatically accept:
#{%- set accepted_keys = [ "<removed>"] -%}

{% if 'act' in data and data['act'] == 'pend' %}
minion_add:
  wheel.key.accept:
    - kwarg:
        match: {{ data['id'] }}
{% endif %}