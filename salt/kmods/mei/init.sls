# If the module is already loaded and the configuration isn't applied, then
# the module parameters won't be applied until the next reboot. Oh well.

# Manage the module configuration file, make sure it's loaded.
/etc/modprobe.d/mei.conf:
  file.managed:
    - source: salt://kmods/mei/files/mei.conf
    - require_in:
      - kmod: mei_me
      - kmod: mei

mei_me:
  kmod.absent: []
 
mei:
  kmod.absent:
    - require:
      - kmod: mei_me

