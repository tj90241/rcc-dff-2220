# Manage the module configuration file, make sure it's not loaded.
/etc/modprobe.d/pcspkr.conf:
  file.managed:
    - source: salt://kmods/pcspkr/files/pcspkr.conf

pcspkr:
  kmod.absent: []

