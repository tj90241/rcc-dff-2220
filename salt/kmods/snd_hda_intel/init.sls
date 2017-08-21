# If the module is already loaded and the configuration isn't applied, then
# the module parameters won't be applied until the next reboot. Oh well.

# Manage the module configuration file, make sure it's loaded.
/etc/modprobe.d/snd_hda_intel.conf:
  file.managed:
    - source: salt://kmods/snd_hda_intel/files/snd_hda_intel.conf
    - require_in:
      - kmod: snd_hda_intel

snd_hda_intel:
  kmod.present: []

