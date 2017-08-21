bind9:
  pkg.installed:
    - refresh: False

  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/bind
      - pkg: bind9

/etc/bind:
  file.recurse:
    - source: salt://bind9/bind
    - user: root
    - group: bind
    - clean: False
  require:
    - pkg: bind9

