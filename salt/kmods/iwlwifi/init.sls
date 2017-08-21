# If the module is already loaded and the configuration isn't applied, then
# the module parameters won't be applied until the next reboot. Oh well.

{% set modules = ['iwlmvm', 'iwlwifi'] %}

# Manage the module configuration file, make sure it's loaded.
{% for module in modules %}
/etc/modprobe.d/{{ module }}.conf:
  file.managed:
    - source: salt://kmods/iwlwifi/files/{{ module }}.conf
    - require_in:
      - kmod: {{ module }}

{{ module }}:
  kmod.present: []
{% endfor %}

# Ensure that sure the firmware for the module(s) is installed.
{% if grains.os_family == 'Debian' %}
  {% set iwlwifi_package_name = 'firmware-iwlwifi' %}
{% elif grains.os_family == 'RedHat' %}
  {% set iwlwifi_package_name = 'kmod-iwlwifi' %}
{% endif %}

{{iwlwifi_package_name}}:
  pkg.installed:
    - require_in:
    {% for module in modules %}
      - kmod: {{ module }}
    {% endfor %}

