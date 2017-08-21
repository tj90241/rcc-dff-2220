# Manage the module configuration file, make sure it's not loaded.
/etc/modprobe.d/floppy.conf:
  file.managed:
    - source: salt://kmods/floppy/files/floppy.conf

floppy:
  kmod.absent: []

