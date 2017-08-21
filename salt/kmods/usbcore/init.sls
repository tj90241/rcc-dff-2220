# If the module is already loaded and the configuration isn't applied, then
# the module parameters won't be applied until the next reboot. Oh well.

# Manage the module configuration file, make sure it's loaded.
/etc/modprobe.d/usbcore.conf:
  file.managed:
    - source: salt://kmods/usbcore/files/usbcore.conf
    - require_in:
      - kmod: usbcore

usbcore:
  kmod.present: []

