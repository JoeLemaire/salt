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
      - net-tools
    {% endif %}

# This installs mlocate and updates the local DB that locate uses
run_updatedb:
  cmd.run:
    - name: updatedb
    - onlyif: which locate
    - creates: /var/lib/mlocate/mlocate.db
    - reload_modules: True

# Upgrade these due to known issues
# https://access.redhat.com/solutions/2080483
upgrade_packages:
  pkg.latest:
    - pkgs:
      - ebtables: '<2.0.10-15.el7'
      - wpa_supplicant: '<1:2.6-5.el7_4.1'
      - audit: '<2.7.6-3.el7'
    - only_upgrade: True