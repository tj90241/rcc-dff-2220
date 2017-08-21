# Manage the module configuration file, make sure it's not loaded.
/etc/modprobe.d/psmouse.conf:
  file.managed:
    - source: salt://kmods/psmouse/files/psmouse.conf

psmouse:
  kmod.absent: []

