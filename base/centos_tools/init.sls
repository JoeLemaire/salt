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
      - bind-utils
    {% endif %}

# This installs mlocate and updates the local DB that locate uses
run_updatedb:
  cmd.run:
    - name: updatedb
    - onlyif: which locate
    - creates: /var/lib/mlocate/mlocate.db
    - reload_modules: True