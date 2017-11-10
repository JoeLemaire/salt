# This will install the packages
install_packages:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - vim-enhanced
      - htop
      - tcpdump
      - wget
    {% endif %}

# This installs mlocate and updates the local DB that locate uses
install_mlocate:
  pkg.installed: 
    - mlocate
  cmd.run:
    - name: updatedb
    - require:
      - pkg: mlocate
    - onchanges:
      - pkg: mlocate