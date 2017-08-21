ntp:
  pkg.installed:
    - refresh: False

  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf

  service:
    - running
    - enable: True
    - restart: True
    - watch:
      - file: /etc/ntp.conf
      - pkg: ntp

