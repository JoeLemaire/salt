install_mlocate:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - mlocate
    {% endif %}

updatedb:
  {% if grains['os'] == 'CentOS'%}
  cmd.run
  {% endif %}