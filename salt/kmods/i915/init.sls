# If the module is already loaded and the configuration isn't applied, then
# the module parameters won't be applied until the next reboot. Oh well.

# Manage the module configuration file, make sure it's loaded.
/etc/modprobe.d/i915.conf:
  file.managed:
    - source: salt://kmods/i915/files/i915.conf
    - require_in:
      - kmod: i915

i915:
  kmod.present: []

