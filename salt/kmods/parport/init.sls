# Manage the module configuration file, make sure it's not loaded.
/etc/modprobe.d:
  file.recurse:
    - source: salt://kmods/parport/files
    - clean: False

ppdev:
  kmod.absent: []

parport_pc:
  kmod.absent: []

parport:
  kmod.absent: []

