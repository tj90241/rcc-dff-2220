base:
  '*':
    - apt
    - kmods
    - minion
    - sysctl

  'dhcp*':
    - isc-dhcp-server

  'dns*':
    - bind9

  'git*':
    - git-daemon

  'ntp*':
    - ntp

