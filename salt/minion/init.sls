/etc/salt/minion.d:
  file.recurse:
    - source: salt://minion/minion.d
    - user: root
    - group: root
    - clean: True

