git-daemon-sysvinit:
  pkg.installed:
    - refresh: False

  file.managed:
    - name: /etc/default/git-daemon
    - source: salt://git-daemon/git-daemon

  service:
    - running
    - name: git-daemon
    - enable: True
    - restart: True
    - watch:
      - file: /etc/default/git-daemon
      - pkg: git-daemon-sysvinit

git:
  user.present:
    - fullname: Git Shell
    - shell: /usr/bin/git-shell
    - home: /var/lib/git

/var/lib/git/.ssh/authorized_keys:
  file.managed:
    - source: salt://git-daemon/authorized_keys
    - makedirs: True
    - dir_mode: 0700
    - mode: 664
    - user: git
    - group: git
    - require:
      - user: git

/var/lib/git/git-shell-commands:
  file.directory:
    - user: git
    - group: git
    - require:
      - user: git

