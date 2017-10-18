vtviplocalrepo_conf:
  file.managed:
    - name: /etc/yum.repos.d/vtviplocalrepo.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://local_repo/templates/vtviplocalrepo.conf

rename_base:
  file.rename:
    - name: /etc/yum.repos.d/CentOS-Base.repo.old
    - source: /etc/yum.repos.d/CentOS-Base.repo

rename_epel:
  file.rename:
    - name: /etc/yum.repos.d/epel.repo.old
    - source: /etc/yum.repos.d/epel.repo