# This will install the packages
install_packages:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - mlocate
      - vim-enhanced
      - htop
      - tcpdump
      - wget
    {% endif %}

# This updates the local DB that locate uses
updatedb:
  cmd.run:
    - require:
      - pkg: mlocate
    - onchanges:
      - pkg: mlocate