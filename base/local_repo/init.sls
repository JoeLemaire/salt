vtviplocalrepo_conf:
  file.managed:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/yum.repos.d/vtviplocalrepo.repo
    - user: root
    - group: root
    - mode: 644
    - source: salt://local_repo/templates/vtviplocalrepo.repo
    {% endif %}

rename_base:
  file.rename:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/yum.repos.d/CentOS-Base.repo.old
    - source: /etc/yum.repos.d/CentOS-Base.repo
    {% endif %}

rename_epel:
  file.rename:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/yum.repos.d/epel.repo.old
    - source: /etc/yum.repos.d/epel.repo
    {% endif %}

yum clean all:
  {% if grains['os'] == 'CentOS'%}
  cmd.run
  {% endif %}