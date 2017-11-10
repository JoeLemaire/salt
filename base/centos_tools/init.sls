# This will install the packages
install_packages:
  pkg.installed:
    {% if grains['os'] == 'CentOS'%}
    - pkgs: 
      - vim-enhanced
      - mlocate
      - htop
      - tcpdump
      - wget
    {% endif %}

# This installs mlocate and updates the local DB that locate uses
install_mlocate:
  cmd.run:
    - name: updatedb
    - unless: which locate
    - require:
      - pkg: mlocate
    - reload_modules: True