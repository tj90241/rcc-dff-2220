unattended-upgrades:
  pkg.installed:
    - refresh: False

/etc/apt/apt.conf.d:
  file.recurse:
    - source: salt://apt/apt.conf.d
    - template: jinja
    - clean: False

