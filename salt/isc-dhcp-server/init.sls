isc-dhcp-server:
  pkg.installed:
    - refresh: False

  file.managed:
    - name: /etc/default/isc-dhcp-server
    - source: salt://isc-dhcp-server/isc-dhcp-server

  service:
    - running
    - enable: True
    - restart: True
    - watch:
      - file: /etc/dhcp
      - file: /etc/default/isc-dhcp-server
      - pkg: isc-dhcp-server

/etc/dhcp:
  file.recurse:
    - source: salt://isc-dhcp-server/dhcp
    - user: root
    - group: root
    - clean: False
  require:
    - pkg: isc-dhcp-server

