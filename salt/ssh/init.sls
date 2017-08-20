openssh-server:
  pkg.installed:
    - refresh: False

  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/ssh/sshd_config

  service.running:
    - name: ssh
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config
      - pkg: openssh-server

